import 'package:hasura_connect/hasura_connect.dart';
import 'package:hasura_meetup_example/models/change_variables_model.dart';
import 'package:hasura_meetup_example/models/employee_model.dart';
import 'package:hasura_meetup_example/repositories/headers.dart';

class EmployeeRepository {
  final HasuraConnect hasura = HasuraConnect(
    'YOUR_GRAPHQL_ENDPOINT',
    headers: headers,
  );

  Future<List<EmployeeModel>> getEmployeesListQuery({
    required VariablesModel variablesModel,
  }) async {
    final query = r'''
      query MyQuery($order_by: order_by!, $name: String!) {
        employees(order_by: {id: $order_by}, where: {name: {_ilike: $name}}) {
          id
          name
        }
      }
    ''';

    final Map<String, dynamic> result = await hasura.query(
      query,
      variables: {
  "order_by": "asc",
  "name": "%ar%"
},
    );

    final employeesList = (result['data']['employees'] as List)
        .map((employee) => EmployeeModel.fromMap(employee))
        .toList();

    return employeesList;
  }

  Future<Snapshot<List<EmployeeModel>>> getEmployeesListSubscription({
    required VariablesModel variablesModel,
  }) async {
    final subscription = r'''
      subscription MySubscription($order_by: order_by!, $name: String!) {
        employees(order_by: {id: $order_by}, where: {name: {_ilike: $name}}) {
          id
          name
        }
      }
    ''';
    
    // ignore: close_sinks
    final Snapshot<dynamic> result = await hasura.subscription(
      subscription,
      variables: variablesModel.toMap(),
    );

    return result.map((event) {
      if (event == null) {
        return <EmployeeModel>[];
      }
      return (event['data']['employees'] as List)
          .map((employee) => EmployeeModel.fromMap(employee))
          .toList();
    });
  }
}
