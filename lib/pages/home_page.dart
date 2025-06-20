import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_manager/constants/app_constants.dart';
import 'package:money_manager/constants/get_controller.dart';
import 'package:money_manager/pages/accounts_page.dart';
import 'package:money_manager/pages/add_expense.dart';
import 'package:money_manager/pages/expense_page.dart';
import 'package:money_manager/pages/settings_page.dart';
import 'package:money_manager/utils/database_manager.dart';
import 'package:money_manager/utils/expense.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StateController controller = Get.put(StateController());

  //TODO: Move where required
  void addExpense() async {
    Expense trans = Expense(
      time: DateTime(2023, 11, 14, 6, 15, 20).toString(),
      category: 'Appeals',
      description: 'ZARA Jacket',
      account: 'RBC Credit',
      amount: 76,
    );

    await DatabaseManager.addData(trans, context);
  }

  //TODO: Move where required
  void deleteExpense() async {
    Expense trans = Expense(
      // time: DateTime(2023, 11, 13, 10, 5, 5).toString(),
      time: DateTime(2023, 11, 14, 6, 15, 20).toString(),
      category: 'Appeals',
      description: 'ZARA Jacket',
      account: 'RBC Credit',
      amount: 76,
    );

    await DatabaseManager.deleteData(trans);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.mainThemeColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddExpense(),
            ),
          );
        },
        child: const Icon(
          Icons.add_rounded,
        ),
      ),
      body: Obx(
        () => controller.bottomSheetSelectedPageIndex.value == 0
            ? ExpensePage(
                screenSize: screenSize,
              )
            : controller.bottomSheetSelectedPageIndex.value == 1
                ? const AccountsPage()
                : const SettingsPage(),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.book_rounded),
              label: 'Expenses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              label: 'Accounts',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.bottomSheetSelectedPageIndex.value,
          selectedIconTheme: IconThemeData(
            color: AppConstants.mainThemeColor,
          ),
          selectedItemColor: AppConstants.mainThemeColor,
          onTap: (item) {
            controller.bottomSheetSelectedPageIndex.value = item;
          },
        ),
      ),
    );
  }
}
