import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/add_medication_type_bloc.dart';

class AddMedicationTypeContent extends StatefulWidget {
  const AddMedicationTypeContent({super.key});

  @override
  State<AddMedicationTypeContent> createState() => _AddMedicationTypeContentState();
}

class _AddMedicationTypeContentState extends State<AddMedicationTypeContent> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final AddMedicationTypeBloc bloc = context.read<AddMedicationTypeBloc>();
    _nameController.addListener(() => bloc.add(UpdateMedicationTypeName(_nameController.text)));
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final AddMedicationTypeBloc bloc = context.read<AddMedicationTypeBloc>();

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Placeholder',
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: Column(
          children: <Widget>[
            BlocBuilder<AddMedicationTypeBloc, AddMedicationTypeState>(
              builder: (BuildContext context, AddMedicationTypeState state) {
                return AppTextField(
                  label: 'Placeholder',
                  textEditingController: _nameController,
                  error: state.nameError?.translate(),
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
