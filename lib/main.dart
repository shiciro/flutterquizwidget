import 'dart:ffi';

import 'package:flutter/material.dart';
enum OrderOptions {orderaz, orderza}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  

  List <String> listItem =[
    "Nama Barang 1","Nama Barang 2","Nama Barang 3"
  ];
  List <int> listPrice =[
    175000,350000,625000
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          title: Text("Keranjang Belanja"),
        ),

        body:ListView(
          children: [
            for(int i=0;i<listItem.length;i++)
            Container(
            height : 140,
            width : double.infinity,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            
            decoration: BoxDecoration(
              color : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0,3)
                )
              ]
            ),
            child: Row(
              children: [
                CircleAvatar(
                backgroundImage: AssetImage('images/image.jpg'),
                radius: 50,),
                Flexible(
                  fit: FlexFit.tight,
                child: Container(
                  margin: EdgeInsets.only(top: 20,left: 20,bottom:20),
                  width: 150,
                  height:120,
                  color: Colors.white,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(listItem[i],
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 30.0,
                          fontWeight: FontWeight.bold
                          ),
                          ),
                      Text(listPrice[i].toString()),
                      Text("test")
                    ],
                  )
                )
              )
              ],
            ),
          ),]
        ),
      )
    );
  }



}