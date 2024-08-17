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
    // String dateString = "2024-08-08 05:00:21.979853";
    // DateTime currentDate = DateTime.parse(dateString);
    // print(currentDate.toString());
    String shiftForGroupA = getShiftForDate(2, currentDate);
    String shiftForGroupB = getShiftForDate(3, currentDate);
    String shiftForGroupC = getShiftForDate(0, currentDate);
    String shiftForGroupD = getShiftForDate(1, currentDate);

    String currentShift = getCurrentShift(currentDate);
    // print("----------------------------------------------------------------");
    // print(currentDate.toString());
    // // print(currentShift.toString());

    // print(shiftForGroupD.toString() + " Shift D");
    // print(shiftForGroupA.toString() + " Shift A");
    // print(shiftForGroupB.toString() + " Shift B");

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
    // Define the start and end times for shift 1
    DateTime shiftStartTime =
        DateTime(currentDate.year, currentDate.month, currentDate.day, 22, 0);
    DateTime shiftEndTime = shiftStartTime.add(Duration(hours: 8));

    // Determine the current shift
    String currentShift = getCurrentShift(currentDate);

    if (currentShift == "Shift 1") {
      // Check if the currentDate is within the Shift 1 period
      if (currentDate.isAfter(shiftStartTime) ||
          currentDate.isBefore(shiftEndTime)) {
        // If currentDate is before 06:00, consider it part of the previous day
        DateTime referenceDate = currentDate.isBefore(shiftEndTime)
            ? currentDate.subtract(Duration(days: 1))
            : currentDate;

        int daysSinceStart = referenceDate.difference(startDate).inDays;
        int shiftRotation =
            (daysSinceStart ~/ rotationInterval) % shifts.length;
        return shifts[(groupInitialShiftIndex + shiftRotation) % shifts.length];
      }
    }

    // For other shifts, or if not in Shift 1 period, use the regular calculation
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
