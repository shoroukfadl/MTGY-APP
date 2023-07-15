import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DiscountScannerScreen extends StatefulWidget {
  @override
  _DiscountScannerScreenState createState() => _DiscountScannerScreenState();
}

class _DiscountScannerScreenState extends State<DiscountScannerScreen> {
  QRViewController? _qrViewController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  String _discountCode = '';
  double _totalPrice = 100.0; // Example total price
  double _discountPercentage = 0.0;
  double _priceAfterDiscount = 0.0;

  @override
  void dispose() {
    _qrViewController?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        _discountCode = scanData.code!;
        _calculatePriceAfterDiscount();
      });
    });
  }

  void _calculatePriceAfterDiscount() {
    if (_discountCode == 'DISCOUNT10') {
      _discountPercentage = 10.0;
    } else {
      _discountPercentage = 0.0;
    }

    // Calculate the price after discount
    double discountAmount = (_totalPrice * _discountPercentage) / 100;
    _priceAfterDiscount = _totalPrice - discountAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discount Scanner'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: _qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Discount Code: $_discountCode',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Price after Discount: \$$_priceAfterDiscount',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
