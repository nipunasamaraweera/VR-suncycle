import 'package:flutter/material.dart';
import 'package:phone_app/utilities/constants.dart';

class InputTextField extends StatefulWidget {
  // custom constructor
  InputTextField({
    required this.buttonText,
    this.fieldController,
    this.height,
    this.enableToggle = false, // Add a new property to enable/disable toggle
  }) : obscureText = enableToggle
            ? true
            : false; // Initialize obscureText based on enableToggle

  final String buttonText;
  final TextEditingController? fieldController;
  final double? height;
  bool obscureText;
  final bool enableToggle; // New property to indicate toggle enablement

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  void toggleObscured() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: kLoginRegisterBtnColour,
          width: 2.0,
        ),
        color: kFillInText.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        textAlign: TextAlign.left,
        controller: widget.fieldController,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.buttonText,
          hintStyle: kSubSubTitlePurple,
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          suffixIcon: widget.enableToggle
              ? _buildSuffixIcon()
              : null, // Conditionally show suffix icon
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return GestureDetector(
      onTap: toggleObscured,
      child: Icon(
        widget.obscureText
            ? Icons.visibility_rounded
            : Icons.visibility_off_rounded,
        size: 24,
        color: kLoginRegisterBtnColour,
      ),
    );
  }
}

/* working version

import 'package:flutter/material.dart';
import 'package:phone_app/utilities/constants.dart';

class InputTextField extends StatefulWidget {
  // custom constructor
  InputTextField({
    required this.buttonText,
    this.fieldController,
    this.height,
    this.enableToggle = false, // Add a new property to enable/disable toggle
  }) : obscureText = enableToggle
            ? true
            : false; // Initialize obscureText based on enableToggle

  final String buttonText;
  final TextEditingController? fieldController;
  final double? height;
  bool obscureText;
  final bool enableToggle; // New property to indicate toggle enablement

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  void toggleObscured() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: kLoginRegisterBtnColour,
          width: 2.0,
        ),
        color: kFillInText.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        textAlign: TextAlign.left,
        controller: widget.fieldController,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          labelText: widget.buttonText,
          labelStyle: TextStyle(color: kFillInText),
          border: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 30, 0, 0),
          suffixIcon: widget.enableToggle
              ? _buildSuffixIcon()
              : null, // Conditionally show suffix icon
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return GestureDetector(
      onTap: toggleObscured,
      child: Icon(
        widget.obscureText
            ? Icons.visibility_rounded
            : Icons.visibility_off_rounded,
        size: 24,
        color: kLoginRegisterBtnColour,
      ),
    );
  }
}

 */
