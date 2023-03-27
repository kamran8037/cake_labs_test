import 'package:flutter/material.dart';

import '../../common/appearance/appearance_provider.dart';

class PinCodeIndicator extends StatelessWidget {
  final bool filled;

  const PinCodeIndicator({Key? key, required this.filled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 32),
      child: Container(
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: filled ? appearance.accentColor : null,
          border: Border.all(color: appearance.accentColor, width: 1),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
