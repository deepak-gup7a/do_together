import 'package:flutter/material.dart';

class TimeDate{
  String getDateFromDateTime(DateTime date){
    return date.day.toString()+"-"+date.month.toString()+"-"+date.year.toString();
  }
  String getTimeFromDateTime(DateTime time){
    return time.hour.toString()+":"+time.minute.toString();
  }

  DateTime timeOfDayToDateTime(DateTime date,TimeOfDay time){
    return DateTime(date.year,date.month,date.day,time.hour,time.minute);
  }

  TimeOfDay dateTimeToTimeOfDate(DateTime time){
    return TimeOfDay(hour: time.hour, minute: time.minute);
  }

  DateTime dateTimeFromDateTime(DateTime time,DateTime picked){
    return DateTime(picked.year,picked.month,picked.day,time.hour,time.minute);
  }

}