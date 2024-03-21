import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/add_medication_type_bloc.dart';

class AddMedicationTypeContent extends StatefulWidget {
  const AddMedicationTypeContent({super.key});

  @override
  State<AddMedicationTypeContent> createState() => _AddMedicationTypeContentState();
}

class _AddMedicationTypeContentState extends State<AddMedicationTypeContent> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final AddMedicationTypeBloc bloc = context.read<AddMedicationTypeBloc>();
    _textEditingController.addListener(() => bloc.add(UpdateMedicationTypeName(_textEditingController.text)));
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  // TODO(SaxophOnyx): Implement locale
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return Scaffold(
      appBar: const CustomAppBar(),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: Column(
          children: <Widget>[
            AppTextField(
              textEditingController: _textEditingController,
            ),
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
            AppButton(
              text: 'Title',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
