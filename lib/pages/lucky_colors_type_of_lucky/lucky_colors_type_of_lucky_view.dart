import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_colors/main.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'lucky_colors_type_of_lucky_logic.dart';

class LuckyColorsTypeOfLuckyPage
    extends GetView<LuckyColorsTypeOfLuckyController> {
  const LuckyColorsTypeOfLuckyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.selectedDay.value)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Center(
              child: SvgPicture.asset(
                'assets/refresh_black.svg',
                width: 40.w,
                height: 40.w,
              ).gestures(onTap: controller.showDaySelectionDialog),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    _buildTitle(),
                    Expanded(child: _buildLuckTypeCards()),
                    _buildSelectButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      margin: EdgeInsets.only(top: 20.h, bottom: 16.h),
      child: Text(
        'Choosing Types of Luck for Today',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
          color: Color(0xFF0F0F0F),
        ),
      ).alignment(Alignment.center),
    );
  }

  Widget _buildLuckTypeCards() {
    return Obx(
      () => ListView(
        children: [
          _buildLuckCard(
            title: 'Prosperity',
            subtitle: 'Achieving Economic and Social Flourishing',
            icon: Image.asset('assets/prosperity.png'),
            bgImg: Image.asset(
              controller.selectedLuckType.value == 'Prosperity'
                  ? 'assets/card_bg.png'
                  : 'assets/card_bg_dark.png',
            ),
            onTap: () => controller.chooseTypeOfLucky(0),
          ),

          SizedBox(height: 19.h),

          _buildLuckCard(
            title: 'Wealth',
            subtitle: 'Strategies for Financial Success',
            icon: Image.asset('assets/wealth.png'),
            bgImg: Image.asset(
              controller.selectedLuckType.value == 'Wealth'
                  ? 'assets/card_bg.png'
                  : 'assets/card_bg_dark.png',
            ),
            onTap: () => controller.chooseTypeOfLucky(1),
          ),

          SizedBox(height: 19.h),

          _buildLuckCard(
            title: 'Love',
            subtitle: 'Beyond Luck and\nDestiny',
            icon: Image.asset('assets/fortune.png'),
            bgImg: Image.asset(
              controller.selectedLuckType.value == 'Fortune'
                  ? 'assets/card_bg.png'
                  : 'assets/card_bg_dark.png',
            ),
            onTap: () => controller.chooseTypeOfLucky(2),
          ),
        ],
      ),
    );
  }

  Widget _buildLuckCard({
    required String title,
    required String subtitle,
    required Image icon,
    required Image bgImg,
    required Function() onTap,
  }) {
    return Container(
      height: 114.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(image: bgImg.image),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 70.h,
            margin: EdgeInsets.only(left: 16.w),
            child: icon,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ).gestures(onTap: onTap);
  }

  Widget _buildSelectButton() {
    return Container(
      width: 311.w,
      height: 79.h,
      margin: EdgeInsets.only(bottom: 80.h),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(40.r),
      ),
      child: Text(
        'Select',
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ).alignment(Alignment.center),
    ).gestures(onTap: controller.onTypeofLuckySelectPressed);
  }
}
