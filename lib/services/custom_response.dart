import 'package:project_cycles/services/custom_exception.dart';

enum Status { loading, completed, error, none }

class CustomResponse<T> {
  late Status status;
  T? data;
  CustomException? error;

  CustomResponse({required this.status, this.data, this.error});

  CustomResponse.none() : status = Status.none;
  CustomResponse.loading() : status = Status.loading;
  CustomResponse.error({required this.error}) : status = Status.error;
  CustomResponse.completed({required this.data}) : status = Status.completed;

  bool get hasNone => status == Status.none;
  bool get hasError => status == Status.error;
  bool get isLoading => status == Status.loading;
  bool get isCompleted => status == Status.completed;
}
