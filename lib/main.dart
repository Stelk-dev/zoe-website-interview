import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zoe/pages/home.dart';

class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
      };
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
      home: Home(),
    ),
  );
}
