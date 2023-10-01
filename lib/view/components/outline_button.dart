import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    required this.child,
    required this.label,
  });

  final void Function()? onPressed;
  final Widget child;
  final Text label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 95,
          width: 95,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 95,
                width: 95,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF0048ff), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: child,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        label,
      ],
    );
  }
}
