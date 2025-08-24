import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

import 'lucky_colors_home_logic.dart';

class LuckyColorsHomePage extends GetView<LuckyColorsHomeController> {
  const LuckyColorsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home_bg.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 2.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'assets/setting.png',
                    width: 40.w,
                    height: 40.h,
                  ),
                ).gestures(
                  onTap:
                      () => Get.toNamed(
                        '/luckyColorsSetting',
                      ),
                ),
                SizedBox(height: 194.h),
                _buildDescription(),
                SizedBox(height: 70.h),
                _buildActionButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'THE LUCKY\nCOLORS',
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              height: 1.2,
            ),
          ),
          SizedBox(height: 30.h),
          Text(
            "Here's the auspicious colors for each day of the week, based on Asian traditional beliefs",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton() {
    return GestureDetector(
      onTap: () => Get.toNamed('/luckyColorsTypeOfLucky'),
      child: Container(
        width: double.infinity,
        height: 79.h,
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Color(0xFF29ABE2),
          borderRadius: BorderRadius.circular(40.h),
        ),
        child: Center(
          child: Text(
            'Check Today\'s Colors',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
