import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/constants/app_constants.dart';
import 'package:money_manager/utils/expense.dart';

class DayTransaction extends StatefulWidget {
  const DayTransaction({
    super.key,
    required this.screenSize,
    required this.transactions,
    required this.transactionDate,
  });

  final Size screenSize;
  final DateTime transactionDate;
  final List<Expense> transactions;

  @override
  State<DayTransaction> createState() => _DayTransactionState();
}

class _DayTransactionState extends State<DayTransaction> {
  double spent = 0.0;
  double earned = 0.0;

  void calculateExpense() {
    for (Expense e in widget.transactions) {
      if (e.amount > 0) {
        setState(() {
          earned += e.amount;
        });
      } else {
        setState(() {
          spent += e.amount.abs();
        });
      }
    }
  }

  @override
  void initState() {
    calculateExpense();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(thickness: 1),
        ),
        Container(
          padding:
              EdgeInsets.symmetric(horizontal: widget.screenSize.width * 0.03),
          child: Row(
            children: [
              SizedBox(
                width: widget.screenSize.width * 0.60,
                child: Row(
                  children: [
                    Text(widget.transactionDate.day.toString()),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(DateFormat('EEEE')
                          .format(widget.transactionDate)
                          .substring(0, 3)),
                    ),
                    Text(
                        '${widget.transactionDate.month}.${widget.transactionDate.year}'),
                  ],
                ),
              ),
              SizedBox(
                width: widget.screenSize.width * 0.17,
                child: Text(
                  '\$$earned',
                  style: const TextStyle(color: AppConstants.blueColor),
                ),
              ),
              SizedBox(
                width: widget.screenSize.width * 0.17,
                child: Text(
                  '\$$spent',
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: AppConstants.redColor),
                ),
              ),
            ],
          ),
        ),
        //TODO: exctract widgets individual
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(thickness: 1),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.transactions.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: widget.screenSize.width * 0.20,
                    child: Text(
                      widget.transactions[index].category,
                      style: const TextStyle(color: AppConstants.greyText),
                    ),
                  ),
                  SizedBox(
                    width: widget.screenSize.width * 0.50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.transactions[index].description),
                        Text(
                          widget.transactions[index].account,
                          style: const TextStyle(color: AppConstants.greyText),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: widget.screenSize.width * 0.20,
                    child: Text(
                      '\$${widget.transactions[index].amount}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: widget.transactions[index].amount > 0
                            ? AppConstants.blueColor
                            : AppConstants.redColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
