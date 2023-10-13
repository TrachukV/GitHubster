import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:githubster/bloc/search_bloc/search_bloc.dart';
import 'package:githubster/resources/app_theme.dart';
import 'package:githubster/routes/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const GitHubster(),
  );
}

class GitHubster extends StatelessWidget {
  const GitHubster({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => SearchBloc()..add(InitializeEvent()),
      child: MaterialApp(
        title: 'GitHubster',
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRouter.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
