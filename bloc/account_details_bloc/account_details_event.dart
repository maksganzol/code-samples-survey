part of 'account_details_bloc.dart';

@freezed
class AccountDetailsEvent with _$AccountDetailsEvent {
  const factory AccountDetailsEvent.save() = _Save;

  const factory AccountDetailsEvent.setFirstName(String firstName) =
      _SetFirstName;

  const factory AccountDetailsEvent.setLastName(String lasName) = _SetLastName;

  const factory AccountDetailsEvent.setNationality(CountryModel nationality) =
      _SetNationality;

  const factory AccountDetailsEvent.setRedidence(CountryModel residence) =
      _SetResidence;

  const factory AccountDetailsEvent.setBirthDate(DateTime birthDate) =
      _SetBirthDate;
}
