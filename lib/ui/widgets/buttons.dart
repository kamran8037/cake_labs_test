import 'package:flutter/material.dart';

import '../../common/appearance/appearance_provider.dart';



class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const PrimaryButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appearance = AppearanceProvider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: appearance.primaryButtonColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
            child: Text(title, style: appearance.primaryButtonTextStyle)),
      ),
    );
  }
}

class NumPadButton extends StatelessWidget {
  const NumPadButton({Key? key, required this.num, this.onPressed})
      : super(key: key);

  final String num;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: FloatingActionButton.extended(
        heroTag: num,
        elevation: 0,
        backgroundColor: const Color(0xFFf5f5f8),
        onPressed: onPressed,
        label: Text(
          num,
          style: const TextStyle(color: Color(0xFF687ea1)),
        ),
      ),
    );
  }
}
