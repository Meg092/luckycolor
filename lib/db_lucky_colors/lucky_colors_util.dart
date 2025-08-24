import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_entity.dart';

void successToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.green,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void errorToast(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

class ColorGenerator {
  static ColorMeaning? getColorMeaning(String colorName) {
    return colorMeanings[colorName];
  }

  static Map<String, ColorMeaning> getAllColorMeanings() {
    return Map.from(colorMeanings);
  }

  static List<String> getColorsForTableType(String tableType) {
    switch (tableType.toLowerCase()) {
      case 'prosperity':
        return [
          'Red',
          'Orange',
          'Yellow',
          'Amber',
          'Green',
          'Pink',
          'Magenta',
          'Lime',
          'Deep Purple',
          'Light Blue',
        ];
      case 'wealth':
        return [
          'Amber',
          'Green',
          'Blue',
          'Purple',
          'Brown',
          'Yellow',
          'Gray',
          'Teal',
          'Indigo',
          'Black',
        ];
      case 'fortune':
        return [
          'Purple',
          'Blue',
          'Cyan',
          'Indigo',
          'White',
          'Magenta',
          'Teal',
          'Deep Purple',
          'Light Green',
          'Gray',
        ];
      default:
        return colors;
    }
  }

  static List<String> generateUniqueColorsForTable(
    String tableType,
    int count,
  ) {
    final suitableColors = getColorsForTableType(tableType);
    List<String> availableColors = List.from(suitableColors);
    List<String> selectedColors = [];
    final random = Random();

    for (int i = 0; i < count && availableColors.isNotEmpty; i++) {
      int index = random.nextInt(availableColors.length);
      selectedColors.add(availableColors[index]);
      availableColors.removeAt(index);
    }

    return selectedColors;
  }

  static String generateRandomColorForTable(String tableType) {
    final suitableColors = getColorsForTableType(tableType);
    final random = Random();
    return suitableColors[random.nextInt(suitableColors.length)];
  }

  static List<LuckyColorsEntity> generateWeeklyColorsForTable(
    String tableType,
  ) {
    List<LuckyColorsEntity> weeklyColors = [];

    for (int i = 0; i < 7; i++) {
      List<String> colors = generateUniqueColorsForTable(tableType, 4);
      List<String> luckyColors = colors.sublist(0, 2);
      List<String> unluckyColor = colors.sublist(2, 4);

      weeklyColors.add(
        LuckyColorsEntity(
          day: weekDays[i],
          luckyColor1: luckyColors[0],
          luckyColor2: luckyColors[1],
          unluckyColor1: unluckyColor[0],
          unluckyColor2: unluckyColor[1],
        ),
      );
    }

    return weeklyColors;
  }
}

Color hexToColor(String hexString) {
  if (!hexString.startsWith('#')) {
    return colorNameToColor(hexString);
  }

  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Color colorNameToColor(String colorName) {
  switch (colorName.toLowerCase()) {
    case 'red':
      return Colors.red;
    case 'blue':
      return Colors.blue;
    case 'green':
      return Colors.green;
    case 'yellow':
      return Colors.yellow;
    case 'purple':
      return Colors.purple;
    case 'orange':
      return Colors.orange;
    case 'pink':
      return Colors.pink;
    case 'brown':
      return Colors.brown;
    case 'black':
      return Colors.black;
    case 'white':
      return Colors.white;
    case 'gray':
      return Colors.grey;
    case 'cyan':
      return Colors.cyan;
    case 'magenta':
      return Color(0xFFFF00FF);
    case 'teal':
      return Colors.teal;
    case 'indigo':
      return Colors.indigo;
    case 'lime':
      return Colors.lime;
    case 'amber':
      return Colors.amber;
    case 'deep purple':
      return Colors.deepPurple;
    case 'light blue':
      return Colors.lightBlue;
    case 'light green':
      return Colors.lightGreen;
    default:
      return Colors.grey;
  }
}
