import 'dart:async';

import 'package:SiPandu/core_package.dart';

class ShiftSchedule {
  final List<String> shifts = ["Shift 2", "Shift 3", "Shift 1", "Off"];
  final int rotationInterval = 2; // hari
  final DateTime startDate = DateTime(2024, 6, 1); // Tanggal mulai: 1 Juni 2024
  late StreamController<Map<String, String>> _controller;
  Timer? _timer;

  ShiftSchedule() {
    _controller = StreamController<Map<String, String>>();
    // _initializeShiftGroups();
    _startTimer();
  }

  Stream<Map<String, String>> get shiftStream => _controller.stream;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _emitCurrentShiftAndGroup(); // Emit data setiap detik
    });
  }

  void _emitCurrentShiftAndGroup() {
    DateTime currentDate = DateTime.now();
    String currentShift = getCurrentShift(currentDate);
    String activeGroup = getActiveGroupForCurrentShift();
    String formattedDate = DateFormat('dd MMMM yyyy').format(currentDate);

    _controller.sink.add({
      'currentShift': currentShift,
      'activeGroup': activeGroup,
      'currentDate': formattedDate,
    });
  }

  String getCurrentShift(DateTime currentTime) {
    int hour = currentTime.hour;

    if (hour >= 22 || hour < 6) {
      return "Shift 1"; // 23:00 - 06:00
    } else if (hour >= 7 && hour < 15) {
      return "Shift 2"; // 07:00 - 15:00
    } else if (hour >= 15 && hour < 22) {
      return "Shift 3"; // 16:00 - 22:00
    } else {
      return "Off";
    }
  }

  String getActiveGroupForCurrentShift() {
    DateTime currentDate = DateTime.now();
    String shiftForGroupA = getShiftForDate(2, currentDate);
    String shiftForGroupB = getShiftForDate(3, currentDate);
    String shiftForGroupC = getShiftForDate(0, currentDate);
    String shiftForGroupD = getShiftForDate(1, currentDate);

    String currentShift = getCurrentShift(currentDate);

    if (currentShift == shiftForGroupA) {
      return "Grup A";
    } else if (currentShift == shiftForGroupB) {
      return "Grup B";
    } else if (currentShift == shiftForGroupC) {
      return "Grup C";
    } else if (currentShift == shiftForGroupD) {
      return "Grup D";
    } else {
      return "Tidak ada grup aktif";
    }
  }

  String getShiftForDate(int groupInitialShiftIndex, DateTime currentDate) {
    int daysSinceStart = currentDate.difference(startDate).inDays;
    int shiftRotation = (daysSinceStart ~/ rotationInterval) % shifts.length;
    return shifts[(groupInitialShiftIndex + shiftRotation) % shifts.length];
  }

  DateTime getCurrentDate() {
    return DateTime.now();
  }

  void dispose() {
    _controller.close();
    _timer?.cancel();
  }
}
