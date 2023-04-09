import 'package:flutter/material.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';

class ScaleOnCreate extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const ScaleOnCreate({
    Key? key,
    required this.child,
    this.duration = Animations.mediumSpeed,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => ScaleOnCreateState();
}

class ScaleOnCreateState extends State<ScaleOnCreate>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Animations.curve,
    );

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: widget.child,
    );
  }
}
