abstract class UserBirthDateState {}

class UserBirthDateInitialState extends UserBirthDateState {}

class UserBirthDateLoadingState extends UserBirthDateState {}

class UserBirthDateSuccessState extends UserBirthDateState {}

class UserBirthDateErrorState extends UserBirthDateState {
  final String message;
  UserBirthDateErrorState(this.message);
}
