import 'package:flutter/material.dart';
import 'package:mechine_test/model/models.dart';
import 'package:mechine_test/view/schedule_page.dart';

class LandingPage extends StatefulWidget {
  final Schedule? initialSchedule;
  final Scheduleday? initialScheduleday;

  const LandingPage({this.initialSchedule, this.initialScheduleday});

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Schedule schedule = Schedule();
  Scheduleday scheduleDay = Scheduleday();

  // Initialize with default values
  String generateDisplayText(Schedule schedule) {
    List<String> availableSlots = [];

    for (var day in schedule.availability.keys) {
      final timeSlots = schedule.availability[day]!;
      final allTimeSlotsAvailable =
          timeSlots.values.every((isAvailable) => isAvailable == true);

      if (allTimeSlotsAvailable) {
        availableSlots.add('$day whole day');
      } else {
        final availableTimeSlots =
            timeSlots.keys.where((timeSlot) => timeSlots[timeSlot] == true);

        if (availableTimeSlots.isNotEmpty) {
          availableSlots.add('$day ${availableTimeSlots.join(', ')}');
        }
      }
    }

    if (availableSlots.isEmpty) {
      return "No schedule available";
    }

    return "Hi Jose, you are available on " + availableSlots.join('; ');
  }

  // String generateDisplayText(Schedule schedule) {
  //   List<String> availableSlots = [];

  //   for (var day in schedule.availability.keys) {
  //     final timeSlots = schedule.availability[day]!;
  //     final availableTimeSlots =
  //         timeSlots.keys.where((timeSlot) => timeSlots[timeSlot] == true);

  //     if (availableTimeSlots.isNotEmpty) {
  //       availableSlots.add('$day ${availableTimeSlots.join(', ')}');
  //     }
  //   }

  //   if (availableSlots.isEmpty) {
  //     return "No schedule available";
  //   }

  //   return "Hi Jose, you are available on " + availableSlots.join('; ');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduler App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
              width: 330,
              child: Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Text(
                  generateDisplayText(schedule),
                  style: TextStyle(fontSize: 20),
                ),
              )),
          ElevatedButton(
            onPressed: () {
              _navigateToSchedulingPage();
            },
            child: Text(generateDisplayText(schedule).contains("No schedule")
                ? "Add Schedule"
                : "Edit Schedule"),
          ),
        ],
      ),
    );
  }

  void _navigateToSchedulingPage() async {
    final updatedSchedule = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SchedulingPage(
                schedule,
              )),
    );
    if (updatedSchedule != null) {
      setState(() {
        schedule = updatedSchedule;
      });
    }
  }
}
