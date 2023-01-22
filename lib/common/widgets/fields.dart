import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_listing_with_signup_demo/common/widgets/widget_export.dart';

import '../../utils/utils_export.dart';

class Field extends StatefulWidget {
  final String? Function(String?)? validator;
  final bool autofocus;
  final Color fillColor;
  final String? labelValue;
  final int maxLine;
  final int? minLine;
  final int? maxLength;
  final bool isRequire;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final bool isPassword;
  final bool readOnly;
  final String hint;
  final String? initialValue;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Function()? onTap;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final TextInputType? inputType;
  final String? validationMessage;
  final TextEditingController controller;
  final BoxConstraints? constraints;
  final double? topLeftBorderRadius;
  final double? topRightBorderRadius;
  final double? bottomLeftBorderRadius;
  final double? bottomRightBorderRadius;
  final double? circularRadius;
  final double? borderSideWidth;
  final Color? borderColor;
  final Color? focusBorderColor;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? labelStyle;

  const Field({
    Key? key,
    this.validator,
    this.autofocus = false,
    this.isRequire = false,
    this.readOnly = false,
    this.fillColor = fildColor,
    this.maxLine = 1,
    this.minLine,
    this.maxLength,
    this.labelValue,
    this.onTap,
    required this.onChanged,
    this.inputType,
    this.isPassword = false,
    required this.hint,
    this.hintStyle,
    this.initialValue,
    this.textStyle,
    this.rightIcon,
    this.leftIcon,
    this.validationMessage = '',
    required this.controller,
    this.constraints,
    this.bottomLeftBorderRadius,
    this.bottomRightBorderRadius,
    this.topLeftBorderRadius,
    this.topRightBorderRadius,
    this.circularRadius = 50.0,
    this.borderSideWidth,
    this.borderColor,
    this.focusBorderColor,
    this.focusNode,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.labelStyle,
  }) : super(key: key);

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildTextField(context),
        buildValidationMessage(context),
      ],
    );
  }

  Widget buildTextField(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: TextFormField(
        textInputAction: widget.textInputAction,
        textAlign: widget.textAlign,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        focusNode: widget.focusNode,
        initialValue: widget.initialValue,
        keyboardType: widget.inputType,
        autofocus: widget.autofocus,
        onFieldSubmitted: widget.onFieldSubmitted,
        obscureText: widget.isPassword ? visible : widget.isPassword,
        style: widget.textStyle ??
            defaultTextStyle(
              fontWeight: FontWeight.w500,
              size: 12.0,
              color: white,
            ),
        controller: widget.controller,
        onChanged: widget.onChanged!,
        readOnly: widget.readOnly,
        onTap: widget.onTap ?? () {},
        maxLength: widget.maxLength,
        cursorColor: white,
        maxLines: widget.maxLine,
        minLines: widget.minLine,
        textCapitalization: widget.textCapitalization,
        decoration: InputDecoration(
          constraints: widget.constraints,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                  widget.bottomRightBorderRadius ?? widget.circularRadius ?? 0),
              topRight: Radius.circular(
                  widget.topRightBorderRadius ?? widget.circularRadius ?? 0),
              bottomLeft: Radius.circular(
                  widget.bottomLeftBorderRadius ?? widget.circularRadius ?? 0),
              topLeft: Radius.circular(
                  widget.topLeftBorderRadius ?? widget.circularRadius ?? 0),
            ),
            borderSide: BorderSide(
              width: widget.borderSideWidth ?? 0,
              color: widget.borderColor ?? transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                  widget.bottomRightBorderRadius ?? widget.circularRadius ?? 0),
              topRight: Radius.circular(
                  widget.topRightBorderRadius ?? widget.circularRadius ?? 0),
              bottomLeft: Radius.circular(
                  widget.bottomLeftBorderRadius ?? widget.circularRadius ?? 0),
              topLeft: Radius.circular(
                  widget.topLeftBorderRadius ?? widget.circularRadius ?? 0),
            ),
            borderSide: BorderSide(
              width: widget.borderSideWidth ?? 0,
              color: widget.borderColor ?? transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(
                  widget.bottomRightBorderRadius ?? widget.circularRadius ?? 0),
              topRight: Radius.circular(
                  widget.topRightBorderRadius ?? widget.circularRadius ?? 0),
              bottomLeft: Radius.circular(
                  widget.bottomLeftBorderRadius ?? widget.circularRadius ?? 0),
              topLeft: Radius.circular(
                  widget.topLeftBorderRadius ?? widget.circularRadius ?? 0),
            ),
            borderSide: BorderSide(
              width: widget.borderSideWidth ?? 0,
              color:
              widget.focusBorderColor ?? widget.borderColor ?? transparent,
            ),
          ),
          alignLabelWithHint: true,
          suffixIcon: widget.rightIcon,
          prefixIcon: widget.leftIcon,
          counterText: "",
          hintText: widget.hint,
          hintStyle: widget.hintStyle ??
              const TextStyle(
                color: greyShade,
                fontWeight: FontWeight.w400,
              ),
          filled: true,
          isDense: true,
          fillColor: widget.fillColor,
        ),
      ),
    );
  }

  Widget buildValidationMessage(BuildContext context) {
    return buildValidationErrorMessage(context,
        validationMessage: widget.validationMessage!);
  }

  bool isBlank(String value) => value == '';

  Widget buildValidationErrorMessage(BuildContext context,
      {String validationMessage = ''}) {
    return (!isBlank(validationMessage))
        ? Padding(
      padding: paddingOnly(
        left: 10.0,
        top: 5.0,
      ),
      child: Row(
        children: [
          Text(
            validationMessage,
            style: TextStyle(
              fontSize: 10,
              color: widget.validationMessage == "Valid"
                  ? Colors.green
                  : Colors.red,
            ),
          ),
        ],
      ),
    )
        : Container();
  }
}
