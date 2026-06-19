import 'package:flutter/material.dart';

class StoryProvider extends ChangeNotifier {
  bool isLoading = false;
  bool showQuiz = false;
  bool success = false;
  bool shakeQuiz = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void revealQuiz() {
    showQuiz = true;
    notifyListeners();
  }

  void markSuccess() {
    success = true;
    notifyListeners();
  }

  void triggerShake() {
  print("SHAKE TRIGGERED");

  shakeQuiz = true;
  notifyListeners();

  Future.delayed(
    const Duration(milliseconds: 150),
    () {
      shakeQuiz = false;
      notifyListeners();
    },
  );
}

  void reset() {
    isLoading = false;
    showQuiz = false;
    success = false;
    shakeQuiz = false;
    notifyListeners();
  }
}