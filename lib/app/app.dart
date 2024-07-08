import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart';
import 'package:test_app/shared/config/di/injection.dart';
import 'package:test_app/shared/config/flavors/flavor_config.dart';
import 'package:test_app/shared/ui/themes/dark_theme.dart';
import 'package:test_app/shared/ui/themes/light_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final config = FlavorConfig.instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<HomeBloc>()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        startLocale: const Locale('ru'),
        fallbackLocale: const Locale('en', 'US'),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: config.name,
              routerConfig: getIt<GoRouter>(),
              darkTheme: AppDarkTheme.theme,
              theme: AppLightTheme.theme,
            );
          },
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isEnglish = true;
  final config = FlavorConfig.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.name),
      ),
      body: Column(
        children: [
          Text('error'.tr()),
          const Spacer(),
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Center(
                child: state.maybeWhen(
                  orElse: () => Text('error'.tr()),
                  loading: () => const CircularProgressIndicator(),
                  success: (data) =>
                      Text('Id ${data.id}, title: ${data.title}'),
                  error: (message) => Text(message),
                ),
              );
            },
          ),
          Switch(
            value: isEnglish,
            onChanged: (value) {
              if (value) {
                isEnglish = true;
                context.setLocale(const Locale('en'));
              } else {
                isEnglish = false;
                context.setLocale(const Locale('ru'));
              }
              setState(() {});
            },
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              context.read<HomeBloc>().add(const HomeEvent.fetchData());
            },
            child: const Text('Fetch Data in Home'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
