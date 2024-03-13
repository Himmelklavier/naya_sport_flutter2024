import 'package:flutter/material.dart';
import 'package:naya_sport_sebas/data/repositories/login/uniformes_repository.dart';
import 'package:naya_sport_sebas/ui/pages/screens/naya_sport_screen.dart';
import 'package:naya_sport_sebas/ui/providers/selected_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<UniformesRepository>(UniformesRepository());

  runApp(
    ChangeNotifierProvider<SelectedScreenProvider>(
      create: (context) => SelectedScreenProvider(),
      child: const NayaSportStore(),
    ),
  );
}
