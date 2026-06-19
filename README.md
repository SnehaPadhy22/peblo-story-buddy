# Peblo Story Buddy

## Overview

Peblo Story Buddy is a Flutter-based interactive storytelling application designed for children. The application presents a short story experience followed by an engaging quiz to reinforce comprehension and learning.

## Tech Stack

* Flutter
* Dart
* Provider (State Management)

## Features

* Interactive storytelling experience
* Loading state during story narration
* Data-driven quiz rendering from JSON data
* Multiple-choice quiz questions
* Shake animation for incorrect answers
* Confetti celebration for correct answers
* Next Question and Retry functionality
* Child-friendly responsive user interface

## Project Architecture

The application follows a modular structure:

* `screens/` – UI screens
* `widgets/` – Reusable UI components
* `providers/` – State management using Provider
* `data/` – Quiz data source (`quiz_data.dart`)

Quiz content is loaded dynamically from a JSON-like data source rather than being hardcoded into the UI, making the application scalable and easy to extend.

## State Management

Provider is used for managing:

* Loading states
* Quiz visibility
* Success states
* Shake animation triggers
* Quiz reset functionality

## Performance Considerations

* Lightweight widget tree
* Efficient state updates using Provider
* Minimal unnecessary rebuilds
* Suitable for mid-range Android devices

## Setup Instructions

1. Clone the repository
2. Run:

```bash
flutter pub get
```

3. Start the application:

```bash
flutter run
```

## AI Usage

AI tools were used to assist with:

* Flutter architecture planning
* State management implementation
* UI enhancement suggestions
* Animation implementation guidance

All generated code was reviewed, tested, modified, and integrated manually.

## Repository

GitHub Repository:
https://github.com/SnehaPadhy22/peblo-story-buddy
