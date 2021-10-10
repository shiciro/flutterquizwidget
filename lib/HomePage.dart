import 'package:flutter/material.dart';
import 'package:widget/main.dart';
import 'package:provider/provider.dart';
import 'providers/transferVariables.dart' as global;
import 'providers/global.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        for (int i = 0; i < context.read<Database>().listPrice.length; i++)
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
                              context.read<Database>().listItem[i],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                            Text('Harga ' +
                                context
                                    .read<Database>()
                                    .listPrice[i]
                                    .toString()),
                            Text(
                              'Jumlah di keranjang ' +
                                  context
                                      .watch<Database>()
                                      .listQuantity[i]
                                      .toString(),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                global.Q = i;
                                Navigator.of(context).pushNamed("buyPage");
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
                  ((context.read<Database>().listPrice[0] *
                              context.read<Database>().listQuantity[0]) +
                          (context.read<Database>().listPrice[1] *
                              context.read<Database>().listQuantity[1]) +
                          (context.read<Database>().listPrice[2] *
                              context.read<Database>().listQuantity[2]))
                      .toString())
            ],
          ),
        ),
      ]),
    ));
  }
}
