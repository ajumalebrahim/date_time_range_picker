import 'package:flutter/material.dart';

import 'package:flutter_date_time_range_picker/flutter_date_time_range_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date and time range picker example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Date and time range picker example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 100),
              const Text("The simple form field example:"),
              Container(
                padding: const EdgeInsets.all(8),
                width: 250,
                child: DateRangeFormField(
                  labelBuilder: (dateRange) {
                    return "Days between ${dateRange.start.toIso8601String().substring(0, 10)} and ${dateRange.end.toIso8601String().substring(0, 10)}: ${dateRange.duration} day(s)";
                  },
                  decoration: const InputDecoration(
                    label: Text("Date and time range picker"),
                    hintText: 'Please select a date and time range',
                  ),
                  pickerBuilder: (context, onDateRangeChanged,
                          timeRangeNotifier) =>
                      datePickerBuilder(context, onDateRangeChanged,
                          timeRangeNotifier, false),
                ),
              ),
            ],
          ),
        ));
  }

  Widget datePickerBuilder(
    BuildContext context,
    DateRangeChangedCallback onDateRangeChanged,
    ValueNotifier<RangeValues> timeRangeNotifier, [
    bool doubleMonth = true,
  ]) =>
      DateRangePickerWidget(
        firstDayOfWeek: 1, // 1 = Monday
        doubleMonth: doubleMonth,
        maximumDateRangeLength: 10,
        quickDateRanges: [
          QuickDateRange(dateRange: null, label: "Remove date range"),
          QuickDateRange(
            label: 'Last 3 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 3)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 7 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 7)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 30 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 30)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 90 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 90)),
              DateTime.now(),
            ),
          ),
          QuickDateRange(
            label: 'Last 180 days',
            dateRange: DateRange(
              DateTime.now().subtract(const Duration(days: 180)),
              DateTime.now(),
            ),
          ),
        ],
        minimumDateRangeLength: 3,
        initialDateRange: selectedDateRange,
        disabledDates: [DateTime(2023, 11, 20)],
        maxDate: DateTime(2023, 12, 31),
        initialDisplayedDate:
            selectedDateRange?.start ?? DateTime(2023, 11, 20),
        onDateRangeChanged: onDateRangeChanged,
        timeRangeNotifier: timeRangeNotifier,
        height: 450,
        theme: const CalendarTheme(
          selectedColor: Colors.blue,
          dayNameTextStyle: TextStyle(color: Colors.black45, fontSize: 10),
          inRangeColor: Color(0xFFD9EDFA),
          inRangeTextStyle: TextStyle(color: Colors.blue),
          selectedTextStyle: TextStyle(color: Colors.white),
          todayTextStyle: TextStyle(fontWeight: FontWeight.bold),
          defaultTextStyle: TextStyle(color: Colors.black, fontSize: 12),
          radius: 10,
          tileSize: 40,
          disabledTextStyle: TextStyle(color: Colors.grey),
          quickDateRangeBackgroundColor: Color(0xFFFFF9F9),
          selectedQuickDateRangeColor: Colors.blue,
        ),
      );
}
