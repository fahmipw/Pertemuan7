import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title: 'Pertemuan7 - Fahmi,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Fahmi Perdana Wicaksono"),
        ),
        body: SafeArea(
          child: Center(
            child: GridWidget(),
          ),
        ),
      ),
    );
  }
}

class GridWidget extends StatefulWidget {
  GridViewState createState() => GridViewState();
}

class GridViewState extends State<GridWidget> {
  int nilaiPerBaris = 3;
  int lebarAspek = 2;
  int tinggiAspek = 2;

  List<String> daftarItem = ['One', 'Two', 'Three', 'Four', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten', 'Eleven', 'Twelve'];



  void getItemGridViewTerpilih(BuildContext context, String itemGrid) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(itemGrid),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Color getColorForItem(int index) {
    Color color;
    switch (index) {
      case 0:
      case 1:
      case 2:
        color = Color.fromARGB(255, 66, 180, 255);
        break;
      case 3:
      case 4:
      case 5:
        color = Colors.yellow;
        break;
      case 6:
      case 7:
      case 8:
        color = Color.fromARGB(255, 66, 180, 255);
        break;
      case 9:
      case 10:
      case 11:
        color = Colors.yellow;
        break;
      default:
        color = Colors.white;
        break;
    }
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: nilaiPerBaris,
            childAspectRatio: (lebarAspek / tinggiAspek),
            children: List.generate(daftarItem.length, (index) {
              return GestureDetector(
                onTap: () {
                  getItemGridViewTerpilih(context, daftarItem[index]);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  color: getColorForItem(index),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        daftarItem[index],
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}