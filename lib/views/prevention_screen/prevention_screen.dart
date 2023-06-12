import 'package:flutter/material.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const PageStorageKey<String>('prevention'),
      body: SafeArea(child: Text('data')),
    );
  }
}
