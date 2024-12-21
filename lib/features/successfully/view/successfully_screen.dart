import 'package:auto_route/auto_route.dart';
import 'package:balancer/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

@RoutePage()
class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen({super.key, required this.subtitle});
  
  final String subtitle;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()=> context.maybePop(), icon: const Icon(Icons.close)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animation/test1.json'),
          const SizedBox(height: 30,),
           Text(S.of(context).successfully, style: const TextStyle(fontSize: 22, ),),
          Text(subtitle, style: const TextStyle(fontSize: 18, ),)
        ],
      ),
    );
  }
}