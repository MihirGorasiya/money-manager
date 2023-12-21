import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayTransaction extends StatelessWidget {
  const DayTransaction({
    super.key,
    required this.screenSize,
    required this.transactions,
    required this.transactionDate,
  });

  final Size screenSize;
  final DateTime transactionDate;
  final List<Map<String, dynamic>> transactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Divider(thickness: 1),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.03),
          child: Row(
            children: [
              SizedBox(
                width: screenSize.width * 0.60,
                child: Row(
                  children: [
                    Text(transactionDate.day.toString()),
                    Container(
                      margin: const EdgeInsets.only(left: 5, right: 3),
                      padding: const EdgeInsets.symmetric(
                          vertical: 3, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(DateFormat('EEEE')
                          .format(transactionDate)
                          .substring(0, 3)),
                    ),
                    Text('${transactionDate.month}.${transactionDate.year}'),
                  ],
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.17,
                child: const Text(
                  '\$504.51',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(
                width: screenSize.width * 0.17,
                child: const Text(
                  '\$35.91',
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.red),
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
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenSize.width * 0.20,
                    child: Text(
                      transactions[index]['category'],
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(transactions[index]['description']),
                        Text(
                          transactions[index]['account'],
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenSize.width * 0.20,
                    child: Text(
                      '\$${transactions[index]['amount']}',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: transactions[index]['amount'] > 0
                            ? Colors.blue
                            : Colors.red,
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
