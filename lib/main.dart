import 'package:flutter/material.dart';
import 'package:naya_sport_sebas/ui/pages/screens/naya_sport_screen.dart';
import 'package:naya_sport_sebas/ui/providers/selected_screen_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<SelectedScreenProvider>(
      create: (context) => SelectedScreenProvider(),
      child: const NayaSportStore(),
    ),
  );
}
