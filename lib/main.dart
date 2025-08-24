import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_colors/pages/lucky_colors_home/lucky_colors_home_binding.dart';
import 'package:lucky_colors/pages/lucky_colors_home/lucky_colors_home_view.dart';
import 'package:lucky_colors/pages/lucky_colors_prosperity/lucky_colors_prosperity_binding.dart';
import 'package:lucky_colors/pages/lucky_colors_prosperity/lucky_colors_prosperity_view.dart';
import 'package:lucky_colors/pages/lucky_colors_setting/lucky_colors_setting_binding.dart';
import 'package:lucky_colors/pages/lucky_colors_setting/lucky_colors_setting_view.dart';
import 'package:lucky_colors/pages/lucky_colors_type_of_lucky/lucky_colors_type_of_lucky_binding.dart';
import 'package:lucky_colors/pages/lucky_colors_type_of_lucky/lucky_colors_type_of_lucky_view.dart';


import 'db_lucky_colors/db_lucky_colors.dart';

Color primaryColor = const Color(0xFF29ABE2);
Color bgColor = const Color(0xFFF7F7F7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await Get.putAsync(() => DB().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: Amin,
          initialRoute: '/luckyColorsHome',
          theme: ThemeData(
            useMaterial3: true,
            primaryColor: primaryColor,
            scaffoldBackgroundColor: bgColor,
            colorScheme: ColorScheme.light(primary: primaryColor),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              scrolledUnderElevation: 0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Color(0xFF0F0F0F),
              ),
              backgroundColor: Colors.white,
            ),
            inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        );
      },
    );
  }
}
List<GetPage<dynamic>> Amin = [
  GetPage(
    name: '/luckyColorsHome',
    page: () => LuckyColorsHomePage(),
    binding: LuckyColorsHomeBinding(),
  ),
  GetPage(
    name: '/luckyColorsTypeOfLucky',
    page: () => LuckyColorsTypeOfLuckyPage(),
    binding: LuckyColorsTypeOfLuckyBinding(),
  ),
  GetPage(
    name: '/luckyColorsProsperity',
    page: () => LuckyColorsProsperityPage(),
    binding: LuckyColorsProsperityBinding(),
  ),
  GetPage(
    name: '/luckyColorsSetting',
    page: () => LuckyColorsSettingPage(),
    binding: LuckyColorsSettingBinding(),
  ),
];