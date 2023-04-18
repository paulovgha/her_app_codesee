abstract class ActivitiesState {}

class ActivitiesInitialState extends ActivitiesState {}

class ActivitiesLoadingState extends ActivitiesState {}

class ActivitiesSuccessState extends ActivitiesState {}

class ActivitiesErrorState extends ActivitiesState {
  final String message;
  ActivitiesErrorState(this.message);
}
