import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetNotificationSettingsUseCase _getNotificationSettingsUseCase;
  final UpdateNotificationSettingsUseCase _updateNotificationSettingsUseCase;

  SettingsBloc({
    required GetNotificationSettingsUseCase getNotificationSettingsUseCase,
    required UpdateNotificationSettingsUseCase updateNotificationSettingsUseCase,
  })  : _getNotificationSettingsUseCase = getNotificationSettingsUseCase,
        _updateNotificationSettingsUseCase = updateNotificationSettingsUseCase,
        super(const SettingsState.initial()) {
    on<Initialize>(_onInitialize);
    on<UpdateNotificationSettings>(_onUpdateNotificationSettings);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<SettingsState> emit,
  ) async {
    final NotificationSettings settings = await _getNotificationSettingsUseCase.execute();

    emit(state.copyWith(
      receiveMedications: settings.receiveMedications,
      receivePrescriptions: settings.receivePrescriptions,
      loading: Loading.completed,
    ));
  }

  Future<void> _onUpdateNotificationSettings(
    UpdateNotificationSettings event,
    Emitter<SettingsState> emit,
  ) async {
    if ((event.receivePrescriptions ?? false) || (event.receiveMedications ?? false)) {
      final bool hasPermission = await NotificationService.requestPermission();

      if (!hasPermission) {
        return;
      }
    }

    emit(state.copyWith(
      receivePrescriptions: event.receivePrescriptions,
      receiveMedications: event.receiveMedications,
    ));

    final UpdateNotificationSettingsPayload payload = UpdateNotificationSettingsPayload(
      receivePrescriptions: state.receivePrescriptions,
      receiveMedications: state.receiveMedications,
    );

    await _updateNotificationSettingsUseCase.execute(payload);
  }
}
