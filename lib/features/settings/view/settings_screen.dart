import 'package:auto_route/auto_route.dart';
import 'package:balancer/Theme/cubit/theme_cubit.dart';
import 'package:balancer/Theme/language/cubit/language_cubit.dart';
import 'package:balancer/features/settings/cubit/settings_cubit.dart';
import 'package:balancer/generated/l10n.dart';
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
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:  Padding(
              padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
              child: Text(S.of(context).settings,
                  ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            child: Wrap(
              children: [
               Card(
                  child: ListTile(
                    trailing: const Icon(
                      Icons.language,
                      color: Colors.yellow,
                    ),
                    title:  Row(
                      children: [
                        Text(S.of(context).language),
                        const SizedBox(width: 10,),
                        Text(context.watch<LanguageCubit>().checkLocale()),
                      ],
                    ),
                    onTap: () => context.read<SettingsCubit>().selectLanguage(context),
                  ),
                ),
                BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Card(
                    child: ListTile(
                      title: Text(S.of(context).theme),
                      trailing: Switch(
                          value: state.isDark,
                          onChanged: (value) => _setTheme(context, value)),
                    ),
                  );
                },
              ),
              const SizedBox(height: 40,),

                 Card(
                  child: ListTile(
                    trailing: const Icon(
                      Icons.info,
                      color: Colors.green,
                    ),
                    title:  Text(S.of(context).aboutTheApp),
                    onTap: () => context.read<SettingsCubit>().pushAbout(context),
                  ),
                ),
                Card(
                  child: ListTile(
                    trailing: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title:  Text(S.of(context).clear_everything),
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

  _setTheme(BuildContext context, bool value) {
    context
        .read<ThemeCubit>()
        .setThemBrigth(value ? Brightness.dark : Brightness.light);
  }
}
