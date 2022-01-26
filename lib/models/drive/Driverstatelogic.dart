// // import 'package:flutter/material.dart';
// // import 'dart:io';

// import 'package:activity_recognition_flutter/activity_recognition_flutter.dart';
// // import 'package:permission_handler/permission_handler.dart';

// class Driverstatelogic {
//   Stream<ActivityEvent> activityStream;
//   ActivityEvent latestActivity = ActivityEvent.empty();
//   List<ActivityEvent> _events = [];
//   ActivityRecognition activityRecognition = ActivityRecognition.instance;

//   void startTracking() {
//     activityStream =
//         activityRecognition.startStream(runForegroundService: true);
//     activityStream.listen(onData);
//     print(activityStream.toList());
//   }

//   void update() {
//     activityStream.listen(onData);
//   }

//   void onData(ActivityEvent activityEvent) {
//     print(activityEvent.toString());
//     _events.add(activityEvent);
//     latestActivity = activityEvent;
//   }
// }
