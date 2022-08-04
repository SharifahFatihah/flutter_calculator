import 'package:flutter/material.dart';
import 'package:day8/counter_cubit.dart';
import 'package:day8/calculate_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CounterCubit(),
        child: const MyHomePage(title: 'Bloc Example'),
        // routes: {
        //   '/calculate': (context) => Calculation(),
        // },
      ),
      // home: const MyHomePage(title: 'Bloc Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

TextEditingController inputNum = new TextEditingController();

class _MyHomePageState extends State<MyHomePage> {

  void navigateToCalculatePage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return Calculation();
      }),
    );
  }

  int counter = 0;

  late CounterCubit cubit;

  @override
  void initState() {
    super.initState();

    cubit = BlocProvider.of<CounterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body: BlocListener<CounterCubit, int>(
        body: BlocConsumer<CounterCubit, int>(
            bloc: cubit,
            listener: (context, state) {
              const snackbar = SnackBar(
                  content: Text('State is reached'));

              if (state == 5) {
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
            },
            //comment for BlocConsumer
            // child: BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: inputNum,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Number',
                        ),
                      ),
                    ),
                    Text(
                      '$state',
                      style: const TextStyle(fontSize: 100),
                    ),
                    Container(
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              cubit.increment();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green, // Text Color
                            ),
                            icon: Icon(
                              Icons.add,
                            ),
                            label: Text('Increment'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              cubit.decrement();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red, // Text Color
                            ),
                            icon: Icon(
                              Icons.remove,
                            ),
                            label: Text('Decrement'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              cubit.reset();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            icon: Icon(
                              Icons.refresh,
                            ),
                            label: Text('Reset'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            onPressed: () {
                              navigateToCalculatePage();
                              // cubit.increment();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green, // Text Color
                            ),
                            icon: Icon(
                              Icons.close,
                            ),
                            label: Text('Multiplication'),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              navigateToCalculatePage();
                              // cubit.decrement();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.red, // Text Color
                            ),
                            icon: Icon(
                              Icons.done,
                            ),
                            label: Text('Division'),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              );
            }
          //comment for BlocConsumer
          //   ),
            )
        );
  }
}
