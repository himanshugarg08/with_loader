# With Loader

A Flutter package that provides loading functionality to a widget. Just Warp your widget with `WithLoader` and give all the necessary parameters.

## Features

* Can be helpful when you need a `Future` function to be performed `onTap` of a Button.
* You can customise the `child` opacity while it is in loading state.
* It exposes the result of the `Future` function, through which you can decide the `success` or `failure` condition of that function. 
* According to this `successCondition` it will perform `onSuccess` or `onFailure`.

## Getting started

Add `with_loader` to `pubspec.yaml` of your project:

```yaml
dependencies:
  with_loader: ^0.0.1
```

Import it in your Dart code:

```dart
import 'package:with_loader/with_loader.dart';
```

## Usage

Wrap any widget with `WithLoader<T>()`:  

```dart
WithLoader<Type>(
  child: AnyWidget()
),
```

Some required `parameters` to make this widget work:

```dart
WithLoader<String>(
  future: () => Future.delayed(const Duration(seconds: 2), () => "Success"),
  successCondition: (result) => result == "Success",
  child: Container(
      decoration: BoxDecoration(
      color: Colors.purple.shade400,
      borderRadius: BorderRadius.circular(50),
      ),
      child: const Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 16.0,
      ),
      child: Text(
          "Button",
          style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          ),
      ),
      ),
  ),
),
```
