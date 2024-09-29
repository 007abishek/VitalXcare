import 'package:flutter/material.dart';
import 'package:vitalxcare/homePage.dart';
import 'package:vitalxcare/booking.dart';

class DoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DoctorsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class DoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
        backgroundColor: Colors.blue.shade100,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search doctor..',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.filter_list),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Live Doctors',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            _buildLiveDoctorsSection(),
            SizedBox(height: 20),
            _buildPopularDoctorsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildLiveDoctorsSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildDoctorAvatar('assert/doctor1.jpeg'),
          _buildDoctorAvatar('assert/doctor2.jpeg'),
          _buildDoctorAvatar('assert/doctor3.jpeg'),
        ],
      ),
    );
  }

  Widget _buildDoctorAvatar(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage(imagePath),
      ),
    );
  }

  Widget _buildPopularDoctorsSection(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Popular Doctors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See All'),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                _buildDoctorCard(
                  context,
                  'Dr. Col Rajagopal A',
                  'Physician in PSG Hospital',
                  4.5,
                  17,
                  'assert/images/doctor8.jpeg',
                  'Dr. Col Rajagopal A has over 20 years of experience in internal medicine...',
                  '20 years',
                  'Mon-Fri: 9 AM - 5 PM',
                ),
                _buildDoctorCard(
                  context,
                  'Dr. Adithya Varma',
                  'Cardiologist in PSG Hospital',
                  4.5,
                  23,
                  'assert/images/doctor7.jpeg',
                  'Dr. Adithya Varma is renowned for his expertise in cardiology...',
                  '15 years',
                  'Mon-Sat: 10 AM - 6 PM',
                ),
                _buildDoctorCard(
                  context,
                  'Dr. Dharmadurai',
                  'Dermatologist in PSG Hospital',
                  4.5,
                  19,
                  'assert/images/doctor6.jpeg',
                  'Dr. Dharmadurai specializes in skin conditions and cosmetic dermatology...',
                  '18 years',
                  'Mon-Fri: 11 AM - 4 PM',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(
    BuildContext context,
    String name,
    String specialty,
    double rating,
    int reviewCount,
    String imagePath,
    String about,
    String experience,
    String availability,
  ) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.yellow[700]),
            Text('$rating ($reviewCount reviews)'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DoctorDetailsPage(
                doctorName: name,
                specialty: specialty,
                imagePath: imagePath,
                rating: rating,
                reviewCount: reviewCount,
                about: about,
                experience: experience,
                availability: availability,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DoctorDetailsPage extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imagePath;
  final double rating;
  final int reviewCount;
  final String about;
  final String experience;
  final String availability;

  DoctorDetailsPage({
    required this.doctorName,
    required this.specialty,
    required this.imagePath,
    required this.rating,
    required this.reviewCount,
    required this.about,
    required this.experience,
    required this.availability,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctorName),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(height: 20),
            Text(
              doctorName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              specialty,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellow[700]),
                Text('$rating ($reviewCount reviews)'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'About the Doctor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(about),
            SizedBox(height: 20),
            Text(
              'Experience: $experience',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Availability: $availability',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(
                      doctorName: doctorName,
                    ),
                  ),
                );
              },
              child: Text('Book Appointment'),
            ),
          ],
        ),
      ),
    );
  }
}
