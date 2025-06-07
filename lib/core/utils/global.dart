import 'package:flutter/material.dart';

class Global {
  Global._privateConstructor();
  static final Global _instance = Global._privateConstructor();

  static Global get instance => _instance;
  // Your global variables
  static late String appName;
  String? jwtToken;

  factory Global() {
    return _instance;
  }

  Global._internal();

// class DefaultShaderWarmUp extends ShaderWarmUp {
//   @override
//   Future<void> warmUpOnCanvas(Canvas canvas) async {
//     final paint = Paint()
//       ..shader = const LinearGradient(
//         colors: [Colors.blue, Colors.red],
//       ).createShader(Rect.fromLTRB(
//           0,
//           0,
//           canvas.getDestinationClipBounds().width,
//           canvas.getDestinationClipBounds().height));
//
//     canvas.drawRect(
//       Rect.fromLTRB(0, 0, canvas.getDestinationClipBounds().width,
//           canvas.getDestinationClipBounds().height),
//       paint,
//     );
//   }
// }
}

class CustomShaderWarmUp extends ShaderWarmUp {
  @override
  Future<void> warmUpOnCanvas(Canvas canvas) async {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Colors.blue, Colors.red],
      ).createShader(const Rect.fromLTRB(0, 0, 100, 100));

    canvas.drawRect(const Rect.fromLTRB(0, 0, 100, 100), paint);
  }
}

void setupShaderWarmup() {
  CustomShaderWarmUp().execute();
}
