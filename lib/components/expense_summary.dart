import 'package:expense/bargraph/bar_graph.dart';
import 'package:expense/data/expense_data.dart';
import 'package:expense/datetime/datetime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime startofweek;
   const ExpenseSummary({super.key, required this.startofweek});

  @override
  Widget build(BuildContext context) {
    String sunday =
        convertDateTimeToString(startofweek.add(const Duration(days: 0)));
    String monday =
        convertDateTimeToString(startofweek.add(const Duration(days: 1)));

    String tuesday =
        convertDateTimeToString(startofweek.add(const Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(startofweek.add(const Duration(days: 3)));
    String thursday =
        convertDateTimeToString(startofweek.add(const Duration(days: 4)));
    String friday =
        convertDateTimeToString(startofweek.add(const Duration(days: 5)));
    String saturday =
        convertDateTimeToString(startofweek.add(const Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, child) => SizedBox(
        height: 200,
        child: MyBarGraph(
            maxY: 1000,
            sunamount: value.calculateDailyexpensesummary()[sunday]??0,
            monamount: value.calculateDailyexpensesummary()[monday]??0,
            tueamount: value.calculateDailyexpensesummary()[tuesday]??0,
            wedamount: value.calculateDailyexpensesummary()[wednesday]??0,
            thuramount: value.calculateDailyexpensesummary()[thursday]??0,
            friamount: value.calculateDailyexpensesummary()[friday]??0,
            satamount: value.calculateDailyexpensesummary()[saturday]??0
            
            ),
      ),
    );
  }
}
