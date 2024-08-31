import 'package:expense/components/expense_summary.dart';
import 'package:expense/components/expensetile.dart';
import 'package:expense/data/expense_data.dart';
import 'package:expense/expenseitem/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ExpenseData obj = ExpenseData();

  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController centsController = TextEditingController();

  void addNewexpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Expense'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Name'),
              controller: nameController,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Dollars'),
                    controller: amountController,
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(hintText: 'Cents'),
                    controller: centsController,
                    keyboardType: const TextInputType.numberWithOptions(),
                  ),
                ),
              ],
            )
          ],
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              save();
            },
            child: const Text('Save'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          )
        ],
      ),
    );

    nameController.clear();
    amountController.clear();
    centsController.clear();
  }
  //save

  void save() {
    String amount = '${amountController.text}.${centsController.text}';

    ExpenseItem newItem = ExpenseItem(
        name: nameController.text,
        amount: amount,
        dateTime: DateTime.now());

    Provider.of<ExpenseData>(context, listen: false).additem(newItem);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
      builder: (context, value, child) => SafeArea(
          child: Scaffold(
              backgroundColor: Colors.grey[400],
              appBar: AppBar(
                title: const Text('Expense Tracker'),
                centerTitle: true,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  addNewexpense();
                },
                child: const Icon(Icons.add),
              ),
              body: ListView(children: [
                const SizedBox(
                  height: 30,
                ),
                ExpenseSummary(startofweek: value.startofWeekDate()),
                const SizedBox(
                  height: 30,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.getoverallList().length,
                    itemBuilder: (context, index) {
                      return Slidable(
                      
                        child: Expensetile(
                            name: value.getoverallList()[index].name,
                            amount: value.getoverallList()[index].amount,
                            dateTime: value.getoverallList()[index].dateTime
                            ),
                      );
                    }),
              ]))),
    );
  }
}
