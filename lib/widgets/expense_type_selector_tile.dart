import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_constants.dart';
import 'package:money_manager/pages/add_expense.dart';

class ExpenseTypeSelectorTile extends StatelessWidget {
  const ExpenseTypeSelectorTile({
    super.key,
    required this.selectedType,
    required this.myExpenseType,
  });

  final ExpenseType selectedType;
  final ExpenseType myExpenseType;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppConstants.lightBlackColor,
        border: Border.all(
            color: selectedType == myExpenseType
                ? AppConstants.mainThemeColor
                : AppConstants.greyText),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
        vertical: 8,
      ),
      child: Text(
        myExpenseType.name.toUpperCase(),
        style: TextStyle(
          color: selectedType == myExpenseType
              ? AppConstants.mainThemeColor
              : AppConstants.greyText,
        ),
      ),
    );
  }
}
