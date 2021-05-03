import 'package:bloc/bloc.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_meetup_example/models/change_variables_model.dart';
import 'package:meta/meta.dart';

import 'package:hasura_meetup_example/models/employee_model.dart';
import 'package:hasura_meetup_example/repositories/employee_repository.dart';

part 'query_state.dart';

class SubscriptionCubit extends Cubit<QueryCubitState> {
  final EmployeeRepository repository;
  late final Snapshot<List<EmployeeModel>> result;
  late VariablesModel variablesModel;
  SubscriptionCubit(
    this.repository,
  ) : super(
          QueryCubitInitial(),
        ) {
    variablesModel = VariablesModel(
      orderBy: 'asc',
      name: '',
    );
  }

  Future<void> getEmployeesListSubscription() async {
    try {
      emit(QueryLoading());
      result = await repository.getEmployeesListSubscription(
        variablesModel: variablesModel,
      );
      result.listen((event) {
        emit(QuerySuccessful(event));
      });
    } catch (error) {
      print(error.toString());
      emit(QueryError('Error in hasura subscription'));
    }
  }

  Future<void> orderByDesc() async {
    variablesModel = variablesModel.copyWith(orderBy: 'desc');
    await result.changeVariables(
      variablesModel.toMap(),
    );
  }

  Future<void> orderByAsc() async {
    variablesModel = variablesModel.copyWith(orderBy: 'asc');
    await result.changeVariables(
      variablesModel.toMap(),
    );
  }

  Future<void> filterByName({required String nameFilter}) async {
    variablesModel = variablesModel.copyWith(name: nameFilter);
    await result.changeVariables(
      variablesModel.toMap(),
    );
  }

  void dispose() {
    result.close();
  }
}
