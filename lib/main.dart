//main 
import 'package:flutter/material.dart';
import 'package:test_tac_toc_game/controller.dart';
import 'package:test_tac_toc_game/ui.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return UI(gameController: controller);
  }
}

