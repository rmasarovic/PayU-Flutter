import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:payu_ui/payu_ui.dart';

import '../add_card_widget_configuration.dart';
import 'add_card_text_field_controller.dart';

class AddCardTextField extends StatelessWidget {
  final AddCardTextFieldController controller;
  final AddCardWidgetTextInputDecoration decoration;

  const AddCardTextField({
    Key? key,
    required this.controller,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: decoration.borderColor),
      borderRadius: BorderRadius.circular(12),
    );

    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: decoration.errorBorderColor),
      borderRadius: BorderRadius.circular(12),
    );

    return PayuProviderWidget<AddCardTextFieldController>(
      create: (context) => controller,
      builder: (context, controller) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: SizedBox(
          child: FocusScope(
              onFocusChange: (value) => controller.didUpdateFocus(value),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "${decoration.title}:",
                            textAlign: TextAlign.right,
                            style: decoration.titleStyle,
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ConstrainedBox(                             
                                constraints: const BoxConstraints(minWidth: 52),
                                child: IntrinsicWidth(
                                  child: TextField(
                                    keyboardType: decoration.inputType,
                                    textAlign: decoration.textAlign ??
                                        TextAlign.center,
                                    cursorColor: decoration.cursorColor,
                                    cursorWidth: 0.5,
                                    style: decoration.inputTextStyle,
                                    maxLength: decoration.maxLength,
                                    decoration: InputDecoration(
                                      prefixIcon: decoration.prefixIcon,
                                      prefixIconColor:
                                          controller.errorText == null
                                              ? decoration.inputTextStyle.color
                                              : decoration.errorTextStyle.color,

                                      hintText: decoration.hintText,
                                      // labelText: decoration.labelText,
                                      // errorText: controller.errorText,
                                      hintMaxLines: 2,
                                      errorMaxLines: 2,
                                      helperMaxLines: 2,
                                      hintStyle: decoration.hintStyle,
                                      contentPadding: const EdgeInsets.all(12),
                                      border: border,
                                      focusedBorder: border,
                                      fillColor: decoration.fillColor,
                                      filled: true,
                                      isDense: true,
                                      enabledBorder: border,
                                      disabledBorder: border,
                                      errorBorder: errorBorder,
                                      counterText: "",
                                    ),
                                    inputFormatters: decoration.inputFormatters,
                                    controller:
                                        controller.textEditingController,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(flex: 2, child: Container()),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        flex: 3,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Visibility(
                                  maintainState: true,
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  visible: controller.errorText != null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
                                    child: Text(
                                      controller.errorText ?? "",
                                      style: decoration.errorTextStyle,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      )
                    ],
                  ),
                ],
              )
              // child: TextField(
              //   textAlign: decoration.textAlign ?? TextAlign.center,
              //   cursorColor: decoration.cursorColor,
              //   cursorWidth: 0.5,
              //   style: decoration.inputTextStyle,
              //   maxLength: decoration.maxLength,
              //   decoration: InputDecoration(
              //     hintText: decoration.hintText,
              //     // labelText: decoration.labelText,
              //     // errorText: controller.errorText,
              //     hintMaxLines: 2,
              //     errorMaxLines: 2,
              //     helperMaxLines: 2,
              //     hintStyle: decoration.hintStyle,
              //     contentPadding: const EdgeInsets.all(12),
              //     border: border,
              //     focusedBorder: border,
              //     fillColor: decoration.fillColor,
              //     filled: true,
              //     isDense: true,
              //     enabledBorder: border,
              //     disabledBorder: border,
              //     errorBorder: errorBorder,
              //     counterText: "",
              //   ),
              //   inputFormatters: decoration.inputFormatters,
              //   controller: controller.textEditingController,
              // )
              ),
        ),
      ),
    );
  }
}
