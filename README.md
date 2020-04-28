# add_calendar

A new Flutter plugin.

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.


## 使用方法

具体使用方法见main.dart

```
void CalendarsInit() {
    //更新参数
    calendars.setEventId = '111';
    calendars.setTitle = 'hola2';
    calendars.setAlert = [3,15];
    calendars.setBeginTime = DateTime(2020,5,2,12,34);
    calendars.setEndTime = DateTime(2020,5,2,12,35);
    calendars.setNote = '这里不是备注内容/🐶';
  }

  Future<void> createEvent(Calendars calendars) async {
    //查询是否有读权限。
    await AddCalendar.CheckReadPermission().then((res) async {
      if(res){
        //查询是否有写权限
        await AddCalendar.CheckWritePermission().then((resWrite){
          if(resWrite){
            AddCalendar.createEvent(calendars);
          }
        });
      }
    });
  }
```