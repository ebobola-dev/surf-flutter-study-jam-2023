import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

//? Ну тут уже совсем костыли пошли
class NullableStateNotifierWrapper<T> extends StatelessWidget {
  final StateNotifier<T>? listenableState;
  final Widget Function(BuildContext context, T? value) whenNotNull;
  final Widget Function(BuildContext context) whenNull;
  const NullableStateNotifierWrapper({
    super.key,
    required this.listenableState,
    required this.whenNotNull,
    required this.whenNull,
  });

  @override
  Widget build(BuildContext context) {
    if (listenableState == null) {
      return whenNull(context);
    } else {
      return StateNotifierBuilder(
        listenableState: listenableState!,
        builder: whenNotNull,
      );
    }
  }
}
