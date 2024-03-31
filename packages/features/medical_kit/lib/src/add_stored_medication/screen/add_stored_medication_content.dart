import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/add_stored_medication_bloc.dart';

class AddStoredMedicationContent extends StatefulWidget {
  const AddStoredMedicationContent({super.key});

  @override
  State<AddStoredMedicationContent> createState() => _AddStoredMedicationContentState();
}

class _AddStoredMedicationContentState extends State<AddStoredMedicationContent> {
  final TextEditingController _expirationDateController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final AddStoredMedicationBloc bloc = context.read<AddStoredMedicationBloc>();
    _expirationDateController.addListener(() => bloc.add(UpdateExpirationDate(_expirationDateController.text)));
  }

  @override
  void dispose() {
    _expirationDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final AddStoredMedicationBloc bloc = context.read<AddStoredMedicationBloc>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Placeholder',
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: Column(
          children: <Widget>[
            BlocBuilder<AddStoredMedicationBloc, AddStoredMedicationState>(
              builder: (BuildContext context, AddStoredMedicationState state) {
                return AppDateTextField(
                  label: 'Placeholder',
                  textEditingController: _expirationDateController,
                  error: state.expirationDateError?.translate(),
                );
              },
            ),
            const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
            const Spacer(),
            AppButton(
              text: 'Title',
              onPressed: () => bloc.add(const SubmitInput()),
            ),
          ],
        ),
      ),
    );
  }
}
