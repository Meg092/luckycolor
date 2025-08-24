import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:styled_widget/styled_widget.dart';

import 'lucky_colors_setting_logic.dart';

class LuckyColorsSettingPage extends GetView<LuckyColorsSettingController> {
  const LuckyColorsSettingPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('设置')),
      body: Container(
        width: double.infinity,
        height: 60.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [_buildItem(title: 'Version', value: 'v1.0.0')],
        ),
      ),
    );
  }

  Widget _buildItem({
    required String title,
    String? value,
    VoidCallback? onTap,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xFF0F0F0F),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value ?? '',
            style: TextStyle(fontSize: 14.sp, color: Color(0xFF0F0F0F)),
          ),
        ],
      ),
    ).gestures(onTap: onTap);
  }
}
