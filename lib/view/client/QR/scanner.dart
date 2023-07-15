
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../services/widgets/constant.dart';

class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrstr = "SCAN QR CODE";
  var height,width;
  String _discountCode = '';
  double _totalPrice = 100.0; // Example total price
  double _discountPercentage = 0.0;
  double _priceAfterDiscount = 0.0;

  @override
  Widget build(BuildContext context) {

    height = MediaQuery
        .of(context)
        .size
        .height;
    width = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(

        body: Padding(
          padding: const EdgeInsets.only(top: 230.0, left: 20,right: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
              if (qrstr == "SCAN QR CODE")   ElevatedButton(onPressed: scanQr, child:
                Text(('SCAN QR ')),
                  style: ElevatedButton.styleFrom(backgroundColor: BlueColor,
                    fixedSize: Size(300, 40)
                ),
                )else const Text("YOU HAVE A DICOUNT FOR  ",
                style: TextStyle(color: BlueColor,fontSize: 17),),
                const Text("THE NEXT TIME YOU ORDER OFFER  ",
                style: TextStyle(color: BlueColor,fontSize: 17),),
                Text("DISCOUNT : $qrstr ",
                  style: const TextStyle(color: YellowColor,fontSize: 23),),
                          SizedBox(height: width,)
              ],
            ),
          ),
        )
    );
  }


  Future <void>scanQr()async{
    try{
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancel', true, ScanMode.QR).then((value){
        setState(() {
          qrstr='DISCOUNT10';
          _calculatePriceAfterDiscount();
        });
      });
    }catch(e){
      setState(() {
        qrstr='unable to read this';
      });
    }
  }

  void _calculatePriceAfterDiscount() {
    if (qrstr == 'DISCOUNT10') {
      _discountPercentage = 10.0;
    } else {
      _discountPercentage = 0.0;
    }

    // Calculate the price after discount
    double discountAmount = (_totalPrice * _discountPercentage) / 100;
    _priceAfterDiscount = _totalPrice - discountAmount;
  }
}