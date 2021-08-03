import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle titleStyle = TextStyle(
    color: Color(0xFF5B777B),
    fontSize: 20.0,
    fontWeight: FontWeight.w800,
    //fontFamily: 'IndieFlower',
  );

  double bill = 0;
  double tip = 0;
  int person = 1;

  double tipPerPerson = 0;
  double totalPerPerson = 0;

  TextEditingController billController = TextEditingController();
  TextEditingController tipController = TextEditingController();
  TextEditingController personController = TextEditingController();

  void calculate() {
    tipPerPerson = (bill * tip) / person;
    totalPerPerson = (bill * (1 + tip)) / person;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC5E4E7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                child: Center(
                  child: Image.asset("assets/images/logo.png"),
                ),
              ),
              Container(
                width: double.infinity,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bill", style: titleStyle),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: billController,
                        onEditingComplete: () {
                          setState(() {
                            if (billController.text.isNotEmpty) {
                              bill = double.parse(billController.text);
                            } else {
                              bill = 0;
                            }
                            FocusScope.of(context).unfocus();
                            calculate();
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF3F8FB),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.attach_money_rounded),
                          hintText: 'eg: 100',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00474B),
                        ),
                      ),
                      SizedBox(height: 38.0),
                      Text(
                        "Select Tip %",
                        style: titleStyle,
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: Text("5%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 55,
                              color: Color(0xFF00474B),
                              onPressed: () {
                                setState(() {
                                  tip = 0.05;
                                  calculate();
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: FlatButton(
                              child: Text("10%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 55,
                              color: Color(0xFF00474B),
                              onPressed: () {
                                setState(() {
                                  tip = 0.10;
                                  calculate();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: Text("15%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 55,
                              color: Color(0xFF00474B),
                              onPressed: () {
                                setState(() {
                                  tip = 0.15;
                                  calculate();
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: FlatButton(
                              child: Text("25%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 55,
                              color: Color(0xFF00474B),
                              onPressed: () {
                                setState(() {
                                  tip = 0.25;
                                  calculate();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        children: [
                          Expanded(
                            child: FlatButton(
                              child: Text("50%",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  )),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 55,
                              color: Color(0xFF00474B),
                              onPressed: () {
                                setState(() {
                                  tip = 0.50;
                                  calculate();
                                });
                              },
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: TextField(
                              controller: tipController,
                              onEditingComplete: () {
                                setState(() {
                                  if (tipController.text.isNotEmpty) {
                                    tip =
                                        double.parse(tipController.text) / 100;
                                  } else {
                                    tip = 0;
                                  }
                                  FocusScope.of(context).unfocus();
                                  calculate();
                                });
                              },
                              keyboardType: TextInputType.numberWithOptions(),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFF3F8FB),
                                border: InputBorder.none,
                                hintText: 'Custom',
                                hintStyle: TextStyle(
                                  color: Color(0xFF00474B),
                                ),
                              ),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF00474B),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 38.0),
                      Text("Number of People", style: titleStyle),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: personController,
                        onEditingComplete: () {
                          setState(() {
                            if (personController.text.isNotEmpty) {
                              person = int.parse(personController.text);
                            } else {
                              person = 1;
                            }
                            FocusScope.of(context).unfocus();
                            calculate();
                          });
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFF3F8FB),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person),
                          hintText: 'eg: 5',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF00474B),
                        ),
                      ),
                      SizedBox(height: 35.0),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          decoration: BoxDecoration(
                            color: Color(0xFF00474B),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                spreadRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Tip Amount",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(height: 5.0),
                                        Text("/ Person",
                                            style: TextStyle(
                                              color: Color(0xFF70999D),
                                            )),
                                      ],
                                    ),
                                    Text("\$${tipPerPerson.toStringAsFixed(1)}",
                                        style: TextStyle(
                                          color: Color(0xFF24C5AD),
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Total",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        SizedBox(height: 5.0),
                                        Text("/ Person",
                                            style: TextStyle(
                                              color: Color(0xFF70999D),
                                            )),
                                      ],
                                    ),
                                    Text(
                                        "\$${totalPerPerson.toStringAsFixed(2)}",
                                        style: TextStyle(
                                          color: Color(0xFF24C5AD),
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
                                SizedBox(height: 25),
                                Expanded(
                                  child: FlatButton(
                                    child: Text("RESET",
                                        style: TextStyle(
                                          color: Color(0xFF004648),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    height: 60,
                                    minWidth: double.infinity,
                                    color: Color(0xFF26C2AD),
                                    onPressed: () {
                                      setState(() {
                                        double bill = 0;
                                        double tip = 0;
                                        int person = 1;

                                        tipController.clear();
                                        billController.clear();
                                        personController.clear();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
