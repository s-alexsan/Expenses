import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final Function(DateTime) onDateChange;
  AdaptativeDatePicker({
    this.selectedDate,
    this.onDateChange,
  });

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      onDateChange(pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Container(
            height: 180,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: DateTime.now(),
              minimumDate: DateTime(2020),
              maximumDate: DateTime.now(),
              onDateTimeChanged: onDateChange,
            ),
          )
        : Container(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  child: Text(selectedDate == null
                      ? 'Nenhum data selecionada!'
                      : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate)}'),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text(
                    'Selecionar Data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => _showDatePicker(context),
                )
              ],
            ),
          );
  }
}
