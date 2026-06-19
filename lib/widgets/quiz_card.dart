import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  final String question;
  final List<String> options;
  final Function(String) onOptionSelected;

  const QuizCard({
    super.key,
    required this.question,
    required this.options,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.quiz,
              size: 50,
              color: Colors.orange,
            ),

            const SizedBox(height: 10),

            Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ...options.map(
              (option) => Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () =>
                        onOptionSelected(option),

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.orange.shade100,
                      foregroundColor:
                          Colors.black,
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),
                      ),
                    ),

                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}