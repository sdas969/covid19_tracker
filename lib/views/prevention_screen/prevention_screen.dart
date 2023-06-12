import 'package:flutter/material.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      key: PageStorageKey<String>('prevention'),
      body: SafeArea(child: Text('data')),
    );
  }
}
