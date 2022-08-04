import 'package:day8/main.dart';
import 'package:flutter/material.dart';
import 'package:day8/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Calculation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculateTotal(),
    // home: BlocProvider(
    // create: (context) => CounterCubit(),
    // // child: CalculateTotal(),
    // ),
    );
  }

}

class CalculateTotal extends StatefulWidget {
  CalculateTotal({Key? key}) : super(key: key);

  @override
  _CalculateTotalState createState() => _CalculateTotalState();

}

class _CalculateTotalState extends State<CalculateTotal> {

  late CounterCubit cubit;

  // var divResult = cubit.multiply();
  // var divResult = cubit.divide();

  @override
  void initState() {
    super.initState();

    cubit = BlocProvider.of<CounterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
      ),

        body: BlocConsumer<CounterCubit, int>(
            bloc: cubit,
            listener: (context, state) {

            },
            //comment for BlocConsumer
            // child: BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$inputNum',
                      style: const TextStyle(fontSize: 100),
                    ),
                    Container(
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('$state',
                            style: const TextStyle(fontSize: 100),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Text('Result: ',
                            style: const TextStyle(fontSize: 100),
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