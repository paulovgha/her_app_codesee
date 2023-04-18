abstract class CycleState {}

class CycleInitialState extends CycleState {}

class CycleLoadingState extends CycleState {}

class CycleSuccessState extends CycleState {}

class CycleErrorState extends CycleState {
  final String message;
  CycleErrorState(this.message);
}
