import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DateInputFormatter extends MaskTextInputFormatter {
  DateInputFormatter()
      : super(
          mask: '##/##/####',
          filter: <String, RegExp>{"#": RegExp(r'[0-9]')},
          type: MaskAutoCompletionType.eager,
        );
}
