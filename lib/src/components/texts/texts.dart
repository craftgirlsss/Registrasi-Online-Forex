import 'package:flutter/material.dart';

class CustomText {
  static Text titleHeadingPage(BuildContext context, {String? text}){ // untuk title page
    return Text(text ?? "Title", style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center);
  }

  static Text titleSubHead(BuildContext context, {String? text}){ // untuk title lanjutan
    return Text(text ?? "Title", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center);
  }

  static Text titleMedium(BuildContext context, {String? text}){ // untuk title lanjutan
    return Text(text ?? "Title", style: Theme.of(context).textTheme.titleSmall, textAlign: TextAlign.center);
  }
}