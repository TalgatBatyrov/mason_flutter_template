import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart';
import 'package:test_app/feature/other/presentation/BLoCs/other_bloc.dart';
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
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: config.name,
            home: Scaffold(
              appBar: AppBar(
                title: Text(config.name),
              ),
              body: Column(
                children: [
                  const Spacer(),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Center(
                        child: state.maybeWhen(
                          orElse: () => const Text('Home'),
                          loading: () => const CircularProgressIndicator(),
                          success: (data) => Text(data),
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
                      context
                          .read<OtherBloc>()
                          .add(const OtherEvent.fetchData());
                    },
                    child: const Text('Fetch Data in Other'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      context
                          .read<ProfileBloc>()
                          .add(const ProfileEvent.fetchData());
                    },
                    child: const Text('Fetch Data in Profile'),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
