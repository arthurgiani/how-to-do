part of 'subscription_cubit.dart';

@immutable
abstract class QueryCubitState {}

class QueryCubitInitial extends QueryCubitState {}

class QueryLoading extends QueryCubitState {}

class QuerySuccessful extends QueryCubitState {
  final List<EmployeeModel> employeesList;

  QuerySuccessful(this.employeesList);
}

class QueryError extends QueryCubitState {
  final String message;

  QueryError(this.message);
}
