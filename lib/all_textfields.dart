import 'package:flutter/widgets.dart';

class AllTextfields {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool obscureText;

  AllTextfields({
     required this.label,
     required this.hint,
     required this.icon,
     required this.controller,
     required this.obscureText,
  });
}