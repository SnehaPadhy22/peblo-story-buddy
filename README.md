# Peblo Story Buddy

## Overview

A Flutter-based interactive storytelling application designed for children. The app narrates a short story and then presents a data-driven quiz based on the story content.

## Framework

Flutter

## State Management

Provider

## Features

* Interactive story flow
* Loading state before story completion
* Data-driven quiz rendering from JSON
* Wrong answer feedback with shake animation
* Confetti celebration on correct answer
* Responsive child-friendly UI

## Architecture

The quiz content is loaded from a JSON data source (`quiz_data.dart`) rather than being hardcoded in the UI, allowing support for different questions and option counts without code changes.

## Performance Considerations

* Lightweight UI
* Provider-based state management
* Minimal widget rebuilds
* Suitable for mid-range Android devices

## AI Usage

AI tools were used to assist with Flutter architecture, state management patterns, and animation implementation. Generated code was reviewed, tested, and adapted manually.
