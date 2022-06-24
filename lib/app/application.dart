import 'package:flutter/services.dart';
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
  Application({Key? key, this.defaultLocale}) : super(key: key);
  final Locale? defaultLocale;

  @visibleForTesting
  final router = AppRouter();

  @override
  Widget build(BuildContext context) {
    _setEdgeToEdgeUIMode();
    return MaterialApp.router(
      title: PresentationConstants.appName,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: router.delegate(),
      routeInformationParser: router.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      locale: defaultLocale,
      theme: theme,
    );
  }

  void _setEdgeToEdgeUIMode() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }
}
