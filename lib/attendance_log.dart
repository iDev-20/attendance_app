import 'package:flutter/material.dart';

class AttendanceLogScreen extends StatelessWidget {
  final List<Map<String, String>> attendanceData; // Simulated attendance data

  const AttendanceLogScreen({Key? key, required this.attendanceData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(30)),
        shadowColor: Colors.black,
        surfaceTintColor: Colors.black,
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Figtree',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        title: const Text('Attendance Log'),
      ),
      body: attendanceData.isEmpty
          ? const Center(child: Text('No attendance data found'))
          : ListView.builder(
              itemCount: attendanceData.length,
              itemBuilder: (context, index) {
                final record = attendanceData[index];
                return ListTile(
                  title: Text(record['studentName'] ?? 'Unknown Student'),
                  subtitle: Text('Marked at: ${record['timestamp']}'),
                  leading: const Icon(Icons.check_circle, color: Colors.green),
                );
              },
            ),
    );
  }
}
