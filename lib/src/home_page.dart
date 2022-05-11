import 'package:calendar_test_2/models/calendar_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'calendar_provider.dart';

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
      
            Container(height: 200),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future:  CimDB.db.getMeetings(),
                builder: (BuildContext context,  snapshot) {

                  if(!snapshot.hasData){
                      return const CircularProgressIndicator();
                    }else{
                      return showCalendar(snapshot.data);
                    }

                },
              ),
            ), 
            Container(height: 200),
          ],
        ));
  }

  SfCalendar showCalendar(lista) {

    return SfCalendar(
          showNavigationArrow: true,
          allowDragAndDrop: true,
          onTap: (dia){
            print("## dia a grabar ${dia.date}");
          },
          // agregados como prueba dos dias no validos, sabado y domingo 
          blackoutDates: <DateTime>[
            DateTime(2022, 05, 14),
            DateTime(2022, 05, 15)
          ],
          backgroundColor:const Color.fromARGB(255, 223, 237, 192),
          view: CalendarView.month,
          dataSource: MeetingDataSource(lista),
          monthViewSettings: const MonthViewSettings(
                //agendaStyle: AgendaStyle(),
                monthCellStyle: MonthCellStyle(
                todayBackgroundColor: Color.fromARGB(255, 230, 208, 215),
                backgroundColor: Color.fromARGB(133, 184, 210, 252)),
                agendaItemHeight: 30,
                agendaViewHeight: 20,
                showAgenda: false, //true para que muestre la agenda es la parte inferior, util si hay mas de un evento por dia
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
                
          );
  }

}