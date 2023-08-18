import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../screens/search_screen.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          title: const Text("Weather App"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SearchPage()));
              },
              icon: const Icon(Icons.search),
            )
          ],
          centerTitle: false,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'there is no weather 😔 start \n searching now 🔍',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ));
  }
}
