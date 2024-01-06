import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/constants/app_constants.dart';
import 'package:money_manager/constants/get_controller.dart';
import 'package:money_manager/widgets/expense_type_selector_tile.dart';
import 'package:money_manager/widgets/input_field_with_lable.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController accountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateController controller = Get.find();
    Size screenSize = MediaQuery.of(context).size;

    ExpenseType expenseType = ExpenseType.expense;

    DateTime selectedDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay.now();
    Future<void> selectDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2010),
        lastDate: DateTime.now(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    controller.selectedExpense.value = ExpenseType.income;
                    log(controller.selectedExpense.value.toString());
                  },
                  child: Obx(
                    () => ExpenseTypeSelectorTile(
                      selectedType: controller.selectedExpense.value,
                      myExpenseType: ExpenseType.income,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.selectedExpense.value = ExpenseType.expense;
                    log(controller.selectedExpense.value.toString());
                  },
                  child: Obx(
                    () => ExpenseTypeSelectorTile(
                      selectedType: controller.selectedExpense.value,
                      myExpenseType: ExpenseType.expense,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.selectedExpense.value = ExpenseType.transfer;
                    log(controller.selectedExpense.value.toString());
                  },
                  child: Obx(
                    () => ExpenseTypeSelectorTile(
                      selectedType: controller.selectedExpense.value,
                      myExpenseType: ExpenseType.transfer,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // input fields
          InputFieldWithLable(
            screenSize: screenSize,
            lable: 'Date',
            padding: true,
            child: Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    '${selectedDate.month}/${selectedDate.day}/${selectedDate.year} (${DateFormat('EEEE').format(selectedDate).substring(0, 3)})       ',
                    style: const TextStyle(color: AppConstants.whiteColor),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    '${selectedTime.hour}:${selectedTime.minute}',
                    style: const TextStyle(color: AppConstants.whiteColor),
                  ),
                ),
              ],
            ),
            // child: const Text(
            //   '12/28/23 (Thu)  10:12',
            //   style: TextStyle(fontWeight: FontWeight.w600),
            // ),
          ),
          InputFieldWithLable(
            screenSize: screenSize,
            lable: 'Account',
            padding: false,
            child: TextField(
              controller: accountController,
              scrollPadding: EdgeInsets.zero,
              cursorColor: AppConstants.mainThemeColor,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          InputFieldWithLable(
            screenSize: screenSize,
            lable: 'Category',
            padding: false,
            child: TextField(
              controller: categoryController,
              scrollPadding: EdgeInsets.zero,
              cursorColor: AppConstants.mainThemeColor,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          InputFieldWithLable(
            screenSize: screenSize,
            lable: 'Amount',
            padding: false,
            child: TextField(
              controller: amountController,
              scrollPadding: EdgeInsets.zero,
              cursorColor: AppConstants.mainThemeColor,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          InputFieldWithLable(
            screenSize: screenSize,
            lable: 'Description',
            padding: false,
            child: TextField(
              controller: descriptionController,
              scrollPadding: EdgeInsets.zero,
              cursorColor: AppConstants.mainThemeColor,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: screenSize.width,
              // TODO: add account selection grid here.
              child: const Center(
                child: Text(
                  'Account Selection will be added Here.',
                  style: TextStyle(
                    color: AppConstants.greyText,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  if (accountController.value.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Enter Account.'),
                      ),
                    );
                  } else if (categoryController.value.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Enter category.'),
                      ),
                    );
                  } else if (amountController.value.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Enter amount.'),
                      ),
                    );
                  } else if (descriptionController.value.text == '') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please Enter description.'),
                      ),
                    );
                  } else {
                    print(accountController.value.text);
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenSize.width * 0.3,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: AppConstants.mainThemeColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text('submit'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 6,
                  ),
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: AppConstants.mainThemeColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(Icons.delete_rounded),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum ExpenseType { income, expense, transfer }
