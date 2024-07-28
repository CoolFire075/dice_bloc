import 'package:dice_bloc/features/dice/cubit/dice_cubit.dart';
import 'package:dice_bloc/features/dice/cubit/dice_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  @override
  Widget build(BuildContext context) {
    final notifier = context.read<DiceCubit>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Randomised Dice',
          style: TextStyle(fontSize: 40),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DiceImage(),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orange),
                ),
                onPressed: () {
                  notifier.getRandomDice();
                },
                child: const Icon(
                  Icons.help_outline,
                  size: 60,
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
class DiceImage extends StatelessWidget {
  const DiceImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DiceState>(
      builder: (BuildContext context, value, Widget? child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              value.firstDice.path,
              width: 150,
            ),
            Image.asset(
              value.secondDice.path,
              width: 150,
            )
          ],
        );
      },
    );
  }
}
