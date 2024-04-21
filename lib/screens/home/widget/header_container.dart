import 'package:flutter/material.dart';

import '../../../utils/app_dimensions.dart';
import '../custom_shaped/custom_clipper.dart';

class HeaderContainer extends StatelessWidget {
  const HeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: Container(
        height: 300,
        width: AppDimensions.screenWidth,
        color: Color.fromRGBO(49, 49, 77, 1),
        child: child,
      ),
    );
  }
}
