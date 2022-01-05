import 'package:test_project/core/presentation/presentation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class ApplicationPlaceholder extends StatelessWidget {
  const ApplicationPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: CupertinoActivityIndicator(),
        ),
      ),
    );
  }
}

class Application extends StatelessWidget {
  Application() : super(key: const Key("Application"));

  final _router = AppRouter();
  final _supportedLocales = const [
    Locale('en'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: PresentationConstants.appName,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: _supportedLocales,
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
