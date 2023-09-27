import '../models/timeslots_item_model.dart';
import 'package:flutter/material.dart';
import 'package:mhart_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class TimeslotsItemWidget extends StatelessWidget {
  TimeslotsItemWidget(
    this.timeslotsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TimeslotsItemModel timeslotsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => RawChip(
        padding: getPadding(
          left: 23,
          top: 11,
          right: 23,
          bottom: 11,
        ),
        showCheckmark: false,
        labelPadding: EdgeInsets.zero,
        label: Text(
          timeslotsItemModelObj.timeOneTxt.value,
          style: TextStyle(
            color: timeslotsItemModelObj.isSelected.value
                ? theme.colorScheme.primary
                : theme.colorScheme.primaryContainer,
            fontSize: getFontSize(
              12,
            ),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
        selected: timeslotsItemModelObj.isSelected.value,
        backgroundColor: theme.colorScheme.primary,
        selectedColor: appTheme.cyan300,
        shape: timeslotsItemModelObj.isSelected.value
            ? RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(10),
                ),
              )
            : RoundedRectangleBorder(
                side: BorderSide(
                  color: appTheme.teal100,
                  width: getHorizontalSize(1),
                ),
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(10),
                ),
              ),
        onSelected: (value) {
          timeslotsItemModelObj.isSelected.value = value;
        },
      ),
    );
  }
}
