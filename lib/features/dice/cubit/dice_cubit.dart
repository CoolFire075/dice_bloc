import 'dart:math';

import 'package:dice_bloc/features/dice/cubit/dice_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dice_variant.dart';

class DiceCubit extends Cubit<DiceState> {
  DiceCubit() : super(DiceState(firstNumber: 0, secondNumber: 0, firstDice: DiceVariant.dice_1, secondDice: DiceVariant.dice_1));

  void getRandomDice() {
    emit(
      DiceState(
        firstNumber: Random().nextInt(6),
        secondNumber: Random().nextInt(6),
        firstDice: chooseDice(state.firstNumber),
        secondDice: chooseDice(state.secondNumber),
      ),
    );
  }

  DiceVariant chooseDice(int number) {
    DiceVariant dice = switch (number) {
      0 => DiceVariant.dice_1,
      1 => DiceVariant.dice_2,
      2 => DiceVariant.dice_3,
      3 => DiceVariant.dice_4,
      4 => DiceVariant.dice_5,
      5 => DiceVariant.dice_6,
      _ => DiceVariant.dice_1,
    };
    return dice;
  }
}
