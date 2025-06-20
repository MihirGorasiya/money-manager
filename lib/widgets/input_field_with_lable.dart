import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_constants.dart';

class InputFieldWithLable extends StatelessWidget {
  const InputFieldWithLable({
    super.key,
    required this.screenSize,
    required this.lable,
    required this.child,
    required this.padding,
  });

  final Size screenSize;
  final String lable;
  final Widget child;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Text(
            lable,
            style: const TextStyle(color: AppConstants.greyText),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(
                vertical: padding ? 10 : 0,
                horizontal: 3,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: AppConstants.greyText,
                  ),
                ),
              ),
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
