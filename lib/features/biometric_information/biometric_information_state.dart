abstract class BiometricInformationState {}

class BiometricInformationInitialState extends BiometricInformationState {}

class BiometricInformationLoadingState extends BiometricInformationState {}

class BiometricInformationSuccessState extends BiometricInformationState {}

class BiometricInformationErrorState extends BiometricInformationState {
  final String message;
  BiometricInformationErrorState(this.message);
}
