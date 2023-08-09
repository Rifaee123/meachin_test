import 'package:flutter/material.dart';
import 'package:mechine_test/model/models.dart';

class SchedulingPage extends StatefulWidget {
  final Schedule initialSchedule;

  SchedulingPage(this.initialSchedule);

  @override
  _SchedulingPageState createState() => _SchedulingPageState();
}

class _SchedulingPageState extends State<SchedulingPage> {
  late Schedule currentSchedule;
  final Scheduleday currentday = Scheduleday();

  @override
  void initState() {
    super.initState();
    currentSchedule = widget.initialSchedule;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Schedule'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: currentSchedule.availability.length,
            itemBuilder: (context, index) {
              final day = currentSchedule.availability.keys.toList()[index];
              final timeSlots = currentSchedule.availability[day]!;
              final isDayAvailable =
                  timeSlots.values.any((available) => available);
              final currentdays = currentday.availability.keys.elementAt(index);
              bool? ischecked = currentday.availability[currentdays]!;

              return Row(
                children: [
                  Checkbox(
                    shape: CircleBorder(),
                    activeColor: Colors.green,
                    value: ischecked,
                    onChanged: (bool? value) {
                      setState(() {
                        currentday.availability[currentdays] = value!;
                        // for (var key in timeSlots.keys) {
                        //   timeSlots[key] = value!;
                        // }
                      });
                    },
                  ),
                  SizedBox(width: 40, child: Text(currentdays)),
                  currentday.availability[currentdays] == true
                      ? SizedBox(
                          width: 260,
                          height: 40,
                          child: Row(
                            children: [
                              for (var timeslot in timeSlots.keys)
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(
                                        color: timeSlots[timeslot]!
                                            ? Colors.purple
                                            : Colors.grey,
                                      ),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        setState(() {
                                          timeSlots[timeslot] =
                                              !timeSlots[timeslot]!;
                                        });
                                      },
                                      child: Text(
                                        timeslot,
                                        style: TextStyle(
                                          color: timeSlots[timeslot]!
                                              ? Colors.purple
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        )
                      : Text('Unavalable')
                ],
              );
            },
          ),
          Container(
            width: 200,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.purple),
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () {
                  Navigator.pop(context, currentSchedule);
                },
                child: Text('save')),
          )
        ],
      ),
    );
  }
}
