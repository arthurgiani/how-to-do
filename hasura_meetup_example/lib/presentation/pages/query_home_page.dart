import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasura_meetup_example/presentation/cubit/query_cubit.dart';
import 'package:hasura_meetup_example/presentation/cubit/subscription_cubit.dart';

import 'package:hasura_meetup_example/repositories/employee_repository.dart';

class QueryHomePage extends StatefulWidget {
  QueryHomePage({Key? key}) : super(key: key);

  @override
  _QueryHomePageState createState() => _QueryHomePageState();
}

class _QueryHomePageState extends State<QueryHomePage> {
  late final QueryCubit employeesCubit;

  @override
  void initState() {
    employeesCubit = QueryCubit(EmployeeRepository());
    employeesCubit.getEmployeesListQuery();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Query Example'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<QueryCubit, QueryCubitState>(
        bloc: employeesCubit,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is QueryLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is QuerySuccessful) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                    separatorBuilder: (context, index) => Divider(),
                    shrinkWrap: true,
                    itemCount: state.employeesList.length,
                    itemBuilder: (context, index) {
                      final employee = state.employeesList[index];
                      return ListTile(
                        leading: Text(employee.id.toString()),
                        title: Text(
                          employee.name,
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          }

          if (state is QueryError) {
            return Center(
              child: Text(state.message),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
