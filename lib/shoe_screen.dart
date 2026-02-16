import 'package:flutter/material.dart';

class ShoeScreen extends StatelessWidget {
  const ShoeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey.shade400,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              color: Colors.blue,
              child: const DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/bootForClass.png"),
                      radius: 30,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      " Ugwuoke Chinaza",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Old English Text',
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      " 12 years",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "20 Okpara Square, Panya Land",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // body of drawer
            const ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text(
                "evelyn@gmail.com",
              ),
            ),
            const Divider(
              height: 2,
              thickness: 3,
            ),
            const ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text(
                "evelyn@gmail.com",
              ),
            ),
            const Divider(
              height: 2,
              thickness: 3,
            ),
            const ListTile(
              leading: Icon(
                Icons.email,
              ),
              title: Text(
                "evelyn@gmail.com",
              ),
            ),
            const Divider(
              height: 2,
              thickness: 3,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Shoe Screen"),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(
              left: 25,
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                    margin: const EdgeInsets.only(
                      right: 350,
                    ),
                    child: const Icon(Icons.arrow_back)),
                Container(
                    margin: const EdgeInsets.only(left: 25),
                    height: 200,
                    width: 400,
                    // color: Colors.amber,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Image.asset('assets/images/bootForClass.png'),
                    )),
                const Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Air Nike XXXXVI Low",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "Men's Basketball shoes",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "175",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(height: 7),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: const Text(
                          "Lace up in the energy that sparked up the Basketball Revolution. One of the lightest Air Nike game shoes up to date, The AN XXXXVI features.            ",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Container(
                  margin: const EdgeInsets.only(
                    right: 100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 219, 219, 219),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ))),
                        child: const Text(
                          "Free Shipping",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 219, 219, 219),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Free Shipping",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/smallShoe1.jpg",
                          height: 175,
                          width: 175,
                          fit: BoxFit.fill,
                        ),
                        Image.asset(
                          "assets/images/smallShow2.png",
                          height: 175,
                          width: 175,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ))
              ],
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        label: const Text(
          '   Reserve Spot Now   ',
        ),
      ),
    );
  }
}
