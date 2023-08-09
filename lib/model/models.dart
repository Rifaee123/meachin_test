class Schedule {
  Map<String, Map<String, bool>> availability = {
    'Sun': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Mon': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Tue': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Wed': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Thu': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Fri': {'Morning': false, 'Afternoon': false, 'Evening': false},
    'Sat': {'Morning': false, 'Afternoon': false, 'Evening': false},
  };

 

  
}
class Scheduleday {
  Map<String, bool> availability = {
    'Sun': false,
    'Mon': false,
    'Tue': false,
    'Wed': false,
    'Thu': false,
    'Fri': false,
    'Sat': false,
  };
}

