import 'package:docfinder/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Generic AsyncValueWidget to work with values of type T
class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    required this.value,
    required this.data,
    super.key,
    this.customErrorWidget,
  });

  // input async value
  final AsyncValue<T> value;

  // output builder function
  final Widget Function(T) data;

  final Widget? customErrorWidget;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: AppLoader.new,
      error: (error, stackTrace) =>
          customErrorWidget ??
          const Center(
            child: ErrorView(),
          ),
    );
  }
}
