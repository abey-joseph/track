import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:track/core/use_cases/constants/strings.dart';
import 'package:track/core/use_cases/widgets/titile_action_button.dart';
import 'package:track/features/habit/domain/entities/habit_entity.dart';
import 'package:track/features/habit/presentation/bloc/habit_bloc.dart';
import 'package:track/features/habit/presentation/widgets/input/animation_for_extra_widgets.dart';
import 'package:track/features/habit/presentation/widgets/input/dropdown_for_count_type.dart';
import 'package:track/features/habit/presentation/widgets/input/dropdown_for_frquency_type.dart';
import 'package:track/features/habit/presentation/widgets/input/dropdown_for_target_type.dart';
import 'package:track/features/habit/presentation/widgets/input/input_radio_button.dart';
import 'package:track/features/habit/presentation/widgets/input/input_text_field.dart';
import 'package:track/features/habit/presentation/widgets/input/reminder_switch.dart';
import 'package:track/features/habit/presentation/widgets/input/select_days_widget.dart';

class HabitAddPage extends StatefulWidget {
  const HabitAddPage({super.key});

  @override
  State<HabitAddPage> createState() => _HabitAddPageState();
}

class _HabitAddPageState extends State<HabitAddPage> {
  final habitNameController = TextEditingController();
  final habitDescriptionController = TextEditingController();
  final targetController = TextEditingController();
  final inEveryXDaysController = TextEditingController();

  bool isBinary = true;
  String? countType;
  String? targetType;
  String? frquencyType;
  final List<bool> weekDays = List.filled(7, false);
  bool reminder = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HabitBloc, HabitState>(
      listener: (context, state) {
        if (state is AddDoneHabitState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('New Habit Add Done')),
          );
          context.pop();
        }
        if (state is AddFailedHabitState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(ConstStrings.appBarTitleForAddPage),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: titleActionButton(
                  icon: Icons.save,
                  onTap: () {
                    context.read<HabitBloc>().add(AddHabitEvent(
                        habitEntity: HabitEntity(
                            habitName: habitNameController.text,
                            description: habitDescriptionController.text,
                            isBinary: isBinary,
                            frequencyType: frquencyType,
                            reminder: reminder,
                            countType: countType,
                            target: targetController.text,
                            targetType: targetType,
                            selectedDays: weekDays,
                            inEveryXDays: inEveryXDaysController.text,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now())));
                  }),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              spacing: 10,
              children: [
                InputTextField(
                    controller: habitNameController,
                    hintText: ConstStrings.hintForHabitNameAdd),
                InputTextField(
                  controller: habitDescriptionController,
                  hintText: ConstStrings.hintForHabitDescriptionAdd,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    InputRadioButton(
                        defaultValue: true,
                        isBinary: isBinary,
                        onChanged: (value) => setState(() => isBinary = value!),
                        title: ConstStrings.radioButtonTextForChoosingBinary),
                    InputRadioButton(
                        defaultValue: false,
                        isBinary: isBinary,
                        onChanged: (value) => setState(() => isBinary = value!),
                        title: ConstStrings
                            .radioButtonTextButtonForChoosingCountable),
                  ],
                ),

                // the below widget will only appear id the use chooses Countable - otherwise disappear
                AnimationForExtraWidgets(
                    decidingVariableToShowWidget: isBinary,
                    childrens: [
                      DropdownForCountType(
                          countType: countType,
                          onChanged: (value) =>
                              setState(() => countType = value)),
                      InputTextField(
                          controller: targetController,
                          hintText: ConstStrings.hintTextForTargetValueAddPage),
                      DropdownForTargetType(
                          targetType: targetType,
                          onChanged: (value) =>
                              setState(() => targetType = value))
                    ]),
                DropdownForFrequencyType(
                    frquencyType: frquencyType,
                    onChanged: (value) =>
                        setState(() => frquencyType = value!)),

                //widget to choose Days
                AnimationForExtraWidgets(
                    decidingVariableToShowWidget: !(frquencyType ==
                        ConstStrings
                            .frquencyTypeChooseDays), // if you want to show this widget then pass false
                    childrens: [
                      SelectDaysWidget(
                          weekDays: weekDays,
                          onSelected: (value, i) =>
                              setState(() => weekDays[i] = value))
                    ]),

                // widget in input how often repeat
                AnimationForExtraWidgets(
                    decidingVariableToShowWidget: !(frquencyType ==
                        ConstStrings
                            .frquencyTypeEveryXDays), // if you want to show this widget then pass false
                    childrens: [
                      InputTextField(
                          controller: inEveryXDaysController,
                          hintText: ConstStrings.hintTextToInputEveryXDays),
                    ]),
                ReminderSwitch(
                    reminder: reminder,
                    onChanged: (value) => setState(() => reminder = value))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
