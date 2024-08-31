import 'package:expense/datetime/datetime.dart';
import 'package:expense/expenseitem/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseData extends ChangeNotifier {
//list of all expenses
  List<ExpenseItem> overallExpenseList = [];

//get the list

  List<ExpenseItem> getoverallList() {
    return overallExpenseList;
  }

//add new expense
  void additem(ExpenseItem newItem) {
    overallExpenseList.add(newItem);
    notifyListeners();
  }

//delete an expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
  }
//get week day from a datetime object

  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }
//get the data for the start of the week

  DateTime startofWeekDate() {
    DateTime? startofWeek;
// get todays date
    DateTime today = DateTime.now();
    //go backwards from today to find sunday
    debugPrint(DateTime.now().toString());
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startofWeek = today.subtract(Duration(days: i));
      }
    }
    return startofWeek!;
  }

//convert overall list of expenses into a daily expense summary
  Map<String, double> calculateDailyexpensesummary() {
    Map<String, double> dailyExpenseSummary = {};
    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);
      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
