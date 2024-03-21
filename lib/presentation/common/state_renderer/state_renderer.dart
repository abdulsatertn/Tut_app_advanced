import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:store_app_advanced/data/network/Failure.dart';
import 'package:store_app_advanced/presentation/resources/strings_manager.dart';

enum StateRendererType {
  //popup state (Dialog)
  popupLoadingState,
  popupErrorState,

  // Full screen state (full screen)
  fullScreenLoadingState,
  fullScreenErrorState,
  fullScreenEmptyState,

  // General state
  contentState,
}

class StateRenderer extends StatelessWidget {
  // it need 4 things ..
  // 1 the tyoe of stateRenderer
  // 2 the message will be showen
  // 3 title
  // 4 Function to use

  final StateRendererType stateRendererType;

  final String message;

  final String title;

  Function retryActionFunction;

  StateRenderer(
      {super.key,
      required this.stateRendererType,
      this.message = AppStrings.loading,
      this.title = '',
      required this.retryActionFunction});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
