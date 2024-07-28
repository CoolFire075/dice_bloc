import 'package:dice_bloc/features/dice/cubit/dice_variant.dart';

class DiceState {
  DiceVariant firstDice;
  DiceVariant secondDice;
  final int firstNumber;
  final int secondNumber;

  DiceState(
      {required this.firstNumber,
      required this.secondNumber,
      required this.firstDice,
      required this.secondDice});
}
