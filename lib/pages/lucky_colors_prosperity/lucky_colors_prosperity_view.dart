import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_util.dart';
import 'package:lucky_colors/pages/lucky_colors_prosperity/color_meanings_page.dart';
import 'package:styled_widget/styled_widget.dart';

import 'lucky_colors_prosperity_logic.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_entity.dart';

class LuckyColorsProsperityPage
    extends GetView<LuckyColorsProsperityController> {
  const LuckyColorsProsperityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildTopBar(),
              SizedBox(height: 8.h),
              _buildHeader(),
              SizedBox(height: 20.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Obx(() {
                    if (controller.luckyColorsList.length == 1) {
                      return ColorMeaningsPage(
                        day: controller.selectedDay!,
                        colorData: controller.luckyColorsList.first,
                      );
                    } else {
                      final widgets = <Widget>[];
                      for (var colorData in controller.luckyColorsList) {
                        widgets.add(_buildDayCard(colorData));
                        widgets.add(SizedBox(height: 12.h));
                      }
                      widgets.add(SizedBox(height: 20.h));
                      return Column(
                        children: widgets,
                      ).paddingSymmetric(horizontal: 16.w);
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Container(
      height: 40.h,
      alignment: Alignment.centerLeft,
      child: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
        size: 18.sp,
      ).gestures(onTap: () => Get.back()),
    );
  }

  Widget _buildHeader() {
    return Obx(
      () => Column(
        children: [
          Image.asset(controller.icon.value, width: 72.w, height: 69.w),
          SizedBox(height: 20.h),
          Text(
            controller.selectedLuckType == "Fortune" ? "Love" : controller.selectedLuckType ?? '',
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDayCard(LuckyColorsEntity colorData) {
    return Container(
      width: 311.w,
      height: 168.h,
      padding: EdgeInsets.all(11.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        children: [
          Text(
            colorData.day ?? '',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F0F0F),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              _buildColorSection(
                title: 'Lucky Color',
                backgroundColor: Color(0xFFFFE2E2),
                colors: [
                  if (colorData.luckyColor1 != null)
                    hexToColor(colorData.luckyColor1!),
                  if (colorData.luckyColor2 != null)
                    hexToColor(colorData.luckyColor2!),
                ],
              ),
              SizedBox(width: 12.w),
              _buildColorSection(
                title: 'Unlucky color',
                backgroundColor: Color(0xFFE2E4FF),
                colors: [
                  if (colorData.unluckyColor1 != null)
                    hexToColor(colorData.unluckyColor1!),
                  if (colorData.unluckyColor2 != null)
                    hexToColor(colorData.unluckyColor2!),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildColorSection({
    required String title,
    required Color backgroundColor,
    required List<Color> colors,
  }) {
    return Expanded(
      child: Container(
        width: 138.w,
        height: 96.h,
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F0F0F),
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                for (int i = 0; i < colors.length; i++) ...[
                  _buildColorCircle(colors[i]),
                  if (i < colors.length - 1) SizedBox(width: 10.w),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorCircle(Color color) {
    return Container(
      width: 43.w,
      height: 43.h,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
