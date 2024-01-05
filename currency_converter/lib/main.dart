import 'package:flutter/material.dart';

import 'pages/currency_converter_material_page.dart';

void main() {
  runApp(const MyApp());
}

// Types of widgets
// 1. Stateful Widgets
// 2. Stateless Widget
// 3. Inherited Widget

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyConverterMaterialPage(),
    );
  }
}
