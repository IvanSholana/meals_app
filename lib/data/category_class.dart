import 'package:flutter/material.dart';

class Category {
  Category({required this.id, this.color = Colors.white, required this.title});

  final String id, title;
  final Color color;
}
