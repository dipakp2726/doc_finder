import 'package:docfinder/features/doctor/view/booking_confirmation.dart';
import 'package:docfinder/features/doctor/view/my_bookings_page.dart';
import 'package:docfinder/features/doctor/view/doctor_list_page.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _index = 0;

  final pages = const [DoctorListPage(), MyBookingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (value) {
          setState(() => _index = value);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Bookings',
          ),
        ],
      ),
    );
  }
}
