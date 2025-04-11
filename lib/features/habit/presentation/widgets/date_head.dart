import 'package:flutter/material.dart';

class DateHead extends StatelessWidget {
  const DateHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 10),
      //color: Colors.red,
      //width: 10,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(
            5,
            (value) => SizedBox(
                  width: 48,
                  child: Column(
                    children: [
                      Text(
                        '01/01',
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        'Sun',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
