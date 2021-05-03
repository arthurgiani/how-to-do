import 'package:bloc/bloc.dart';

import '../../models/change_variables_model.dart';
import '../../repositories/employee_repository.dart';
import 'subscription_cubit.dart';

class QueryCubit extends Cubit<QueryCubitState> {
  final EmployeeRepository repository;
  late VariablesModel variablesModel;
  QueryCubit(
    this.repository,
  ) : super(
          QueryCubitInitial(),
        ) {
    variablesModel = VariablesModel(
      orderBy: 'asc',
      name: '',
    );
  }

  Future<void> getEmployeesListQuery() async {
    emit(QueryLoading());
    try {
      final result = await repository.getEmployeesListQuery(
        variablesModel: variablesModel,
      );
      emit(QuerySuccessful(result));
    } catch (error) {
      emit(QueryError('Error in hasura query'));
    }
  }
}
