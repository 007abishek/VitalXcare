import 'package:flutter/material.dart';
import 'package:vitalxcare/homePage.dart';

class Patientslist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PatientListPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PatientListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate to the home page when back button is pressed
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        title: Text(
          'Patients',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar with filter icon
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.grey),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search patient...',
                      ),
                    ),
                  ),
                  Icon(Icons.tune, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 24),
            // Patient List header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Patient List',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('See All'),
                ),
              ],
            ),
            SizedBox(height: 16),
            // Patient List
            Expanded(
              child: ListView(
                children: [
                  PatientCard(
                    name: 'Rohith Ashraf',
                    age: '19 yrs old',
                    condition: 'Malignant Tumour',
                    imagePath:
                        'assert/images/rohith.jpg', // Image path from assets
                  ),
                  PatientCard(
                    name: 'Hardik Pandya',
                    age: '27 yrs old',
                    condition: 'Acne Problem',
                    imagePath:
                        'assert/images/hardik.jpg', // Image path from assets
                  ),
                  PatientCard(
                    name: 'NAVEEN KUMAR',
                    age: '20 yrs old',
                    condition: 'Diarrhoea Problem',
                    imagePath:
                        'assert/images/naveen.jpg', // Image path from assets
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy HomePage widget to navigate back to

class PatientCard extends StatelessWidget {
  final String name;
  final String age;
  final String condition;
  final String imagePath;

  PatientCard({
    required this.name,
    required this.age,
    required this.condition,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Image.asset(
            imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(age),
            Text(condition),
          ],
        ),
        onTap: () {
          // Navigate to the home page when a patient is tapped
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
          );
        },
      ),
    );
  }
}
