import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:zoe/data/DarkMode.dart';
import 'package:zoe/pages/home.dart';
import 'package:zoe/service/scroll-behavior.dart';
import 'package:zoe/service/store.dart';
import 'package:zoe/widgets/default-scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool? _darkMode = await LocalStore.getBoolValue(key: "darkmode");
  final dk = Get.put(DarkMode());

  if (_darkMode == null)
    await LocalStore.writeValueBool(key: "darkmode", value: false);
  else
    dk.setDarkMode(_darkMode);

  runApp(
    GetBuilder<DarkMode>(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
        theme: dk.darkMode ? ThemeData.dark() : ThemeData.light(),
        home: DefaultScaffold(
          body: Home(),
        ),
      ),
    ),
  );
}
