import 'package:docfinder/core/configs/styles/app_colors.dart';
import 'package:flutter/material.dart';

/// Widget with a default AppBar leading icon and action
class AppBarLeading extends StatefulWidget {
  /// Creates a new instance of [AppBarLeading]
  const AppBarLeading({super.key});

  @override
  State<AppBarLeading> createState() => _AppBarLeadingState();
}

class _AppBarLeadingState extends State<AppBarLeading>
    with SingleTickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..forward();

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Center(
        child: ClipOval(
          child: Material(
            borderOnForeground: true,
            shape: CircleBorder(
              side: BorderSide(color: AppColors.grey.withOpacity(.2)),
            ),
            color: AppColors.white,
            child: InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
