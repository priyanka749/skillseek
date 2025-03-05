import 'package:flutter/material.dart';
import 'package:skillseek/features/servicesavailable/presentation/view/service_available_view.dart';

class RequestSuccessPopup extends StatelessWidget {
  const RequestSuccessPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 60),
            const SizedBox(height: 10),
            const Text(
              'Request has been successfully sent to the service provider Priyanka Karki!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the popup
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ServiceListScreen()), // Navigate to ServiceListScreen
                );
              },
              child: const Text('Back to Services'),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to Show the Popup
void showRequestSuccessPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const RequestSuccessPopup(),
    barrierDismissible: false, // Prevent closing by tapping outside
  );
}
