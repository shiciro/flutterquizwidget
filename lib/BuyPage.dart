import 'package:flutter/material.dart';
import 'package:widget/main.dart';
import 'package:provider/provider.dart';
import 'providers/transferVariables.dart' as global;
import 'providers/global.dart';

class BuyPage extends StatefulWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  //int _jumlah = global.listQuantity[global.Q];

  //void _confirm() {
  //  setState(() {
  //    global.listQuantity[global.Q] = global.transfer;
  //  });
  //}
  int urutan = global.Q;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Item"),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('images/image1.jpg'), fit: BoxFit.fill),
              shape: BoxShape.rectangle),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 100,
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
              IconButton(
                onPressed: () {
                  context.read<Database>().reduction();
                },
                icon: Icon(Icons.exposure_minus_1),
              ),
              Text("Jumlah barang " +
                  context.watch<Database>().listQuantity[global.Q].toString()),
              IconButton(
                onPressed: () {
                  context.read<Database>().increment();
                },
                icon: Icon(Icons.plus_one),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: 100,
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
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  //_confirm();
                },
                icon: Icon(Icons.check_circle),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.cancel),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
