abstract class HormonalContraceptiveState {}

class HormonalContracetiveInitialState extends HormonalContraceptiveState {}

class HormonalContracetiveLoadingState extends HormonalContraceptiveState {}

class HormonalContracetiveSuccessState extends HormonalContraceptiveState {}

class HormonalContracetiveErrorState extends HormonalContraceptiveState {
  final String message;
  HormonalContracetiveErrorState(this.message);
}
