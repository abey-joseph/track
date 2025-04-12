import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track/features/habit/presentation/bloc/habit_bloc.dart';

class DateHead extends StatelessWidget {
  const DateHead({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dateList;

    return Container(
      padding: EdgeInsets.only(right: 10),
      //color: Colors.red,
      //width: 10,
      height: 40,
      child: BlocConsumer<HabitBloc, HabitState>(
        buildWhen: (previous, current) {
          return current is dateListForDateHeadUpdatedState;
        },
        listener: (context, state) {},
        builder: (context, state) {
          if (state is dateListForDateHeadUpdatedState) {
            dateList = state.dateList;
          } else {
            dateList =
                List.generate(5, (index) => {"date": '01/01', "day": 'Sun'});
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: List.generate(
                5,
                (index) => SizedBox(
                      width: 48,
                      child: Column(
                        children: [
                          Text(
                            dateList[index]["date"]!,
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(
                            dateList[index]["day"]!,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )),
          );
        },
      ),
    );
  }
}
