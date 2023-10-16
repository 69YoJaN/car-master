// ignore_for_file: deprecated_member_use, prefer_typing_uninitialized_variables

import 'package:car_master/constants/colors.dart';
import 'package:car_master/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final text, onPressed, borderRadius, padding, buttonColor, textColor;

  //final Function? onTap;

  const ButtonWidget(
      {Key? key,
      this.text,
      this.onPressed,
      this.buttonColor,
      this.borderRadius,
      this.textColor,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: const BorderSide(
          color: AppColors.appBlue,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ??
              BorderRadius.circular(DeviceUtils.getScaledWidth(context, 3)),
        ),
        primary: buttonColor ?? AppColors.appBlue,
        padding: EdgeInsets.symmetric(
            horizontal: DeviceUtils.getScaledWidth(context, 1),
            vertical: DeviceUtils.getScaledHeight(context, 1.8)),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: textColor ?? Colors.white,
                    fontSize: DeviceUtils.getScaledWidth(context, 4.5)),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
