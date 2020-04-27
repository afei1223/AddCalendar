import 'dart:async';

import 'package:add_calendar/Calendars.dart';
import 'package:flutter/services.dart';

class AddCalendar {
  static const MethodChannel _channel =
      const MethodChannel('add_calendar');

  //添加事件
  static Future<String> createEvent(Calendars calendars) async {
    final String eventId = await _channel.invokeMethod('createEvent', <String, dynamic>{
      'title': calendars.getTitle,
      'beginTime': calendars.getBeginTime.millisecondsSinceEpoch,
      'endTime': calendars.getEndTime.millisecondsSinceEpoch,
      'alert': calendars.getAlert,
      'note': calendars.getNote,
      'allDay':calendars.getAllDay,
    });
    return eventId;
  }

  //删除提醒事件
  static Future<bool> deleteEvent(String eventId) async{
    final bool res = await _channel.invokeMethod('deleteEvent', <String, dynamic>{'eventId': eventId});
    return res;
  }

  //更新提醒事件
  static Future<String> updateEvent(Calendars calendars) async {
    final String resId = await _channel.invokeMethod('updateEvent', <String, dynamic>{
      'eventId': calendars.getEventId,
      'title': calendars.getTitle,
      'beginTime': calendars.getBeginTime.millisecondsSinceEpoch,
      'endTime': calendars.getEndTime.millisecondsSinceEpoch,
      'alert': calendars.getAlert,
      'note': calendars.getNote,
      'allDay':calendars.getAllDay,
    });
    return resId;
  }

  //查询是否有读权限
  //若无，自动请求权限
  // ignore: non_constant_identifier_names
  static Future<bool> CheckReadPermission() async{
    final bool res = await _channel.invokeMethod('CheckReadPermission');
    return res;
  }

  //查询写日历的权限
  //若无，自动请求权限
  // ignore: non_constant_identifier_names
  static Future<bool> CheckWritePermission() async{
    final bool res = await _channel.invokeMethod('CheckWritePermission');
    return res;
  }


}
