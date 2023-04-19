import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surf_flutter_study_jam_2023/config/animations.dart';

class TicketMenuButton extends StatelessWidget {
  final bool show;
  final String iconPath;
  final String text;
  final VoidCallback onTap;
  final TextStyle textStyle;
  final Color color;
  final Color disabledColor;
  final BorderRadius? borderRadius;
  final double rightMargin;
  const TicketMenuButton({
    super.key,
    this.show = true,
    required this.iconPath,
    required this.text,
    required this.color,
    required this.disabledColor,
    required this.textStyle,
    required this.onTap,
    this.borderRadius,
    this.rightMargin = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Animations.mediumSpeed,
      reverseDuration: Animations.mediumSpeed,
      curve: Animations.curve,
      child: Builder(builder: (context) {
        if (!show) return SizedBox();
        return Material(
          color: Colors.transparent,
          borderRadius: borderRadius,
          child: InkWell(
            onTap: onTap,
            borderRadius: borderRadius,
            child: Container(
              width: 80.0,
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 6.0,
              ),
              margin: EdgeInsets.only(right: rightMargin),
              decoration: BoxDecoration(
                borderRadius: borderRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    iconPath,
                    width: 20.0,
                    colorFilter: ColorFilter.mode(
                      color,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    text,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
