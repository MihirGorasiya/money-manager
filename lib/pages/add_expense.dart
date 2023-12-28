import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_constants.dart';
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
    Size screenSize = MediaQuery.of(context).size;

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
                Container(
                  decoration: BoxDecoration(
                    color: AppConstants.lightBlackColor,
                    border: Border.all(color: AppConstants.greyText),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 8,
                  ),
                  child: const Text('Income'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppConstants.lightBlackColor,
                    border: Border.all(color: AppConstants.greyText),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 8,
                  ),
                  child: const Text('Expense'),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppConstants.lightBlackColor,
                    border: Border.all(color: AppConstants.greyText),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                    vertical: 8,
                  ),
                  child: const Text('Transfer'),
                ),
              ],
            ),
          ),
          // input fields
          InputFieldWithLable(
            screenSize: screenSize,
            text: 'Date',
            padding: true,
            child: const Text(
              '12/28/23 (Thu)  10:12',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          InputFieldWithLable(
            screenSize: screenSize,
            text: 'Account',
            padding: false,
            child: TextField(
              controller: accountController,
              scrollPadding: EdgeInsets.zero,
              decoration: const InputDecoration(
                hintText: 'RBC',
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
            text: 'Category',
            padding: false,
            child: TextField(
              controller: categoryController,
              scrollPadding: EdgeInsets.zero,
              decoration: const InputDecoration(
                hintText: 'Food',
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
            text: 'Amount',
            padding: false,
            child: TextField(
              controller: amountController,
              scrollPadding: EdgeInsets.zero,
              decoration: const InputDecoration(
                hintText: '2.78',
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
            text: 'Description',
            padding: false,
            child: TextField(
              controller: descriptionController,
              scrollPadding: EdgeInsets.zero,
              decoration: const InputDecoration(
                hintText: 'Tim Hortons',
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
          //TODO: position this button at the bottom
          Center(
            child: Positioned(
              bottom: 0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('submit'),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
