import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vitalxcare/homePage.dart';
import 'package:vitalxcare/notification.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    HomePage(),
    Schedule(),
    Notificationpage(),
  ];

  Row generateDatePages() {
    List<Widget> pages = [];

    // Get the current date
    DateTime now = DateTime.now();

    // Calculate the date 30 days from today
    DateTime endDate = now.add(Duration(days: 30));

    // Iterate over each day until the endDate
    DateTime currentDate = now;
    while (currentDate.isBefore(endDate.add(Duration(days: 1)))) {
      // Format the date using intl package
      String formattedDate = DateFormat('dd').format(currentDate);

      // Format the day using intl package
      String formattedDay = DateFormat('EEEE').format(currentDate);
      formattedDay = formattedDay.substring(0, 3);

      // Create a page widget for the current date and day
      Widget page = ElevatedButton(
        onPressed: () {
          setState(() {
            // Update the UI as needed when the button is pressed
            print("Date selected: $formattedDate, $formattedDay");
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1C6BA4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Container(
          width: 70,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDate,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                formattedDay,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      );

      // Add the page to the list of pages
      pages.add(page);
      pages.add(SizedBox(width: 10));

      // Increment currentDate by 1 day
      currentDate = currentDate.add(Duration(days: 1));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: pages,
            ),
          ),
        ),
      ],
    );
  }

  final List<Widget> slides_1 = [
    SizedBox(height: 20),
    Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 113, 179, 226),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 22),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "9:30",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Dr Minoko",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Galappathi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              icon: Icon(Icons.more_horiz),
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 20),
    Center(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 193, 134),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 22),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "10:30",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Dr Anuruddha",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Paadeniya",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () {
                // Add your onPressed logic here
              },
              icon: Icon(Icons.more_horiz),
              color: Colors.white,
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 20),
    Center(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 112, 234, 171),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 22),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "9:30",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Dr Minoko",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Galappathi",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Row pages = generateDatePages();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFDCEDF9),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Schedule',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(Icons.calendar_month),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Expanded(child: pages)],
                  ),
                ),
                Column(children: slides_1),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Color(0xFFDCEDF9),
          onTap: (value) {
            setState(() {
              _selectedIndex = value;
            });
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => _pages[value]),
            );
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.schedule),
              label: 'Schedules',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Report',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notifications',
            ),
          ],
        ),
      ),
    );
  }
}
