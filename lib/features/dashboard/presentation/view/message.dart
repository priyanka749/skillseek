import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skillseek/features/dashboard/presentation/view/dashboard_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Entire screen background white
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1F4A9B),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF1F4A9B),
          ),
        ),
      ),
      home: const MessageBoxScreen(),
    );
  }
}

// Success Screen (Service Block Placeholder)
class SuccessScreen extends StatelessWidget {
  final String message;
  final String dateTime;

  const SuccessScreen(
      {super.key, required this.message, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background for success screen
      appBar: AppBar(
        title: const Text('Booking Confirmed'),
        backgroundColor: const Color(0xFF1F4A9B),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'Booking Successful!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F4A9B),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Message: "$message"',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Scheduled for: $dateTime',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DashboardView()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1F4A9B),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Back to Home',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageBoxScreen extends StatefulWidget {
  const MessageBoxScreen({super.key});

  @override
  _MessageBoxScreenState createState() => _MessageBoxScreenState();
}

class _MessageBoxScreenState extends State<MessageBoxScreen> {
  TextEditingController messageController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1F4A9B),
              onPrimary: Colors.white,
            ),
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1F4A9B),
              onPrimary: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Ensure scaffold is white
      appBar: AppBar(
        title: const Text('Message Box'),
        backgroundColor: const Color(0xFF1F4A9B),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Write your message:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F4A9B),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message here...',
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.white, // White background for text field
                  contentPadding: const EdgeInsets.all(16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F4A9B),
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F4A9B),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F4A9B),
                      width: 2,
                    ),
                  ),
                ),
                maxLines: 4,
                cursorColor: const Color(0xFF1F4A9B),
              ),
              const SizedBox(height: 24),
              const Text(
                'Select a Date and Time:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F4A9B),
                ),
              ),
              const SizedBox(height: 12),
              InkWell(
                onTap: () => _selectDate(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for date container
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF1F4A9B),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: Color(0xFF1F4A9B),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        DateFormat('dd/MM/yyyy').format(selectedDate),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F4A9B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () => _selectTime(context),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white, // White background for time container
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF1F4A9B),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color(0xFF1F4A9B),
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        selectedTime.format(context),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1F4A9B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  final String message = messageController.text;
                  final String dateTime =
                      '${DateFormat('dd/MM/yyyy').format(selectedDate)} ${selectedTime.format(context)}';
                  if (message.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Booked with message: "$message" on $dateTime',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                        // behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                    // Navigate to SuccessScreen after 1-second delay
                    Future.delayed(const Duration(seconds: 1), () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SuccessScreen(
                            message: message,
                            dateTime: dateTime,
                          ),
                        ),
                      );
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Please write a message'),
                        backgroundColor: Colors.red[400],
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
