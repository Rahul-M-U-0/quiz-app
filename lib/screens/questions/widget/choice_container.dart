import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({super.key, required this.choiceText});

  final String choiceText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimensions.height60,
      width: AppDimensions.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppDimensions.radius10),
        border: Border.all(
          color: Colors.black45,
        ),
      ),
      child: Center(
        child: Text(
          choiceText,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: AppDimensions.fontSize18,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
