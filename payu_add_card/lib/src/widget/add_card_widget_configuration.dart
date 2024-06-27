import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payu_translations/payu_translations.dart';

class AddCardWidgetConfiguration {
  final AddCardWidgetTextInputDecoration cvvDecoration;
  final AddCardWidgetTextInputDecoration numberDecoration;
  final AddCardWidgetTextInputDecoration dateDecoration;
  final bool isFooterVisible;

  AddCardWidgetConfiguration({
    required this.cvvDecoration,
    required this.dateDecoration,
    required this.numberDecoration,
    required this.isFooterVisible,
  });

  factory AddCardWidgetConfiguration.payu() {
    return AddCardWidgetConfiguration(
      cvvDecoration: AddCardWidgetTextInputDecoration.cvv(),
      dateDecoration: AddCardWidgetTextInputDecoration.date(),
      numberDecoration: AddCardWidgetTextInputDecoration.number(),
      isFooterVisible: false,
    );
  }
}

class AddCardWidgetTextInputDecoration {
  final String? hintText;
  final String title;
  final TextStyle titleStyle;
  final Color borderColor;
  final Color errorBorderColor;
  final Color cursorColor;
  final Color fillColor;
  final TextAlign? textAlign;
  final TextStyle inputTextStyle;
  final TextStyle hintStyle;
  final TextStyle errorTextStyle;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const AddCardWidgetTextInputDecoration( {
    required this.title,
    required this.titleStyle,
    required this.borderColor,
    required this.errorBorderColor,
    required this.cursorColor,
    required this.fillColor,
    this.textAlign,
    required this.inputTextStyle,
    required this.hintStyle,
    required this.errorTextStyle,
    required this.maxLength,
    this.hintText,
    this.inputFormatters,
  });

  factory AddCardWidgetTextInputDecoration.cvv() {
    return AddCardWidgetTextInputDecoration(
      hintText: 'cvv_code'.translated(),
      title: "",
      borderColor: Colors.white,
      errorBorderColor: Colors.red,
      cursorColor: Colors.black,
      fillColor: Colors.white,
      inputTextStyle: TextStyle(),
      hintStyle: TextStyle(),
      errorTextStyle: TextStyle(),
      maxLength: 3, titleStyle: TextStyle(),
    );
  }

  factory AddCardWidgetTextInputDecoration.date() {
    return AddCardWidgetTextInputDecoration(
      hintText: 'MM/YY'.translated(),
      title: "",
      borderColor: Colors.white,
      errorBorderColor: Colors.red,
      cursorColor: Colors.black,
      fillColor: Colors.white,
      inputTextStyle: TextStyle(),
      hintStyle: TextStyle(),
      errorTextStyle: TextStyle(),
      titleStyle: TextStyle(),
      maxLength: 5,
    );
  }

  factory AddCardWidgetTextInputDecoration.number() {
    return AddCardWidgetTextInputDecoration(
      hintText: 'card_number'.translated(),
      title: "",
      borderColor: Colors.white,
      errorBorderColor: Colors.red,
      cursorColor: Colors.black,
      fillColor: Colors.white,
      inputTextStyle: TextStyle(),
      hintStyle: TextStyle(),
      errorTextStyle: TextStyle(),
      titleStyle: TextStyle(),
      maxLength: 10,
    );
  }
}
