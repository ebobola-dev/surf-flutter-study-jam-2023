import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/app_providers.dart';
import 'package:surf_flutter_study_jam_2023/assets/themes/app_theme.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/database.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/screens/ticker_storage/ticket_storage_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.init();
  runApp(const AppProviders(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Tour',
      debugShowCheckedModeBanner: false,
      theme: getThemeData(context),
      home: const TicketStorageScreen(),
    );
  }
}
