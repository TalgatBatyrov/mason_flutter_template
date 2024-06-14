import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/feature/auth/presentation/BLoCs/auth_bloc.dart';
import 'package:test_app/feature/home/presentation/BLoCs/home_bloc.dart';
import 'package:test_app/shared/config/di/injection.dart';
import 'package:test_app/shared/config/flavors/flavor_config.dart';
// import 'package:test_app/feature/home/presentation/pages/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final config = FlavorConfig.instance;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
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
                        child: state.map(
                          initial: (_) => const Text('Initial'),
                          loading: (_) => const CircularProgressIndicator(),
                          success: (data) => Text(data.data),
                          error: (message) => Text(message.message),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Center(
                        child: state.map(
                          initial: (_) => const Text('Auth'),
                          loading: (_) => const CircularProgressIndicator(),
                          success: (data) => Text(data.data),
                          error: (message) => Text(message.message),
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
                    child: const Text('Fetch Data'),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      context.read<AuthBloc>().add(const AuthEvent.fetchData());
                    },
                    child: const Text('Fetch Data'),
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
