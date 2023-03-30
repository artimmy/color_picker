import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color pickerColor = Colors.red;
  int colorValue = 0;
  String colorHexValue = 'HEX';

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
    getColorHexValue();
    getColorValue();
  }

  void getColorHexValue() {
    setState(() {
      colorHexValue =
          pickerColor.value.toRadixString(16).substring(2).toUpperCase();
    });
  }

  void getColorValue() {
    setState(() {
      colorValue = pickerColor.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Picker Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Color Picker'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorPicker(
                pickerColor: pickerColor,
                onColorChanged: changeColor,
                labelTypes: const [
                  ColorLabelType.rgb,
                  ColorLabelType.hsv,
                  ColorLabelType.hsl
                ],
                pickerAreaHeightPercent: 0.8,
                colorPickerWidth: 500,
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: getColorValue,
              //   child: const Text('Get Color'),
              // ),
              // const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: getColorHexValue,
              //   child: const Text('Get Hexadecimal Color'),
              // ),
              const SizedBox(height: 20),
              SelectableText(
                colorValue.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SelectableText(
                colorHexValue,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
