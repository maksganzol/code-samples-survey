part of 'account_details_bloc.dart';

@freezed
class AccountDetailsState
    with _$AccountDetailsState, IsLoadingMixin, HasChangesMixin {
  const AccountDetailsState._();

  const factory AccountDetailsState.loading() = _Loading;

  const factory AccountDetailsState.error(AppException error) = _Error;

  const factory AccountDetailsState.editable({
    @Default('') String firstName,
    @Default('') String lastName,
    CountryModel? residence,
    CountryModel? nationality,
    MyProfileModel? initialUser,
    DayOfYear? birthDate,
    @Default(false) bool hasChanges,
  }) = AccountDetailsEditableState;

  factory AccountDetailsState.initial(MyProfileModel? user) {
    if (user == null) {
      return const AccountDetailsState.editable();
    }
    return AccountDetailsState.editable(
      firstName: user.firstName,
      lastName: user.lastName,
      residence: user.residence,
      nationality: user.nationality,
      birthDate: user.birthDate,
      initialUser: user,
    );
  }

  @override
  bool get isLoading => this is _Loading;

  @override
  bool get hasChanges => maybeMap(
        editable: (state) => state.hasChanges,
        orElse: () => false,
      );
}
