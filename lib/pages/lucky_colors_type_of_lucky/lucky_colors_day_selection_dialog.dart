import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucky_colors/main.dart';

class DaySelectionDialog extends StatefulWidget {
  final List<String> weekDays;
  final Function(String) onConfirm;
  final String initialSelectedDay;

  const DaySelectionDialog({
    super.key,
    required this.weekDays,
    required this.onConfirm,
    required this.initialSelectedDay,
  });

  @override
  State<DaySelectionDialog> createState() => _DaySelectionDialogState();
}

class _DaySelectionDialogState extends State<DaySelectionDialog> {
  int currentSelectedDay = 0;

  onDaySelect(int index) {
    setState(() {
      currentSelectedDay = index;
    });
  }

  onPressed() {
    widget.onConfirm(widget.weekDays[currentSelectedDay]);
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    super.initState();
    if (widget.initialSelectedDay == '') {
      currentSelectedDay = 0;
    } else {
      currentSelectedDay = widget.weekDays.indexOf(widget.initialSelectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        width: 320.w,
        height: 470.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.separated(
              shrinkWrap: true,
              itemCount: widget.weekDays.length,
              separatorBuilder:
                  (context, index) =>
                      Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
              itemBuilder: (context, index) => _buildDayOption(index),
            ),
            SizedBox(height: 18.h),
            SizedBox(
              width: 268.w,
              height: 44.h,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3498DB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                ),
                child: const Text(
                  'Select',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDayOption(int index) {
    final isSelected = currentSelectedDay == index;

    return GestureDetector(
      onTap: () => onDaySelect(index),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Row(
          children: [
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? primaryColor : Colors.transparent,
                border: Border.all(
                  color: isSelected ? primaryColor : const Color(0xFFE8E8E8),
                  width: isSelected ? 4.w : 2.w,
                ),
              ),
              child:
                  isSelected
                      ? const Icon(Icons.circle, size: 10, color: Colors.white)
                      : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.weekDays[index],
                style: TextStyle(
                  fontSize: 16.sp,
                  color: const Color(0xFF343434),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
