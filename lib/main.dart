import 'package:flutter/material.dart';
import "dart:math";

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Variables to hold the random choices of each player
  int rps1 = 1; // Player 1's choice (1: Rock, 2: Paper, 3: Scissors)
  int rps2 = 1; // Player 2's choice
  String result = ""; // Result of the game

  void play() {
    // Generates random choices for both players
    rps1 =
        Random().nextInt(3) + 1; // Random number between 1 and 3 for Player 1
    print('$rps1'); // Print Player 1's choice
    rps2 =
        Random().nextInt(3) + 1; // Random number between 1 and 3 for Player 2
    print('$rps2'); // Print Player 2's choice

    // Determine the result of the game
    if (rps1 == rps2) {
      result = "tie"; // If both choices are the same, it's a tie
    } else if (rps1 == 1 && rps2 == 3) {
      result = 'player 1 wins'; // Rock beats Scissors
    } else if (rps1 == 2 && rps2 == 1) {
      result = 'player 1 wins'; // Paper beats Rock
    } else if (rps1 == 3 && rps2 == 2) {
      result = 'player 1 wins'; // Scissors beats Paper
    } else {
      result = "player 2 wins"; // All other cases, Player 2 wins
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Rock Paper Scissors!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.red,
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Display Player 1's choice
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/$rps1.png', // Image path for Player 1
                          width: 100,
                          height: 100,
                        ),
                      ),
                      // Display Player 2's choice
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/$rps2.png', // Image path for Player 2
                          width: 100,
                          height: 100,
                        ),
                      )
                    ],
                  ),
                  // Display the result of the game
                  Text(
                    result,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  // Button to play the game
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.red,
                        margin: const EdgeInsets.all(30),
                        child: ElevatedButton(
                          onPressed: play, // Trigger the play function
                          child: const Text("Play"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
