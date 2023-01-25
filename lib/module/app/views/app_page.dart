import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/config/routes/application.dart';
import 'package:my_portfolio/module/app/bloc/app_bloc.dart';
import 'package:my_portfolio/module/app/views/app_vew.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => Application.appBloc..add(const AppStarted()),
        ),
      ],
      child: const AppView(),
    );
  }
}
