import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final bool loading;

  const Loader({super.key, required this.loading});

  @override
  Widget build(BuildContext context) {
    return loading
        ? Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: const Center(child: CircularProgressIndicator()),
    )
        : Container();
  }
}