import 'package:calendar_test_2/src/providers/calendar_provider.dart';
import 'package:calendar_test_2/src/screens/calendar_screen.dart';
import 'package:calendar_test_2/src/theme/app_theme.dart';
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
    return MaterialApp(
      title: 'CIM',
      initialRoute: '/', 
      showPerformanceOverlay: false,
      localizationsDelegates: const [
            //GlobalMaterialLocalizations.delegate,
            SfGlobalLocalizations.delegate
          ],
          //ignore: always_specify_types
          supportedLocales: const [
            Locale('es'),
            Locale('ca'),
            // ... other locales the app supports
          ],
          locale: const Locale('ca'),
    routes: {
        '/': (BuildContext context) => const CalendarScreen(),
        //'home': (BuildContext context) => HomeScreen(),
        //'calendarList': (BuildContext context) => CalendarsListScreen(),
        'calendar': (BuildContext context) => const CalendarScreen(),
        },
    theme: AppTheme.lightTheme,
    );
  }
}

