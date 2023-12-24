import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_constants.dart';
import 'package:money_manager/widgets/day_transaction.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        //TODO: update month changer
        title: const Text('Test'),
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
                  Text('Expennses'),
                  Text('0.0'),
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
          DayTransaction(
            screenSize: screenSize,
            transactionDate: DateTime.parse('2023-12-16'),
            transactions: [
              {
                'date': DateTime.parse('2023-12-16'),
                'category': 'Food',
                'description': 'Tim Horton',
                'account': 'RBC credit card',
                'amount': -8.87
              },
              {
                'date': DateTime.parse('2023-12-16'),
                'category': 'Apparel',
                'description': 'H&M Seatshirt',
                'account': 'RBC credit card',
                'amount': -20.33
              },
            ],
          ),
          DayTransaction(
            screenSize: screenSize,
            transactionDate: DateTime.parse('2023-12-15'),
            transactions: [
              {
                'date': DateTime.parse('2023-12-16'),
                'category': 'salary',
                'description': 'Tim Horton',
                'account': 'RBC credit card',
                'amount': 25.01
              }
            ],
          ),
        ],
      ),
    );
  }
}
