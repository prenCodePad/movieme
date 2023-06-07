import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/common/app_mixin.dart';

class CommonTextField extends StatelessWidget with AppMixin {
  final String? label;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final double? height;
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final Widget? icon;
  final String? footNote;
  final String? hintText;
  final EdgeInsets? padding;
  final bool obscureText;
  final Color? color;
  final InputDecoration? decoration;

  const CommonTextField(
      {Key? key,
      this.label,
      this.validator,
      this.inputFormatters,
      this.keyboardType,
      this.controller,
      this.onChanged,
      this.footNote,
      this.height,
      this.icon,
      this.decoration,
      this.padding,
      this.obscureText = false,
      this.color,
      this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Text(
              //
              label ?? '',
              style: theme.body(),
            ),
          if (label != null) const SizedBox(height: 8),
          Container(
            height: height ?? 80,
            color: color,
            child: TextFormField(
              inputFormatters: inputFormatters ?? [],
              keyboardType: keyboardType,
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              validator: validator,
              style: const TextStyle(color: Colors.white),
              decoration: decoration ??
                  InputDecoration(
                      helperText: footNote ?? '',
                      hintText: hintText,
                      hintStyle: theme.body(color: Colors.white),
                      suffix: icon,
                      border: _border(),
                      enabledBorder: _border(),
                      focusedBorder: _border()),
            ),
          ),
        ],
      ),
    );
  }

  _border() => OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      );
}
