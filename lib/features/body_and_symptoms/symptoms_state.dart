abstract class SymptomsState {}

class SymptomsInitialState extends SymptomsState {}

class SymptomsLoadingState extends SymptomsState {}

class SymptomsSuccessState extends SymptomsState {}

class SymptomsErrorState extends SymptomsState {
  final String message;
  SymptomsErrorState(this.message);
}
