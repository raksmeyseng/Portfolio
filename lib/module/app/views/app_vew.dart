import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_portfolio/config/routes/application.dart';
import 'package:my_portfolio/constants/app_constant.dart';
import 'package:my_portfolio/languages/generated/l10n.dart';
import 'package:my_portfolio/module/app/bloc/app_bloc.dart';
import 'package:my_portfolio/shared/enum/language_enum.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return MaterialApp.router(
          title: AppConstant.appName,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: state.theme.themeData,
          supportedLocales: S.delegate.supportedLocales,
          locale: state.language.getLocale(),
          routerConfig: Application.router,
          builder: (context, child) {
            return child!;
          },
        );
      },
    );
  }
}
