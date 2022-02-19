library with_loader;

import 'package:flutter/material.dart';

class WithLoader<T> extends StatefulWidget {
  /// Function reference that you want to execute while your [child] is loading
  final Future<T> Function() future;

  /// Widget on which you want to having loading functionality
  final Widget child;

  /// Widget that replaces your [child] while your [child] is in loading state
  final Widget? loader;

  /// [onSuccess] or [onFailure] will execute based on this condition
  final bool Function(T) successCondition;

  /// Executes when [successCondition] is true
  final VoidCallback? onSuccess;

  /// Executes when [successCondition] is false
  final VoidCallback? onFailure;

  /// Alignment for [loader]. Defaults to [Alignment.center].
  final Alignment loaderAlignment;

  /// Opacity of [child] while it is in loading state. Defaults to 0.5.
  final double onLoadingOpacity;

  const WithLoader({
    Key? key,
    required this.future,
    required this.child,
    this.loader,
    required this.successCondition,
    this.onSuccess,
    this.onFailure,
    this.loaderAlignment = Alignment.center,
    this.onLoadingOpacity = 0.5,
  }) : super(key: key);

  @override
  _WithLoaderState<T> createState() => _WithLoaderState<T>();
}

class _WithLoaderState<T> extends State<WithLoader<T>>
    with TickerProviderStateMixin {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: widget.loaderAlignment,
      children: [
        GestureDetector(
          onTap: () async {
            if (!isLoading) {
              setState(() {
                isLoading = true;
              });
              // Function executed
              var result = await widget.future();
              // Condition for success
              final isSuccess = widget.successCondition(result);

              if (isSuccess) {
                setState(() {
                  isLoading = false;
                });
                // If function is not null then execute
                widget.onSuccess?.call();
              } else {
                setState(() {
                  isLoading = false;
                });
                // If function is not null then execute
                widget.onFailure?.call();
              }
            }
          },
          child: Opacity(
            opacity: isLoading ? widget.onLoadingOpacity : 1.0,
            child: widget.child,
          ),
        ),
        if (isLoading)
          widget.loader != null
              ? widget.loader!
              : CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
      ],
    );
  }
}
