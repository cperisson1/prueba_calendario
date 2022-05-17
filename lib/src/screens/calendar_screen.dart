
import 'package:calendar_test_2/src/models/calendar_model.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../providers/calendar_provider.dart';

/// The hove page which hosts the calendar
class CalendarScreen extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
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
      firstDayOfWeek: 1,
          showNavigationArrow: true,
          todayHighlightColor: Colors.black,
          allowDragAndDrop: true,
          headerStyle: const CalendarHeaderStyle(textStyle: TextStyle(color:Colors.red,fontSize: 20, fontWeight:FontWeight.bold),),
          viewHeaderStyle: const ViewHeaderStyle(dayTextStyle: TextStyle(color:Colors.red,fontWeight: FontWeight.bold),),
          onTap: (dia){
            print("## dia a grabar ${dia.date}");
          },
          // agregados como prueba dos dias no validos, sabado y domingo 
          blackoutDates: <DateTime>[
            DateTime(2022, 05, 14),
            DateTime(2022, 05, 15)
          ],
          backgroundColor:const Color.fromARGB(255, 255, 255, 255),
          view: CalendarView.month,
          selectionDecoration:BoxDecoration(
          color: Colors.transparent,
            border:
              Border.all(color: const Color.fromARGB(255, 255, 68, 68),
                    width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            shape: BoxShape.rectangle,
        ) ,
          cellBorderColor: Colors.red,
          dataSource: MeetingDataSource(lista),
          monthViewSettings: const MonthViewSettings(
                //agendaStyle: AgendaStyle(),
                monthCellStyle: MonthCellStyle(
                todayBackgroundColor: Color.fromARGB(255, 255, 38, 0),
                backgroundColor: Color.fromARGB(133, 255, 255, 255)),
                agendaItemHeight: 30,
                agendaViewHeight: 20,
                showAgenda: false, //true para que muestre la agenda es la parte inferior, util si hay mas de un evento por dia
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator),
                
          );
  }

}