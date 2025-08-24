import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_colors/db_lucky_colors/lucky_colors_entity.dart';
import '../../db_lucky_colors/lucky_colors_util.dart';

class ColorMeaningsPage extends StatefulWidget {
  final LuckyColorsEntity colorData;
  final String day;

  const ColorMeaningsPage({
    super.key,
    required this.colorData,
    required this.day,
  });

  @override
  State<ColorMeaningsPage> createState() => _ColorMeaningsPageState();
}

class _ColorMeaningsPageState extends State<ColorMeaningsPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9), Color(0xFFE2E8F0)],
        ),
      ),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader(
                  'Lucky Colors for ${widget.day}',
                  Icons.favorite,
                  Color(0xFF10B981),
                ),
                SizedBox(height: 10.h),
                _buildColorCard(
                  color: widget.colorData.luckyColor1!,
                  colorName: colorMeanings[widget.colorData.luckyColor1]!.name,
                  meaning:
                      colorMeanings[widget.colorData.luckyColor1]!.description,
                  isLucky: true,
                  index: 0,
                ),
                SizedBox(height: 16.h),
                _buildColorCard(
                  color: widget.colorData.luckyColor2!,
                  colorName: colorMeanings[widget.colorData.luckyColor2]!.name,
                  meaning:
                      colorMeanings[widget.colorData.luckyColor2]!.description,
                  isLucky: true,
                  index: 1,
                ),
                SizedBox(height: 40.h),
                _buildSectionHeader(
                  'Unlucky Colors',
                  Icons.block,
                  Color(0xFFEF4444),
                ),
                SizedBox(height: 10.h),
                _buildUnluckyColorCard(
                  color: widget.colorData.unluckyColor1!,
                  colorName:
                      colorMeanings[widget.colorData.unluckyColor1]!.name,
                  isLucky: false,
                ),
                SizedBox(height: 16.h),
                _buildUnluckyColorCard(
                  color: widget.colorData.unluckyColor2!,
                  colorName:
                      colorMeanings[widget.colorData.unluckyColor2]!.name,
                  isLucky: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(icon, color: color, size: 24.sp),
        ),
        SizedBox(width: 16.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildUnluckyColorCard({
    required String color,
    required String colorName,
    required bool isLucky,
  }) {
    final colorValue = hexToColor(color);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF8FAFC), colorValue.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: colorValue.withOpacity(0.15), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: colorValue.withOpacity(0.08),
            blurRadius: 20,
            offset: Offset(0, 8),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [colorValue, colorValue.withOpacity(0.8)],
                ),
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: colorValue.withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 3),
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Icon(
                Icons.block_rounded,
                color: Colors.white,
                size: 24.sp,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                colorName,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1E293B),
                  letterSpacing: 0.3,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorCard({
    required String color,
    required String colorName,
    required String meaning,
    required bool isLucky,
    required int index,
  }) {
    final colorValue = hexToColor(color);

    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 800 + (index * 200)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, 30 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, colorValue.withOpacity(0.05)],
                ),
                borderRadius: BorderRadius.circular(24.r),
                border: Border.all(
                  color: colorValue.withOpacity(0.15),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorValue.withOpacity(0.08),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48.w,
                          height: 48.w,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [colorValue, colorValue.withOpacity(0.8)],
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                color: colorValue.withOpacity(0.25),
                                blurRadius: 10,
                                offset: Offset(0, 3),
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Icon(
                            isLucky
                                ? Icons.favorite_rounded
                                : Icons.block_rounded,
                            color: Colors.white,
                            size: 26.sp,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Text(
                            colorName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1E293B),
                              letterSpacing: 0.4,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      meaning,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                        height: 1.6,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
