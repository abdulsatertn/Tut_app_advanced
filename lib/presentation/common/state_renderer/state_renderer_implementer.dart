import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store_app_advanced/app/constants.dart';
import 'package:store_app_advanced/presentation/common/state_renderer/state_renderer.dart';
import 'package:store_app_advanced/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}
// loading state (popup , full screen)

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String? message;

  LoadingState(
      {required this.stateRendererType, String message = AppStrings.loading});
  @override
  String getMessage() => message ?? AppStrings.loading;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// error state (popup , full screen)

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// content state

class ContentState extends FlowState {
  ContentState();
  @override
  String getMessage() => Constants.empty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.contentState;
}

// empty state

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.fullScreenEmptyState;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // show popup lpading
            showPopUp(context, getStateRendererType(), getMessage());

            // show content of the screen
            return contentScreenWidget;
          } else {
            // full screen loading state
            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRendererType(),
              retryActionFunction: retryActionFunction,
            );
          }
        }

      case ErrorState:
        {
          break;
        }

      case EmptyState:
        {
          break;
        }

      case ContentState:
        {
          break;
        }

      default:
        {
          break;
        }
    }
  }

  showPopUp(
    BuildContext context,
    StateRendererType stateRendererType,
    String message,
  ) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
          context: context,
          builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              retryActionFunction: () {})),
    );
  }
}
