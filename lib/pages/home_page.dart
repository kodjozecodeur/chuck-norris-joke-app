import 'package:dad_jokes_app/provider/jokes_provider_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Chuck Norris Jokes",
        ),
        backgroundColor: Color(0xFF3F51B4),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      body: Consumer<JokesProviderService>(
        builder: (context, jokeController, _) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  // decoration: BoxDecoration(
                  //   color: Color(0xFF333333),
                  // ),
                  child: Column(
                    children: [
                      if (jokeController.joke != null) ...[
                        Image.network(jokeController.joke!.iconUrl),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          jokeController.joke!.value,
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  jokeController.getData();
                },
                child: Text(jokeController.joke == null
                    ? "Wanna hear a joke?"
                    : "Next"),
              ),
            ],
          );
        },
      ),
    );
  }
}
