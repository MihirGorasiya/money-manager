// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_manager/constants/app_constants.dart';

class AccountsPage extends StatelessWidget {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accounts'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Text('Accounts'),
          ),
          AccountDetails(
            accountName: 'RBC',
            accountBalance: double.parse('2050.5'),
          ),
          AccountDetails(
            accountName: 'RBC Credit Card',
            accountBalance: double.parse('-250.5'),
          ),
        ],
      ),
    );
  }
}

class AccountDetails extends StatelessWidget {
  const AccountDetails({
    super.key,
    required this.accountName,
    required this.accountBalance,
  });
  final String accountName;
  final double accountBalance;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        border: Border.symmetric(
          horizontal: BorderSide(
            color: AppConstants.greyText,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(accountName),
          Text(
            '\$${accountBalance.abs().toStringAsFixed(2)}',
            style: TextStyle(
              color: accountBalance > 0
                  ? AppConstants.blueColor
                  : AppConstants.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
