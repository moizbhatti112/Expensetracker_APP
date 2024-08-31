import 'package:flutter/material.dart';

class Expensetile extends StatefulWidget {
  final String name;
  final String amount;
  final DateTime dateTime;

  const Expensetile({
    super.key, required this.name, required this.amount, required this.dateTime 
 
  });
  
  

  @override
  State<Expensetile> createState() => _ExpensetileState();
}

class _ExpensetileState extends State<Expensetile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.name),
      subtitle: Text('${widget.dateTime.day}/${widget.dateTime.month}/${widget.dateTime.year}'),
      trailing: Text('\$${widget.amount}'),
    );
  }
}
