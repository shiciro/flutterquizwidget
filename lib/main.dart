import 'package:flutter/material.dart';
import 'package:widget/BuyPage.dart';
import 'package:provider/provider.dart';
import 'global.dart' as global;

//void main() {
//  runApp(MyApp());
//}

void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
    routes: <String, WidgetBuilder>{
      "/buyPage": (BuildContext context) => new BuyPage(),
      "/home": (BuildContext context) => new MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //void _update() {
  //  setState(() {
  //    global.listQuantity[global.Q] = global.transfer;
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Keranjang Belanja"),
      ),
      body: ListView(children: [
        for (int i = 0; i < global.listItem.length; i++)
          Container(
            height: 130,
            width: double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
            child: Row(
              children: [
                Container(
                  height: 120,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("images/image1.jpg"),
                        fit: BoxFit.fill,
                      ),
                      shape: BoxShape.rectangle),
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Container(
                        margin: EdgeInsets.only(top: 5, left: 20, bottom: 5),
                        width: 150,
                        height: 120,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              global.listItem[i],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text('Harga ' + global.listPrice[i].toString()),
                            Text(
                              'Jumlah di keranjang ' +
                                  global.listQuantity[i].toString(),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                global.Q = i;
                                Navigator.of(context).pushNamed("/buyPage");
                              },
                              child: Text('Lihat Detail'),
                            ),
                          ],
                        )))
              ],
            ),
          ),
        Container(
          height: 50,
          width: double.infinity,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
          child: Row(
            children: [
              Text("Total " +
                  ((global.listPrice[0] * global.listQuantity[0]) +
                          (global.listPrice[1] * global.listQuantity[1]) +
                          (global.listPrice[2] * global.listQuantity[2]))
                      .toString())
            ],
          ),
        ),
      ]),
    ));
  }
}
