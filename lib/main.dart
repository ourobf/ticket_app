import 'package:flutter/material.dart';
import 'package:tichet_app/base/bottom_nav_bar.dart';
import 'package:tichet_app/base/utils/app_routes.dart';
import 'package:tichet_app/screens/home/all_tickets.dart';
import 'package:tichet_app/screens/ticket/ticket_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        //Page à afficher par defaut : home page
        AppRoutes.homePage: (context) => const BottomNavBar(),
        AppRoutes.allTickets: (context) => const AllTickets(),
        AppRoutes.ticketScreen: (context) => const TicketScreen(),
      },
    );
  }
}
