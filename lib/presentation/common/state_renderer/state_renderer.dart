import 'dart:js';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store_app_advanced/data/network/Failure.dart';
import 'package:store_app_advanced/presentation/resources/color_manger.dart';
import 'package:store_app_advanced/presentation/resources/font_manager.dart';
import 'package:store_app_advanced/presentation/resources/strings_manager.dart';
import 'package:store_app_advanced/presentation/resources/style_manager.dart';
import 'package:store_app_advanced/presentation/resources/values_manager.dart';

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
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
      // TODO: Handle this case.
      case StateRendererType.popupErrorState:
      // TODO: Handle this case.
      case StateRendererType.fullScreenLoadingState:
      // TODO: Handle this case.
      case StateRendererType.fullScreenErrorState:
        return _getItemsColumn([
          _getAnimatedImage(),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain, context)
        ]);

      case StateRendererType.fullScreenEmptyState:
        return _getItemsColumn([
          _getAnimatedImage(),
          _getMessage(message),
        ]);
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

  Widget _getAnimatedImage() {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Container(), // TODO: add json image here
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p8),
        child: Text(
          message,
          style: getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s18),
        ),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p18),
        child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  if (stateRendererType ==
                      StateRendererType.fullScreenErrorState) {
                    // call retry function
                    retryActionFunction.call();
                  } else {
                    // popup error state
                    Navigator.of(context).pop();
                  }
                },
                child: Text(buttonTitle))),
      ),
    );
  }
}
