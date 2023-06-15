import 'package:flutter/material.dart';
import '../global_variables/constants.dart';
import '../widgets/calc_button.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                          Text('Discharge Pressure :',
                              style: TextStyle(fontSize: 20)),
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
                    Container(

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
                            mainAxisAlignment:
                            MainAxisAlignment.end,
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
                                        hintText:
                                        'Type your message here...',
                                        hintStyle:
                                        TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              CalculateButton(
                                color: Colors.blue,
                                onPressed: () {
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
