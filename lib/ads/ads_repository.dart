import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:yandex_mobileads/mobile_ads.dart';



class AdsRepository with WidgetsBindingObserver {
  late final Future<AppOpenAdLoader> _adLoader;
  AppOpenAd? _ad;
  
  static var isAdShowing = false;
  static var isColdStartAdShow = false;


  String adUnitId = 'R-M-11819422-1';

  Future<void> initAds() async {
    MobileAds.setUserConsent(true);
    MobileAds.initialize();
    MobileAds.setDebugErrorIndicator(true);
    _adLoader = _createAppOpenAdLoader();
    _loadAppOpenAd();
    WidgetsBinding.instance.addObserver(this);
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    if(state == AppLifecycleState.resumed){
      _showAdIsAvailable();
    }
  }


  Future<AppOpenAdLoader> _createAppOpenAdLoader() async {
    return AppOpenAdLoader.create(
      onAdLoaded: (AppOpenAd appOpenAd) {
        _ad = appOpenAd;
        if(!isColdStartAdShow){
          _showAdIsAvailable();
          isColdStartAdShow = true;
        }
      },
      onAdFailedToLoad: (error) {
        _ad = null;
      },
    );
  }

  Future<void> _loadAppOpenAd() async{
    final adLoader = await _adLoader;
    await adLoader.loadAd(adRequestConfiguration: AdRequestConfiguration(adUnitId: adUnitId));
  }

  Future<void> _showAdIsAvailable() async{
    var appOpenAd = _ad;
    if(appOpenAd != null && !isAdShowing){
      _setAdEventListener(appOpenAd: appOpenAd);
      await appOpenAd.show();
      await appOpenAd.waitForDismiss();

    }else{
      _loadAppOpenAd();
    }
  }


  
  void _setAdEventListener({required AppOpenAd appOpenAd}) {
    appOpenAd.setAdEventListener(eventListener: AppOpenAdEventListener(
      onAdShown: () {
        log('>>>> onAdShow', name: 'ads');
        isAdShowing = true;
      },
      onAdFailedToShow: (error) {
        log('>>>> onAdFailedToShow', name: 'ads');
        isAdShowing = false;
        _clearAppOpenAd();
        _loadAppOpenAd();
      },
      onAdDismissed: () {
           log('>>>> onAdDismissed', name: 'ads');
        isAdShowing = false;
        _clearAppOpenAd();
        _loadAppOpenAd();
      },
      onAdClicked: () {
          log('>>>> onAdClicked', name: 'ads');
      },
      onAdImpression: (impressionData) {
         log('>>>> onAdImpression ${impressionData.getRawData()}', name: 'ads');
      },
    ));
  }
  
  void _clearAppOpenAd() {
    _ad!.destroy();
    _ad = null;
  }
}
