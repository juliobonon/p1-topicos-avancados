import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

enum operation { adicao, subtracao, multiplicacao, divisao }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  operation? _operation;
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  var result;

  void calcandUpdate(value) {
    setState(() {
      _operation = value;

      if (value == operation.adicao) {
        result = int.parse(num1.text) + int.parse(num2.text);
      } else if (value == operation.subtracao) {
        result = int.parse(num1.text) - int.parse(num2.text);
      } else if (value == operation.multiplicacao) {
        result = int.parse(num1.text) * int.parse(num2.text);
      } else if (value == operation.divisao) {
        result = int.parse(num1.text) / int.parse(num2.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(" Julio Cesar Bonon \n RA: 2760481911023"),
            Row(
              children: [
                Text('Número 1: '),
                Expanded(
                  child: TextField(
                    controller: num1,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text('Número 2: '),
                Expanded(
                    child: TextField(
                  controller: num2,
                ))
              ],
            ),
            SizedBox(height: 20),
            Text("Escolha a operação:"),
            ListTile(
              title: const Text('Adição'),
              leading: Radio<operation>(
                value: operation.adicao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Subtração'),
              leading: Radio<operation>(
                value: operation.subtracao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Multiplicação'),
              leading: Radio<operation>(
                value: operation.multiplicacao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            ListTile(
              title: const Text('Divisão'),
              leading: Radio<operation>(
                value: operation.divisao,
                groupValue: _operation,
                onChanged: (operation? value) {
                  calcandUpdate(value);
                },
              ),
            ),
            Row(
              children: [
                Text("Resultado: "),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Center(
                        child: result != null
                            ? Text(result.toString())
                            : Text(
                                "Realize uma operação pra ver um resultado")),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
