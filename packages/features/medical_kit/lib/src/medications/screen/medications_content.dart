import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/medications_bloc.dart';
import '../widgets/list/medication_list.dart';

class MedicationsContent extends StatelessWidget {
  const MedicationsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final MedicationsBloc bloc = context.read<MedicationsBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.medKit_medications_title.translate(),
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
        child: BlocBuilder<MedicationsBloc, MedicationsState>(
          builder: (BuildContext context, MedicationsState state) {
            // TODO(SaxophOnyx): Handle error state
            if (state.isLoading) {
              return const Center(
                child: AppLoadingIndicator(),
              );
            }

            if (state.medications.isEmpty) {
              return Center(
                child: Text(
                  'There is no medications yet',
                  textAlign: TextAlign.center,
                  style: AppFonts.inter16SemiBold.copyWith(
                    color: colors.text,
                  ),
                ),
              );
            }

            return MedicationList(
              medication: state.medications,
              onManageStoredPressed: (int index) => bloc.add(ManageStoredMedications(index)),
              onAddStoredPressed: (int index) => bloc.add(AddStoredMedication(index)),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: AppFloatingButton(
        onPressed: () => bloc.add(const AddMedication()),
      ),
    );
  }
}
