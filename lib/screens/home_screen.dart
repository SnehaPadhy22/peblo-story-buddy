import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/story_provider.dart';
import '../widgets/buddy_character.dart';
import '../widgets/story_card.dart';
import '../widgets/quiz_card.dart';
import '../data/quiz_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ConfettiController _confettiController;

  int currentQuestionIndex = 0;
  bool answeredCorrectly = false;

  static const String storyText =
      "Once upon a time, a clever little robot named Pip lost his shiny blue gear in the Whispering Woods...";

  @override
  void initState() {
    super.initState();

    _confettiController = ConfettiController(
      duration: const Duration(seconds: 3),
    );
  }

  Future<void> speakStory() async {
    final provider =
        Provider.of<StoryProvider>(context, listen: false);

    provider.startLoading();

    await Future.delayed(
      const Duration(seconds: 3),
    );

    provider.stopLoading();

    provider.revealQuiz();
  }

  void checkAnswer(String selectedAnswer) {
  final provider =
      Provider.of<StoryProvider>(
    context,
    listen: false,
  );

  if (selectedAnswer ==
      quizData[currentQuestionIndex]["answer"]) {

    answeredCorrectly = true;

    _confettiController.play();

    if (currentQuestionIndex ==
        quizData.length - 1) {
      provider.markSuccess();
    }

    setState(() {});
  } else {
    provider.triggerShake();
  }
}

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFE0B2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Consumer<StoryProvider>(
            builder: (context, provider, child) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConfettiWidget(
                      confettiController:
                          _confettiController,
                      blastDirectionality:
                          BlastDirectionality.explosive,
                      shouldLoop: false,
                    ),
                  ),
                  SingleChildScrollView(
                    padding:
                        const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),

                        const Text(
                          "🤖 Peblo Story Buddy",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const BuddyCharacter(),

                        const SizedBox(height: 20),

                        const Text(
                          "Meet Pip!",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 20),

                        const StoryCard(
                          story: storyText,
                        ),

                        const SizedBox(height: 30),

                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton.icon(
                            onPressed: speakStory,
                            icon: const Icon(
                              Icons.volume_up,
                            ),
                            label: const Text(
                              "Read Me A Story",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.orange,
                              foregroundColor:
                                  Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        if (provider.isLoading)
                          const Column(
                            children: [
                              CircularProgressIndicator(),
                              SizedBox(height: 10),
                              Text(
                                "Reading Story...",
                              ),
                            ],
                          ),

                        const SizedBox(height: 20),

                        if (provider.showQuiz)
                          AnimatedContainer(
                            duration:
                                const Duration(
                              milliseconds: 100,
                            ),
                            transform:
                                Matrix4.translationValues(
                              provider.shakeQuiz
                                  ? 80
                                  : 0,
                              0,
                              0,
                            ),
                            child: QuizCard(
                              question:
                                  quizData[
                                      currentQuestionIndex]
                                  ["question"] as String,
                              options:
                                  List<String>.from(
                                quizData[
                                        currentQuestionIndex]
                                    ["options"],
                              ),
                              onOptionSelected:
                                  checkAnswer,
                            ),
                          ),

                        if (provider.showQuiz &&
                            answeredCorrectly &&
                            !provider.success)
                          Padding(
                            padding:
                                const EdgeInsets.only(
                              top: 20,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  currentQuestionIndex++;
                                  answeredCorrectly =
                                      false;
                                });
                              },
                              child: const Text(
                                "Next Question",
                              ),
                            ),
                          ),

                        const SizedBox(height: 20),

                        if (provider.success)
                          Column(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets
                                        .all(20),
                                decoration:
                                    BoxDecoration(
                                  color: Colors
                                      .green.shade100,
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              20),
                                ),
                                child: const Text(
                                  "🎉 Quiz Completed!",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),

                              const SizedBox(
                                  height: 20),

                              ElevatedButton(
                                onPressed: () {
                                  provider.reset();

                                  setState(() {
                                    currentQuestionIndex =
                                        0;
                                    answeredCorrectly =
                                        false;
                                  });
                                },
                                child: const Text(
                                  "Retry",
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}