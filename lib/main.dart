import 'package:calendar_test_2/src/pages/calendar_provider.dart';
import 'package:calendar_test_2/src/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';


void main() {
  return runApp(AppState());
}


class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CimDB(), lazy: false),
      ],
      child: CalendarApp(),
    );
  }
}



class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Pruebas calendario', 
    localizationsDelegates: [
        //GlobalMaterialLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      //ignore: always_specify_types
      supportedLocales: [
        Locale('es'),
        Locale('ca'),
        // ... other locales the app supports
      ],
      locale: Locale('ca'),
    
    home: MyHomePage());
  }
}

