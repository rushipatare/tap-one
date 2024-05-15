import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightctr = TextEditingController();
  var hightinfitctr = TextEditingController();
  var hightininchctr = TextEditingController();

  var result = "";

  get fit => null;

  get inch => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'BMI',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              TextField(
                controller: weightctr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Enter your weight in kgs',
                    style: TextStyle(color: Colors.red),
                  ),
                  prefixIcon: Icon(Icons.line_weight),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 11,
              ),
              TextField(
                controller: hightinfitctr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    'Enter your height in feet',
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 11,
              ),
              TextField(
                controller: hightininchctr,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(


                  ),
                  label: Text(
                    'Enter your height in inches',
                    style: TextStyle(color: Colors.black87),
                  ),
                  prefixIcon: Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
                cursorColor: Colors.red,
              ),
              const SizedBox(
                height: 11,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (weightctr.text != "" && hightininchctr.text != "" && hightinfitctr.text != "") {
                 var totalHInces=(double.parse(hightinfitctr.text)*12)+double.parse(hightininchctr.text);
                 var meterH = totalHInces*0.0254;
                 var bmi= double.parse(weightctr.text)/(meterH*meterH);
                    setState(() {
                      result = bmi.toStringAsFixed(2);
                    });}

                    else {
                      setState(() {
                        result = "please fill the all  the required blanks!!";
                      });
                    }
                    //BMI Calculation
                  },
                  child: const Text('Calculate')),
              const SizedBox(
                height: 15,
              ),
               Text(
                result,
                style: const TextStyle(
                    fontSize: 15, backgroundColor: Colors.lightGreen),
              )
            ],
          ),
        ));
  }
}
