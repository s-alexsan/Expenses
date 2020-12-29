import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({
    this.label,
    this.value,
    this.percentage,
  });
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constrains) {
        return Column(
          children: [
            Container(
                height: constrains.maxHeight * 0.10,
                child: FittedBox(child: Text('${value.toStringAsFixed(2)}'))),
            SizedBox(height: constrains.maxHeight * 0.05),
            Container(
              height: constrains.maxHeight * 0.7,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(220, 220, 220, 1),
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.grey, width: 1.0)),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constrains.maxHeight * 0.05),
            Container(
              height: constrains.maxHeight * 0.10,
              child: FittedBox(
                child: Text('$label'),
              ),
            ),
          ],
        );
      },
    );
  }
}
