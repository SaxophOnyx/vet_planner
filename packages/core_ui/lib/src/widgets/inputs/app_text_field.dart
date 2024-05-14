import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core_ui.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final List<TextInputFormatter>? formatters;
  final TextInputType? inputType;
  final String? error;
  final Widget? suffixIcon;
  final bool isMultiline;

  const AppTextField({
    super.key,
    required this.label,
    required this.textEditingController,
    this.formatters,
    this.inputType,
    this.error,
    this.suffixIcon,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final bool hasError = error != null;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.textSecondary,
          ),
        ),
        const SizedBox(height: AppDimens.DEFAULT_LABEL_GAP),
        TextField(
          keyboardType: inputType,
          minLines: isMultiline ? 4 : null,
          maxLines: isMultiline ? 4 : 1,
          controller: textEditingController,
          cursorColor: colors.primary,
          cursorErrorColor: colors.error,
          cursorWidth: AppDimens.DEFAULT_BORDER_THICKNESS,
          style: AppFonts.inter16Regular.copyWith(
            color: colors.text,
          ),
          inputFormatters: formatters,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            errorText: hasError ? ' ' : null,
            contentPadding: const EdgeInsets.all(AppDimens.DEFAULT_CONTAINER_PADDING),
            errorStyle: AppFonts.inter16Regular.copyWith(fontSize: 0),
            helperStyle: AppFonts.inter16Regular,
            fillColor: colors.container,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              borderSide: BorderSide(
                color: colors.textSecondary,
                width: AppDimens.DEFAULT_BORDER_THICKNESS,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              borderSide: BorderSide(
                color: colors.error,
                width: AppDimens.DEFAULT_BORDER_THICKNESS,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              borderSide: BorderSide(
                color: colors.textSecondary,
                width: AppDimens.DEFAULT_BORDER_THICKNESS,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              borderSide: BorderSide(
                color: colors.primary,
                width: AppDimens.DEFAULT_BORDER_THICKNESS,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDimens.DEFAULT_BORDER_RADIUS),
              borderSide: BorderSide(
                color: colors.error,
                width: AppDimens.DEFAULT_BORDER_THICKNESS,
              ),
            ),
            suffixIcon: suffixIcon,
          ),
        ),
        if (hasError)
          Padding(
            padding: const EdgeInsets.only(
              top: AppDimens.DEFAULT_LABEL_GAP,
            ),
            child: Text(
              error ?? '',
              style: AppFonts.inter16Regular.copyWith(
                color: colors.error,
              ),
            ),
          ),
      ],
    );
  }
}
