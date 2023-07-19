import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:res_guard_ui/widgets/reservoirdisplay.dart';
import '../global_variables/constants.dart';
import '../widgets/contact_card.dart';
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
  String urls = '';
  String? desResLevel;
  var data;
  String output = 'Initial value';
  double numbers = 0;
  String targetGpm = 'Awaiting value';
  double gPMTarget = 0;
  String electricPumps = 'Awaiting Electric pumps.';
  double ePumpsGPM = 0;
  String gasPumps = 'Awaiting Gas pumps.';
  double gPumpsGPM = 0;
  String combined = 'Total GPM required';
  double gasElectricCombo = 0;
  String actionMessage = 'Reservoir action pending...';
  // final messageController = TextEditingController();
  String? messageText;
  var height = 40.0;

  fetchData(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    var decoded = jsonDecode(response.body);
    print(decoded);
    return decoded;
  }

  urlCombine(String url1, String url2) {
    String combo = 'http://127.0.0.1:5000/coreCall?query=$url1&query2=$url2';
    print(combo);
    return combo;
  }

  // urlCombine(String url1, String url2) {
  //   String combo = 'http://127.0.0.1:5000/calculator?query=$url1&query2=$url2';
  //   print(combo);
  //   return combo;
  // }

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

  // @override
  // void dispose() {
  //   _controllerReservoir.dispose();
  //   super.dispose();
  // }

  final List<ContactCard> contacts =
      List.generate(20, (index) => const ContactCard());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF1F3B4D),
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.1,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text('Finished Water Effluent :',
                                        style: kAppTextStyle),
                                    Text('205 MGD',
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const <Widget>[
                                    Text(
                                      'Discharge Pressure :',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    Text('68 psi',
                                        style: TextStyle(fontSize: 20))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 100.0,
                          width: 670.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 74.0,
                                width: 310.0,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Raw Water Data'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: const [Text('Raw Water GPM :')],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Container(
                                height: 74.0,
                                width: 310.0,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    const Text('Finished Water Data'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: const [
                                          Text('Finished Water GPM :'),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.1,
                          height: MediaQuery.of(context).size.height / 2,
                          decoration: const BoxDecoration(
                            color: Colors.blueGrey,
                            boxShadow: [
                              BoxShadow(blurRadius: 25.0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Reservoir Data: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 20.0),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      alignment:
                                          AlignmentDirectional.bottomCenter,
                                      height: 300.0,
                                      width: 220.0,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(22.0),
                                          topLeft: Radius.circular(22.0),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: <Widget>[
                                          AnimatedContainer(
                                            height: height,
                                            duration:
                                                const Duration(seconds: 3),
                                            color: Colors.blue,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                width: 400.0,
                                                height: 300.0,
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: const BoxDecoration(
                                                  color: Color(0xFF1F3B4D),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(4.0, 4.0),
                                                      blurRadius: 15.0,
                                                      spreadRadius: 1.0,
                                                    ),
                                                    BoxShadow(
                                                      color: Colors.black,
                                                      offset:
                                                          Offset(-4.0, -4.0),
                                                      blurRadius: 15.0,
                                                      spreadRadius: 1.0,
                                                    ),
                                                  ],
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    const Text(
                                                      'Operator Input',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    Container(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Column(
                                                            children: [
                                                              Container(
                                                                height: 110.0,
                                                                width: 190.0,
                                                                color: Colors.white,
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                            'Target GPM: '),
                                                                        Text(
                                                                            '$targetGpm'),
                                                                        const SizedBox(
                                                                            width:
                                                                                10.0),
                                                                        // const Divider(thickness: 2.0,color: Colors.black, height: 2.0),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height: 3.0),
                                                                    const Divider(
                                                                        thickness:
                                                                            2.0,
                                                                        color: Colors
                                                                            .black,
                                                                        height: 2.0,
                                                                        indent: 0,
                                                                        endIndent: 0),
                                                                    const SizedBox(
                                                                        height: 3.0),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                            'Gas Pumps GPM: '),
                                                                        Text(
                                                                            '$gPumpsGPM'),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height: 3.0),
                                                                    const Divider(
                                                                        thickness:
                                                                            2.0,
                                                                        color: Colors
                                                                            .black,
                                                                        height: 2.0,
                                                                        indent: 0,
                                                                        endIndent: 0),
                                                                    const SizedBox(
                                                                        height: 3.0),
                                                                    Row(
                                                                      children: [
                                                                        const Text(
                                                                            'Electric Pumps: '),
                                                                        Text(
                                                                            '$ePumpsGPM'),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height: 3.0),
                                                                    const Divider(
                                                                        thickness:
                                                                            2.0,
                                                                        color: Colors
                                                                            .black,
                                                                        height: 2.0,
                                                                        indent: 0,
                                                                        endIndent: 0),
                                                                    const SizedBox(
                                                                        height: 3.0),
                                                                    Row(
                                                                      children: const [
                                                                        Text(
                                                                            'Total pump GPM: '),
                                                                        // Text(
                                                                        //     '$gasElectricCombo'),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        height: 15.0)
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 10.0,
                                                              ),
                                                              Container(
                                                                height: 20.0,
                                                                width: 20.0,
                                                                color: Colors.white,

                                                              )
                                                            ],
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
                                                                      fontSize:
                                                                          15.0,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                TextFormField(
                                                                  // controller: _controllerReservoir,
                                                                  onChanged:
                                                                      (value) {
                                                                    url = value;
                                                                    print(url);
                                                                  },
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    filled: true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    border:
                                                                        UnderlineInputBorder(),
                                                                    hintText:
                                                                        'Desired Reservoir Level',
                                                                    hintStyle: TextStyle(
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 15.0,
                                                                  child: Text(
                                                                      'Current Reservoir Level',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              15.0,
                                                                          color: Colors
                                                                              .white)),
                                                                ),
                                                                TextFormField(
                                                                  onChanged:
                                                                      (value2) {
                                                                    urls = value2;
                                                                    print(urls);
                                                                  },
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    filled: true,
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    border:
                                                                        UnderlineInputBorder(),
                                                                    hintText:
                                                                        'Current Reservoir Level',
                                                                    hintStyle: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                CalculateButton(
                                                                  color:
                                                                      Colors.blue,
                                                                  onPressed:
                                                                      () async {
                                                                    data =
                                                                        await fetchData(
                                                                      urlCombine(
                                                                          url,
                                                                          urls),
                                                                    );
                                                                    targetGpm = data[
                                                                        'target gpm'];
                                                                    electricPumps =
                                                                        data[
                                                                            'electric pumps'];
                                                                    // gasPumps = data[
                                                                    //     'gas pumps'];
                                                                    // combined = data[
                                                                    //     'combined gpm'];
                                                                    gPMTarget =
                                                                        double
                                                                            .parse(
                                                                      targetGpm
                                                                          .toString(),
                                                                    );
                                                                    ePumpsGPM =
                                                                        double
                                                                            .parse(
                                                                      electricPumps
                                                                          .toString(),
                                                                    );
                                                                    // gPumpsGPM =
                                                                    //     double
                                                                    //         .parse(
                                                                    //   gasPumps
                                                                    //       .toString(),
                                                                    // );
                                                                    // gasElectricCombo =
                                                                    //     double
                                                                    //         .parse(
                                                                    //   combined
                                                                    //       .toString(),
                                                                    // );
                                                                    // data =
                                                                    //     await fetchData(
                                                                    //   urlCombine(
                                                                    //       url,
                                                                    //       urls),
                                                                    // );
                                                                    // output = data[
                                                                    //     'output'];
                                                                    // numbers =
                                                                    //     double.parse(
                                                                    //         output.toString());
                                                                    // print(numbers
                                                                    //     .runtimeType);
                                                                    setState(() {
                                                                      targetGpm;
                                                                      ePumpsGPM;
                                                                      // gPumpsGPM;
                                                                      // gasElectricCombo;
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
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.all(8.0),
                                              //   child: Container(
                                              //     height: 70,
                                              //     width: 390,
                                              //     color:
                                              //         const Color(0xFF1F3B4D),
                                              //     child: Padding(
                                              //       padding: const EdgeInsets.all(8.0),
                                              //       child: Column(
                                              //         children: <Widget>[
                                              //           Row(
                                              //             children: const <
                                              //                 Widget>[
                                              //               Text(
                                              //                 'Reservoir Actions:',
                                              //                 style: TextStyle(
                                              //                     color: Colors
                                              //                         .white),
                                              //               ),
                                              //             ],
                                              //           ),
                                              //           Row(
                                              //             children: <Widget>[
                                              //               Text(
                                              //                 '$actionMessage',
                                              //                 style: const TextStyle(
                                              //                     color: Colors
                                              //                         .white),
                                              //               ),
                                              //             ],
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 3.0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width / 2.1,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 25.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                    ),
                    const SizedBox(height: 10.0),
                    Material(
                      elevation: 50.0,
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.1,
                        height: MediaQuery.of(context).size.height / 2.0,
                        decoration: const BoxDecoration(
                          color: Colors.blueGrey,
                          boxShadow: [
                            BoxShadow(blurRadius: 25.0),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 350.0,
                                  width: 50.0,
                                  color: const Color(0xFF032654),
                                  child: ListView.builder(
                                    itemCount: 8,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return IconButton(
                                        onPressed: () {
                                          setState(() {
                                            height = 100;
                                          });
                                          print('clicked');
                                        },
                                        icon: const Icon(
                                          Icons.person,
                                          color: Colors.white,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Container(
                                  height: 350.0,
                                  width: 250.0,
                                  color: const Color(0xFF1F3B4D),
                                  child: ListView.builder(
                                    itemCount: 8,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ContactCard();
                                    },
                                  ),
                                ),
                                Container(
                                  height: 350.0,
                                  width: 351.0,
                                  color: const Color(0xFF1E1F21),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const <Widget>[
                                          Text(
                                            'Message Center',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      messageText == null
                                          ? const Text(' ')
                                          : Text(
                                              '$messageText'!,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 30.0,
                                    width: 450.0,
                                    child: TextFormField(
                                      // controller: messageController,
                                      onChanged: (value) {
                                        setState(() {
                                          messageText = value;
                                        });
                                      },
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // SizedBox(width: 5.0,),
        ],
      ),
    );
  }
}

// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// children: <Widget>[
// const Text(
// 'Message Center',
// style: TextStyle(fontSize: 20),
// ),
// const SizedBox(
// height: 10.0,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceEvenly,
// children: [
// Container(
// width: 250.0,
// height: 300.0,
// child: ListWheelScrollView(
// controller: FixedExtentScrollController(),
// itemExtent: 100,
// children: const <Widget>[
// ContactCard(),
// ContactCard(),
// ContactCard(),
// ContactCard(),
// ],
// ),
// ),
// Column(
// children: [
// Container(
// width: 300,
// height: 300,
// alignment:
// AlignmentDirectional.bottomCenter,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(
// Radius.circular(20)),
// shape: BoxShape.rectangle,
// color: Colors.white,
// ),
// child: TextFormField(
// style: const TextStyle(
// color: Colors.black,
// ),
// decoration: const InputDecoration(
// filled: true,
// fillColor: Colors.white,
// border: UnderlineInputBorder(),
// hintText:
// 'Type your message here...',
// hintStyle:
// TextStyle(color: Colors.black),
// ),
// ),
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.end,
// children: [
// CalculateButton(
// color: Colors.blue,
// onPressed: () async {
// print('clicked');
// },
// width: 100.0,
// height: 100.0,
// text: 'Send',
// ),
// ],
// ),
// ],
// ),
// ],
// ),
// // Row(
// //   mainAxisAlignment:
// //   MainAxisAlignment.end,
// //   children: [
// //     CalculateButton(
// //       color: Colors.blue,
// //       onPressed: () async {
// //         print('clicked');
// //       },
// //       width: 100.0,
// //       height: 100.0,
// //       text: 'Send',
// //     ),
// //   ],
// // ),
// ],
// ),
// ),

// IconButton(
// onPressed: () {
// print('clicked');
// },
// icon: const Icon(
// Icons.person,
// color: Colors.white,
// ),
// ),
// Container(
// height: 200.0,
// width: 130.0,
// child: const ReservoirDisplay(
// feet: 20.0,
// maxFeet: 30.0,
// currentTrajectory: 24.0,
// forecastTrajectory: 25,
// ),
// ),
