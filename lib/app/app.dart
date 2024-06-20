import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart';
import 'package:test_app/feature/other/presentation/BLoCs/other_bloc.dart';
import 'package:test_app/feature/piramida/presentation/BLoCs/piramida_bloc.dart';
import 'package:test_app/feature/profile/presentation/BLoCs/profile_bloc.dart';
import 'package:test_app/shared/config/di/injection.dart';
import 'package:test_app/shared/config/flavors/flavor_config.dart';

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
        BlocProvider(create: (_) => getIt<OtherBloc>()),
        BlocProvider(create: (_) => getIt<ProfileBloc>()),
        BlocProvider(create: (_) => getIt<PiramidaBloc>()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru')],
        path: 'assets/translations',
        startLocale: const Locale('ru'),
        fallbackLocale: const Locale('en', 'US'),
        child: Builder(
          builder: (context) {
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              debugShowCheckedModeBanner: false,
              title: config.name,
              home: const Home(),
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
  final config = FlavorConfig.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.name),
      ),
      body: Column(
        children: [
          const Spacer(),
          BlocBuilder<PiramidaBloc, PiramidaState>(
            builder: (context, state) {
              return Center(
                child: state.maybeWhen(
                  orElse: () => const Text('Piramida'),
                  loading: () => const CircularProgressIndicator(),
                  success: (data) =>
                      Text('Id ${data.id}, title: ${data.title}'),
                  error: (message) => Text(message),
                ),
              );
            },
          ),
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
          BlocBuilder<OtherBloc, OtherState>(
            builder: (context, state) {
              return Center(
                child: state.maybeWhen(
                  orElse: () => const Text('Other'),
                  loading: () => const CircularProgressIndicator(),
                  success: (data) => Text(data),
                  error: (message) => Text(message),
                ),
              );
            },
          ),
          BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return Center(
                child: state.maybeWhen(
                  orElse: () => const Text('Profile'),
                  loading: () => const CircularProgressIndicator(),
                  success: (data) => Text(data),
                  error: (message) => Text(message),
                ),
              );
            },
          ),
          const Spacer(),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              context.setLocale(const Locale('en'));

              print(context.locale.toString());
              context.read<PiramidaBloc>().add(const PiramidaEvent.fetchData());
            },
            child: const Text('Fetch Data in Piramida'),
          ),
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
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              context.setLocale(const Locale('ru'));
              context.read<OtherBloc>().add(const OtherEvent.fetchData());
            },
            child: const Text('Fetch Data in Other'),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
            ),
            onPressed: () {
              context.read<ProfileBloc>().add(const ProfileEvent.fetchData());
            },
            child: const Text('Fetch Data in Profile'),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
