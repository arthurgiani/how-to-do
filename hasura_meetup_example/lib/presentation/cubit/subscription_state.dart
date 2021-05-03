import 'package:flutter/widgets.dart';
import 'package:hasura_meetup_example/models/employee_model.dart';

@immutable
abstract class SubscriptionCubitState {}

class SubscriptionCubitInitial extends SubscriptionCubitState {}

class SubscriptionLoading extends SubscriptionCubitState {}

class SubscriptionSuccessful extends SubscriptionCubitState {
  final List<EmployeeModel> employeesList;

  SubscriptionSuccessful(this.employeesList);
}

class SubscriptionError extends SubscriptionCubitState {
  final String message;

  SubscriptionError(this.message);
}
