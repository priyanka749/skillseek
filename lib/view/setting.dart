import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _CartState();
}

class _CartState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Setting'),
    );
  }
}
