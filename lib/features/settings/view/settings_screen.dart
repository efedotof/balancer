import 'package:auto_route/auto_route.dart';
import 'package:balancer/constants.dart';
import 'package:balancer/features/home/cubit/balancer_cubit.dart';
import 'package:balancer/features/home/cubit/home_cubit.dart';
import 'package:balancer/features/settings/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>();
    context.read<BalancerCubit>();

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.appBarTitleSetting,
                style: AppTextStyles.appBarTitle),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Wrap(
              children: [
                 Card(
                  child: ListTile(
                    trailing: const Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                    title: const Text('О Приложении'),
                    onTap: () => context.read<SettingsCubit>().pushAbout(context),
                  ),
                ),
                Card(
                  child: ListTile(
                    trailing: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: const Text('Очистить всё'),
                    onTap: () => context.read<SettingsCubit>().clearAll(context),
                  ),
                ),
                
              ],
            ),
          ),
        );
      },
    );
  }
}
