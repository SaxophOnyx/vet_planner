import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/stored_medications_bloc.dart';
import '../widgets/stored_medication_list.dart';

class StoredMedicationsContent extends StatelessWidget {
  const StoredMedicationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final StoredMedicationsBloc bloc = context.read<StoredMedicationsBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Placeholder',
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: BlocBuilder<StoredMedicationsBloc, StoredMedicationsState>(
          builder: (BuildContext context, StoredMedicationsState state) {
            if (state.isLoading) {
              return const Center(
                child: AppLoadingIndicator(),
              );
            }

            return Column(
              children: <Widget>[
                Expanded(
                  child: StoredMedicationList(
                    medications: state.storedMedications,
                  ),
                ),
                const SizedBox(height: AppDimens.DEFAULT_PAGE_PADDING),
                AppButton(
                  text: 'Add stored medication',
                  onPressed: () => bloc.add(const AddStoredMedication()),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
