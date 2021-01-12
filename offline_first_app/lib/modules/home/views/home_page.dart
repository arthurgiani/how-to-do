import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'home_controller.dart';
import 'home_repository.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeController homeController;

  @override
  void initState() {
    homeController = HomeController(HomeRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline First App Example'),
      ),
      body: Observer(builder: (_) {
        switch (homeController.pokemonFuture.status) {
          case FutureStatus.pending:
            return Center(child: CircularProgressIndicator());
            break;
          case FutureStatus.fulfilled:
            return SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  ListView.builder(
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeController.pokemonList.length,
                    itemBuilder: (context, index) {
                      final pokemon = homeController.pokemonList[index];
                      return ListTile(
                        title: Text(pokemon.name),
                      );
                    },
                  )
                ],
              ),
            );
          default:
            return Text("Erro");
        }
      }),
      //
    );
  }
}
