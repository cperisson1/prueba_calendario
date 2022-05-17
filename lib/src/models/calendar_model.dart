import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:convert';

class Meeting {

    Meeting({
       required this.eventName, 
       required this.from, 
       required this.to, 
       required this.background, 
       required this.isAllDay,
       this.calendar
    });  

   String eventName;
   DateTime from;
   DateTime to;
   Color background;
   bool isAllDay;
   String? calendar;
  
  //-

    factory Meeting.fromJson(String str) => Meeting.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    //crea la instancia desde los datos en json
    factory Meeting.fromMap(Map<String, dynamic> json) => Meeting(
        eventName: json["eventName"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["from"]), // de momento el TO no se usa, repite el from
        background: Colors.indigo, // json["background"],
        isAllDay: json['isAllDay']=='0'?false:true,
        calendar: json["calendar"],
    );

    Map<String, dynamic> toMap() => {
        "eventName": eventName,
        "from": from,
        "to": to,
        "background": background,
        "isAllDay": isAllDay,
        "calendar": calendar,
    };
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Calendar {

    Calendar({
       required this.id, 
       required this.title, 
    });  

   int id;
   String title;
  
  //-

    factory Calendar.fromJson(String str) => Calendar.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    //crea la instancia desde los datos en json
    factory Calendar.fromMap(Map<String, dynamic> json) => Calendar(
        id: json["id"],
        title: json["id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title
    };
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.

