import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

class Application extends StatelessWidget {
  Application() : super(key: const Key("Application"));

  final _router = AppRouter();
  final _supportedLocales = const [
    Locale('en'),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserRepository>(
          create: (_) => UserRepositoryImpl(UserRestClient(Dio())),
        ),
      ],
      child: MaterialApp.router(
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
      ),
    );
  }
}
