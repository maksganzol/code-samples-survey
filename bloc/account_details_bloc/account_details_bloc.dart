import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:panodyssey_core/panodyssey_core.dart';
import 'package:panodyssey_domain/mixins/bloc_on_state_mixin.dart';
import 'package:panodyssey_domain/mixins/mixins.dart';
import 'package:panodyssey_domain/models/models.dart';
import 'package:panodyssey_domain/providers/providers.dart';

part 'account_details_event.dart';
part 'account_details_state.dart';
part 'account_details_bloc.freezed.dart';

class AccountDetailsBloc extends Bloc<AccountDetailsEvent, AccountDetailsState>
    with BlocOnStateMixin {
  AccountDetailsBloc({
    required ProfileProvider profileProvider,
  })  : _profileProvider = profileProvider,
        super(AccountDetailsState.initial(profileProvider.user)) {
    onState<_Save, AccountDetailsEditableState>(_onAccountDetailsSave);
    onState<_SetBirthDate, AccountDetailsEditableState>(_onBirthDateSet);
    onState<_SetFirstName, AccountDetailsEditableState>(_onFirstNameSet);
    onState<_SetLastName, AccountDetailsEditableState>(_onLastNameSet);
    onState<_SetNationality, AccountDetailsEditableState>(_onNationalitySet);
    onState<_SetResidence, AccountDetailsEditableState>(_onResidenceSet);
  }

  final ProfileProvider _profileProvider;

  Future<void> _onAccountDetailsSave(
    _,
    AccountDetailsEditableState currentState,
    Emitter<AccountDetailsState> emit,
  ) async {
    emit(const AccountDetailsState.loading());

    final saveResult = await _profileProvider.updateAccountDetails(
      firstName: currentState.firstName,
      lastName: currentState.lastName,
      birthDate: currentState.birthDate?.value,
      residenceId: currentState.residence?.id,
      nationalityId: currentState.nationality?.id,
    );

    emit(
      saveResult.fold(
        AccountDetailsState.error,
        (_) => AccountDetailsState.initial(_profileProvider.user),
      ),
    );
  }

  void _onFirstNameSet(
    _SetFirstName event,
    AccountDetailsEditableState currentState,
    Emitter<AccountDetailsState> emit,
  ) {
    final newState = currentState.copyWith(firstName: event.firstName);
    emit(newState.copyWith(hasChanges: _checkIfHasChanges(newState)));
  }

  void _onLastNameSet(
    _SetLastName event,
    AccountDetailsEditableState currentState,
    Emitter<AccountDetailsState> emit,
  ) {
    final newState = currentState.copyWith(lastName: event.lasName);
    emit(newState.copyWith(hasChanges: _checkIfHasChanges(newState)));
  }

  void _onResidenceSet(
    _SetResidence event,
    AccountDetailsEditableState currentState,
    Emitter<AccountDetailsState> emit,
  ) {
    final newState = currentState.copyWith(residence: event.residence);
    emit(newState.copyWith(hasChanges: _checkIfHasChanges(newState)));
  }

  void _onNationalitySet(
    _SetNationality event,
    AccountDetailsEditableState currentState,
    Emitter<AccountDetailsState> emit,
  ) {
    final newState = currentState.copyWith(nationality: event.nationality);
    emit(newState.copyWith(hasChanges: _checkIfHasChanges(newState)));
  }

  void _onBirthDateSet(
    _SetBirthDate event,
    AccountDetailsEditableState currentState,
    Emitter<AccountDetailsState> emit,
  ) {
    final newState = currentState.copyWith(
      birthDate: DayOfYear(event.birthDate),
    );
    emit(newState.copyWith(hasChanges: _checkIfHasChanges(newState)));
  }

  bool _checkIfHasChanges(AccountDetailsEditableState newState) {
    final initialUser = newState.initialUser;
    final newUser = initialUser?.copyWith(
      firstName: newState.firstName,
      lastName: newState.lastName,
      residence: newState.residence,
      nationality: newState.nationality,
      birthDate: newState.birthDate,
    );

    return newUser != initialUser;
  }
}
