import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_constants.dart';
import 'package:money_manager/pages/add_expense.dart';
import 'package:money_manager/utils/database_manager.dart';
import 'package:money_manager/utils/expense.dart';
import 'package:collection/collection.dart';

import 'package:money_manager/widgets/day_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Expense>? result;

  late Map<String, List<Expense>> groupped;
  late List<List<Expense>> grouppedExpenseList = [];
  void groupedData(List<Expense> expenses) {
    groupped = groupBy(expenses, (Expense expense) => expense.time);

    setState(() {
      grouppedExpenseList = groupped.values.toList();
    });
  }

  void getAllExpenses() async {
    result = await DatabaseManager.getAllTransactions();
    result!.sort((a, b) =>
        DateTime.tryParse(b.time)!.compareTo(DateTime.tryParse(a.time)!));

    groupedData(result!);
  }

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
  void initState() {
    getAllExpenses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //TODO: update month changer
        title: const Text('Test'),
      ),
      floatingActionButton: FloatingActionButton(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Daily"),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Divider(thickness: 1),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Income'),
                  Text(
                    '0.0',
                    style: TextStyle(color: AppConstants.blueColor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Expenses'),
                  Text(
                    '0.0',
                    style: TextStyle(color: AppConstants.redColor),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Total'),
                  Text('0.0'),
                ],
              ),
            ],
          ),
          Expanded(
            child: grouppedExpenseList.isNotEmpty
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: grouppedExpenseList.length,
                    itemBuilder: (context, index) {
                      return DayTransaction(
                        screenSize: screenSize,
                        transactionDate: grouppedExpenseList[index].isNotEmpty
                            ? DateTime.parse(
                                grouppedExpenseList[index].first.time)
                            : DateTime.now(),
                        transactions: grouppedExpenseList[index],
                      );
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          // DayTransaction(
          //   screenSize: screenSize,
          //   transactionDate: DateTime.parse('2023-12-15'),
          //   transactions: [
          //     Expense(
          //         time: DateTime.parse('2023-12-16').toString(),
          //         category: 'salary',
          //         description: 'Tim Horton',
          //         account: 'RBC credit card',
          //         amount: 1200)
          //   ],
          // ),
        ],
      ),
    );
  }
}
