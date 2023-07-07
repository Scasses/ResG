import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:res_guard_ui/widgets/reservoirdisplay.dart';
import '../global_variables/constants.dart';
import '../widgets/calc_button.dart';
// import 'package:res_guard_ui/api.dart';
import 'package:res_guard_ui/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controllerReservoir = TextEditingController();
  String url = '';
  String? desResLevel;
  var data;
  String output = 'Initial value';
  int numbers = 0;

  fetchData(String url) async{
      http.Response response = await http.get(Uri.parse(url));
      var decoded = jsonDecode(response.body);
      print(decoded);
      return decoded;
  }

  // Future<dynamic> dataAcquire(String url, String input) async {
  //   String opInput = await APICalls().fetchData(url, input);
  //   print(desResLevel);
  //   return opInput;
  // }

  // Future<String> dataAcquire(String url, String input) async {
  //   try {
  //     String opInput = await APICalls().fetchData(url, input);
  //     print(desResLevel);
  //     return opInput ?? '';
  //   } catch (error) {
  //     print('An error occurred: $error');
  //     return '';
  //   }
  // }


  @override
  void dispose() {
    _controllerReservoir.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Reservoir Guard',
              style: TextStyle(letterSpacing: 10),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.1,
                decoration: const BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 20.0)],
                  color: Colors.white,
                ),
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            'Raw Water Influent : ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('200 MGD', style: kAppTextStyle)
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text('Finished Water Effluent :',
                              style: kAppTextStyle),
                          Text('205 MGD', style: TextStyle(fontSize: 20))
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            'Discharge Pressure :',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text('68 psi', style: TextStyle(fontSize: 20))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 3.0),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 2.1,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 25.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          'Weather Station',
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.underline),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 25.0),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    const Text('Current Reservoir'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 200.0,
                          width: 100.0,
                          child: const ReservoirDisplay(
                            feet: 20.0,
                            maxFeet: 30.0,
                            currentTrajectory: 24.0,
                            forecastTrajectory: 25,
                          ),
                        ),
                        Container(
                          width: 450.0,
                          height: 300.0,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  const Text('Operator Input'),
                                  // const SizedBox(
                                  //   height: 10.0,
                                  // ),
                                  Container(
                                    width: 400.0,
                                    height: 250.0,
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: const BoxDecoration(
                                        color: Colors.blueGrey),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Container(
                                              height: 115.0,
                                              width: 190.0,
                                              color: Colors.blue,
                                              child: Text('$numbers'),
                                            ),
                                            const SizedBox(
                                              width: 10.0,
                                            ),
                                            SizedBox(
                                              height: 155.0,
                                              width: 190.0,
                                              child: Column(
                                                children: <Widget>[
                                                  const Text(
                                                    'Desired Reservoir Level',
                                                    style: TextStyle(
                                                        fontSize: 15.0,
                                                        color: Colors.white),
                                                  ),
                                                  TextFormField(
                                                    // controller: _controllerReservoir,
                                                    onChanged: (value) {
                                                      url = 'http://127.0.0.1:5000/coreCall?query=' + value.toString();
                                                      print(url);
                                                    },
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border:
                                                          UnderlineInputBorder(),
                                                      hintText:
                                                          'Desired Reservoir Level',
                                                      hintStyle: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 15.0,
                                                    child: Text(
                                                        'Current Reservoir Level',
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                  TextFormField(
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                    ),
                                                    decoration:
                                                        const InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      border:
                                                          UnderlineInputBorder(),
                                                      hintText:
                                                          'Current Reservoir Level',
                                                      hintStyle: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  CalculateButton(
                                                    color: Colors.blue,
                                                    onPressed: () async {
                                                      data = await fetchData(url);
                                                      output = data['output'];
                                                       numbers = int.parse(output);
                                                       print(numbers.runtimeType);
                                                      setState(() {
                                                        numbers;
                                                      });
                                                    },
                                                    width: 75.0,
                                                    height: 30.0,
                                                    text: 'Send',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 1.2,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.1,
                height: MediaQuery.of(context).size.height / 2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(blurRadius: 25.0),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const Text('Message Center'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 500.0,
                          height: 300.0,
                          decoration:
                              const BoxDecoration(color: Colors.blueGrey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 450.0,
                                    child: TextFormField(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: const InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: UnderlineInputBorder(),
                                        hintText: 'Type your message here...',
                                        hintStyle:
                                            TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CalculateButton(
                                color: Colors.blue,
                                onPressed: () async {
                                  print('clicked');
                                },
                                width: 75.0,
                                height: 30.0,
                                text: 'Send',
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
