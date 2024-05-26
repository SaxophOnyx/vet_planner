import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/prescription_details_bloc.dart';

class PrescriptionDetailsContent extends StatelessWidget {
  const PrescriptionDetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors colors = context.appColors;

    return AppBottomSheet(
      title: 'Details',
      child: BlocBuilder<PrescriptionDetailsBloc, PrescriptionDetailsState>(
        builder: (BuildContext context, PrescriptionDetailsState state) {
          if (state.isLoading) {
            return const SizedBox(
              height: AppDimens.BOTTOM_SHEET_LOADING_CONTENT_HEIGHT,
              child: Center(
                child: AppLoadingIndicator(),
              ),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
