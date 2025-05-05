import 'package:track/core/use_cases/constants/strings.dart';

class HabitInputValidatorResult {
  final bool isValid;
  String? errorMessage;

  HabitInputValidatorResult({required this.isValid, this.errorMessage});
}

class HabitInputValidator {
  final String habitName;
  final bool isBinary;
  final String? countType;
  final String? target;
  final String? targetType;
  final String? frquencyType;
  final List<bool>? weekDays;
  final String? inEveryXDays;

  HabitInputValidator(
      {required this.habitName,
      required this.isBinary,
      required this.countType,
      required this.target,
      required this.targetType,
      required this.frquencyType,
      required this.weekDays,
      required this.inEveryXDays});

  HabitInputValidatorResult call() {
    if (habitName == '') {
      return HabitInputValidatorResult(
          isValid: false, errorMessage: 'Please input a Habit Name');
    }
    if (!isBinary) {
      if (countType == null) {
        return HabitInputValidatorResult(
            isValid: false, errorMessage: 'Please select the Count Type');
      }
      if (target != null) {
        if (double.tryParse(target!) == null) {
          return HabitInputValidatorResult(
              isValid: false, errorMessage: 'Please enter a Valid Target');
        }
      }

      if (targetType == null) {
        return HabitInputValidatorResult(
            isValid: false, errorMessage: 'Please select a Target Type');
      }
    }
    if (frquencyType == null) {
      return HabitInputValidatorResult(
          isValid: false, errorMessage: 'Please select Frequency');
    } else if (frquencyType == ConstStrings.frquencyTypeChooseDays) {
      if (weekDays != null) {
        if (!weekDays!.contains(true)) {
          return HabitInputValidatorResult(
              isValid: false, errorMessage: 'Please selct the Days');
        }
      }
    } else if (frquencyType == ConstStrings.frquencyTypeEveryXDays) {
      if (inEveryXDays != null) {
        if (int.tryParse(inEveryXDays!) == null) {
          return HabitInputValidatorResult(
              isValid: false, errorMessage: 'Please enter a valid Day Count');
        }
      }
    }
    return HabitInputValidatorResult(isValid: true);
  }
}
