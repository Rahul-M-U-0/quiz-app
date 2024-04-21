import 'package:flutter/material.dart';
import 'package:quiz/utils/app_dimensions.dart';

class SettingsContainerRow extends StatelessWidget {
  const SettingsContainerRow({
    super.key,
    required this.leadingIconUrl,
    required this.settingsText,
    this.trailingText = "",
    required this.trailingIcon,
  });

  final String leadingIconUrl;
  final String settingsText;
  final String trailingText;
  final IconData trailingIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          leadingIconUrl,
          height: AppDimensions.height45,
          width: AppDimensions.width45,
        ),
        SizedBox(width: AppDimensions.width10),
        Text(
          settingsText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: AppDimensions.fontSize20,
                fontWeight: FontWeight.w700,
              ),
        ),
        Spacer(),
        Text(
          trailingText,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: AppDimensions.fontSize20,
                fontWeight: FontWeight.w700,
              ),
        ),
        SizedBox(width: AppDimensions.width10),
        Icon(
          trailingIcon,
          size: AppDimensions.height15,
        ),
      ],
    );
  }
}
