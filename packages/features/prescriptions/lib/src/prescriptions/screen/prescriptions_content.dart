import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/prescriptions_bloc.dart';
import '../widgets/prescription_entry_widget.dart';

class PrescriptionsContent extends StatelessWidget {
  const PrescriptionsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;
    final PrescriptionsBloc bloc = context.read<PrescriptionsBloc>();

    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleKeys.prescriptions_title.observeTranslation(context),
        style: CustomAppBarStyle.secondary,
      ),
      backgroundColor: colors.background,
      body: BlocBuilder<PrescriptionsBloc, PrescriptionsState>(
        builder: (BuildContext context, PrescriptionsState state) {
          if (state.isLoading) {
            return const Center(
              child: AppLoadingIndicator(),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppDimens.DEFAULT_PAGE_PADDING),
            itemCount: state.prescriptions.length,
            itemBuilder: (BuildContext context, int index) {
              return PrescriptionEntryWidget(
                entry: state.prescriptions[index],
                onDeletePressed: () => bloc.add(DeletePrescriptionEntry(index)),
                onViewDetailsPressed: () => bloc.add(ViewPrescriptionEntryDetails(index)),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: AppDimens.DEFAULT_LIST_ITEM_GAP),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: AppFloatingButton(
        onPressed: () => bloc.add(const AddPrescription()),
      ),
    );
  }
}
