import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';


class BarcodeRefreshPage extends StatefulWidget {
  final String jsonData;

  BarcodeRefreshPage({required this.jsonData});

  @override
  _BarcodeRefreshPageState createState() => _BarcodeRefreshPageState();
}

class _BarcodeRefreshPageState extends State<BarcodeRefreshPage> {
  late String barcodeType;
  late String barcodeValue;
  late String cardNumber;

  @override
  void initState() {
    super.initState();
    _loadCardData(widget.jsonData);
  }

  void _loadCardData(String jsonData) {
    Map<String, dynamic> cardData = jsonDecode(jsonData);
    setState(() {
      barcodeType = cardData['type'];
      barcodeValue = cardData['value'];
      cardNumber = cardData['number'];
    });
  }

  @override
  Widget build(BuildContext context) {
    Barcode? bc;
    if (barcodeType.toUpperCase() == 'EAN13') {
      bc = Barcode.ean13();
    } else if (barcodeType.toUpperCase() == 'CODE128') {
      bc = Barcode.code128();
    } else {
      bc = null;
    }

    final String barcodeSvg = bc != null
        ? bc.toSvg(
            barcodeValue,
            width: 200,
            height: 80,
            drawText: true,
          )
        : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Клубная карта'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ClubCard(
            barcodeSvg: barcodeSvg,
            cardNumber: cardNumber,
          ),
        ),
      ),
    );
  }
}

class ClubCard extends StatelessWidget {
  final String barcodeSvg;
  final String cardNumber;

  ClubCard({required this.barcodeSvg, required this.cardNumber});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 186, 135, 252),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Icon(
                  Icons.refresh,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Клубная карта',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 214, 181, 255),
                      borderRadius: BorderRadius.circular(10.0),
                      
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: Text(
                      cardNumber,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}