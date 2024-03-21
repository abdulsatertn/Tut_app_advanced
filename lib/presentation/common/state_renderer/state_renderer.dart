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
    return Container();
  }

  Widget _getStateWidget() {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
      // TODO: Handle this case.
      case StateRendererType.popupErrorState:
      // TODO: Handle this case.
      case StateRendererType.fullScreenLoadingState:
      // TODO: Handle this case.
      case StateRendererType.fullScreenErrorState:
      // TODO: Handle this case.
      case StateRendererType.fullScreenEmptyState:
      // TODO: Handle this case.
      case StateRendererType.contentState:
      // TODO: Handle this case.
    }
  }

  Widget _getItemsColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
