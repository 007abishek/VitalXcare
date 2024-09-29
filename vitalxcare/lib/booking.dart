import 'package:flutter/material.dart';
import 'package:vitalxcare/confirmation.dart';

class BookingPage extends StatefulWidget {
  final String doctorName;

  BookingPage({required this.doctorName});

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final nameController = TextEditingController();
  final contactController = TextEditingController();
  final notesController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    contactController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
        backgroundColor: Colors.blue.shade100,
      ),
      // Prevent overflow when keyboard appears
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book an appointment with ${widget.doctorName}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),

              // Date Picker
              Text('Select Date:'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
                child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
              ),
              SizedBox(height: 20),

              // Time Picker
              Text('Select Time:'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
                child: Text('${selectedTime.format(context)}'),
              ),
              SizedBox(height: 20),

              // Name Input
              Text('Name:'),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Contact Number Input
              Text('Contact Number:'),
              TextFormField(
                controller: contactController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your contact number',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact number';
                  } else if (value.length != 10) {
                    return 'Contact number must be 10 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),

              // Optional Notes
              Text('Notes (optional):'),
              TextField(
                controller: notesController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter any additional notes (optional)',
                ),
              ),
              SizedBox(height: 20),

              // Confirm Appointment Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Navigate to confirmation page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingConfirmationPage(
                            doctorName: widget.doctorName,
                            date: selectedDate,
                            time: selectedTime,
                            name: nameController.text,
                            contact: contactController.text,
                            notes: notesController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text('Confirm Appointment'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
