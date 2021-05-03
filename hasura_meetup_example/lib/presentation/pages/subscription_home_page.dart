import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hasura_meetup_example/models/change_variables_model.dart';
import 'package:hasura_meetup_example/presentation/cubit/query_cubit.dart';
import 'package:hasura_meetup_example/presentation/cubit/subscription_cubit.dart';
import 'package:hasura_meetup_example/repositories/employee_repository.dart';

class SubscriptionHomePage extends StatefulWidget {
  SubscriptionHomePage({Key? key}) : super(key: key);

  @override
  _SubscriptionHomePageState createState() => _SubscriptionHomePageState();
}

class _SubscriptionHomePageState extends State<SubscriptionHomePage> {
  late final SubscriptionCubit employeesCubit;
  late final TextEditingController textController;

  @override
  void initState() {
    employeesCubit = SubscriptionCubit(EmployeeRepository());
    employeesCubit.getEmployeesListSubscription();
    textController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    employeesCubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscription Example'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<SubscriptionCubit, QueryCubitState>(
        bloc: employeesCubit,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is QueryLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (state is QuerySuccessful) {
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => employeesCubit.orderByAsc(),
                    child: Text('Order By Asc'),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => employeesCubit.orderByDesc(),
                    child: Text('Order By Desc'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: TextFormField(
                      controller: textController,
                      onChanged: (value) => employeesCubit.filterByName(
                          nameFilter: textController.text),
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  ListView.separated(
                    physics: ScrollPhysics(),
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
                  ),
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
