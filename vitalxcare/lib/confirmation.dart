import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  final String doctorName;
  final DateTime date;
  final TimeOfDay time;
  final String name;
  final String contact;
  final String notes;

  BookingConfirmationPage({
    required this.doctorName,
    required this.date,
    required this.time,
    required this.name,
    required this.contact,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Confirmed'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 100),
            SizedBox(height: 20),
            Text(
              'Appointment Confirmed!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text('Doctor: $doctorName', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Date: ${date.toLocal()}'.split(' ')[0],
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Time: ${time.format(context)}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Patient: $name', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Contact: $contact', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            if (notes.isNotEmpty)
              Text('Notes: $notes', style: TextStyle(fontSize: 18)),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
