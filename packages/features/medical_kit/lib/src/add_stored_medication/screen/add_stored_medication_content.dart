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
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final AddStoredMedicationBloc bloc = context.read<AddStoredMedicationBloc>();

    _expirationDateController.addListener(
      () => bloc.add(UpdateExpirationDate(_expirationDateController.text)),
    );

    _quantityController.addListener(
      () => bloc.add(UpdateQuantity(_quantityController.text)),
    );
  }

  @override
  void dispose() {
    _expirationDateController.dispose();
    _quantityController.dispose();
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
        child: BlocBuilder<AddStoredMedicationBloc, AddStoredMedicationState>(
          builder: (BuildContext context, AddStoredMedicationState state) {
            return Column(
              children: <Widget>[
                AppDateTextField(
                  label: 'Placeholder',
                  textEditingController: _expirationDateController,
                  error: state.expirationDateError,
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppTextField(
                  label: 'Quantity',
                  textEditingController: _quantityController,
                  error: state.quantityError,
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                const Spacer(),
                AppButton(
                  text: 'Submit',
                  onPressed: () => bloc.add(const SubmitInput()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
