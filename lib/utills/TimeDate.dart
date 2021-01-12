import 'package:flutter/material.dart';

class TimeDate{
  String getDateFromDateTime(DateTime date){
    return date.day.toString()+"-"+date.month.toString()+"-"+date.year.toString();
  }
  String getTimeFromDateTime(DateTime time){
    return time.hour.toString()+":"+time.minute.toString();
  }

  DateTime timeOfDayToDateTime(TimeOfDay time){
    DateTime temp = DateTime.now();
    return DateTime(temp.year,temp.month,temp.hour,time.hour,time.minute);
  }

  TimeOfDay dateTimeToTimeOfDate(DateTime time){
    return TimeOfDay(hour: time.hour, minute: time.minute);
  }

}