import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/strings_manager.dart';

class ConnectionErrorWidget extends StatelessWidget {
  final VoidCallback? callback;
  final String? message;

  const ConnectionErrorWidget({
    Key? key,
    required this.callback,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
          message ??  AppStrings.connectionError.tr,
          ),
        ],
      ),
    );
  }
}

class UnexpectedErrorWidget extends StatelessWidget {
  final VoidCallback? callback;
  final String? message;

  const UnexpectedErrorWidget({
    Key? key,
    required this.callback,
    required this.message
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
           message?? AppStrings.unExpectedError.tr,
          ),

        ],
      ),
    );
  }
}

class InternalServerErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.serverError.tr,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ForbiddenErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.forbiddenError.tr,
      ),
    );
  }
}

class BadRequestErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.badRequestError.tr,
      ),
    );
  }
}

class NotFoundErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.notFoundError.tr,
      ),
    );
  }
}

class UnauthorizedErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.unauthorizedError.tr,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String message;

  const CustomErrorWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

abstract class ErrorViewer {
  static void showConnectionError(
    BuildContext context,
    VoidCallback? callback, {
    ScaffoldState? scaffoldState,
  }) {
    final snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            AppStrings.connectionError.tr,
          ),
        ],
      ),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void showCustomErrorWithButtonCallBack(
    BuildContext context,
    String msg,
    VoidCallback callback, {
    ScaffoldState? scaffoldState,
  }) {
    final snackbar = SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            msg,
          ),

        ],
      ),
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void showCustomError(BuildContext context, String? message,
      {ScaffoldState? scaffoldState}) {
    final snackbar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        message ?? '',
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void showUnexpectedError(BuildContext context,
      {ScaffoldState? scaffoldState}) {
    final snackbar = SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      content: Text(
        AppStrings.unExpectedError.tr,
      ),
    );
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
