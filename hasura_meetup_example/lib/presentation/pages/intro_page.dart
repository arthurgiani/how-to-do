import 'package:flutter/material.dart';
import 'package:hasura_meetup_example/presentation/pages/query_home_page.dart';
import 'package:hasura_meetup_example/presentation/pages/subscription_home_page.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutterando Hasura Meetup'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QueryHomePage(),
                  ),
                ),
                child: Text('Query Example'),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 250,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SubscriptionHomePage(),
                  ),
                ),
                child: Text('Subscription Example'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
