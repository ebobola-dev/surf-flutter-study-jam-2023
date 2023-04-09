import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';
import 'package:surf_flutter_study_jam_2023/features/ticket_storage/domian/services/download.dart';

class AppProviders extends StatelessWidget {
  final Widget child;
  const AppProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Dio()),
        Provider(create: (context) => DownloadService(context.read<Dio>())),
      ],
      child: child,
    );
  }
}
