import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _url = 'https://api.corgi.cam/v1/img/?redirect=1';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 31, 31, 31),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Corgapp",
            style:
                TextStyle(decoration: TextDecoration.none, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.network(
              _url,
              width: double.infinity,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? (loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!)
                        : null,
                  ),
                );
              },
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.only(top: 16, bottom: 16))),
                    onPressed: () {
                      setState(() {
                        _url = 'https://api.corgi.cam/v1/img/?redirect=1?${Random().nextInt(1000)}';
                      });
                    },
                    child: const Text(
                      "New Corgi :)",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    )),
              ))
        ],
      ),
    );
  }
}
