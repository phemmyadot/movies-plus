import 'package:flutter/material.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';

class CustomInput extends StatefulWidget {
  final controller;
  final onSubmit;

  CustomInput(this.controller, this.onSubmit);
  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (text) => widget.onSubmit(text),
      controller: widget.controller,
      style: TextStyle(
        color: AppColors.green_ming,
        fontSize: 14,
        height: 1.5,
        fontWeight: FontWeight.normal,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            AppIcons.search,
            color: AppColors.green_ming,
          ),
          onPressed: () => widget.onSubmit(widget.controller.text),
        ),
        counterText: '',
        hintText: 'Enter Movie Title',
        hintStyle: TextStyle(
          color: AppColors.green_ming,
          fontSize: 14,
          fontWeight: FontWeight.w200,
        ),
        errorBorder: new OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.redAccent),
        ),
        errorMaxLines: 5,
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 10,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green_ming,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.green_ming.withOpacity(0.5),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
