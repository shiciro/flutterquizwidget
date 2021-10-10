library my_project.global;

import 'package:flutter/material.dart';
import 'transferVariables.dart' as global;

// set default values for the initial run
class Database with ChangeNotifier {
  List<String> listItem = ["Nama Barang 1", "Nama Barang 2", "Nama Barang 3"];
  List<int> listPrice = [325000, 425000, 625000];
  List<int> listQuantity = [1, 1, 1];

  int get count => listItem.length;
  List<String> get cart => listItem;

  void increment() {
    {
      listQuantity[global.Q]++;
      notifyListeners();
    }
  }

  void reduction() {
    if (listQuantity[global.Q] > 0) {
      {
        listQuantity[global.Q]--;
        notifyListeners();
      }
    }
  }
}
