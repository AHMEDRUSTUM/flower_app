import 'dart:ui';

import 'package:flutter/material.dart';

const MyTextFiledStyle = InputDecoration(
  enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
  filled: true,
  contentPadding: EdgeInsets.all(15),
);