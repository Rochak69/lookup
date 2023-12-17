import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {super.key,
      this.appBar,
      this.backgroundColor,
      this.body,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset,
      this.drawer,
      this.extendBody = false,});
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Widget? drawer;
  final bool extendBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      backgroundColor: backgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
    );
  }
}
