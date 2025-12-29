import 'package:flutter/material.dart';
import 'package:flutter_date_time_range_picker/flutter_date_time_range_picker.dart';

typedef DateRangeChangedCallback = void Function(DateRange? dateRange);
typedef DayTileBuilder = Widget Function(
  BuildContext context,
  DayModel day,
  CalendarTheme theme,
  ValueChanged<DateTime> onDateChanged,
);

typedef DateRangerPickerWidgetBuilder = Widget Function(
  BuildContext context,
  DateRangeChangedCallback onDateRangeChanged,
  ValueNotifier<RangeValues> timeRangeNotifier,
);
