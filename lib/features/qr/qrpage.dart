import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter_new/qr_flutter.dart';
import 'package:qrcode_generator/core/common/navbar.dart';

class QrPageScreen extends StatefulWidget {
  const QrPageScreen({super.key});

  @override
  State<QrPageScreen> createState() => _QrPageScreenState();
}

class _QrPageScreenState extends State<QrPageScreen> {
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              'This code allows you to enter and leave your club. It\'s personal and non-transferable. Use it responsibly.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: w * 0.045),
            ),
            Container(
              color: Colors.white,
              child: data == ''
                  ? SizedBox()
                  : QrImageView(
                      data: data,
                      version: QrVersions.auto,
                      size: 200.0,
                    ),
            ),
            SizedBox(
              height: h * 0.1,
            ),
            ElevatedButton(
                onPressed: () {
                  data = "fhbhbf${DateTime.now().millisecond}";
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(w * 0.8, h * 0.06)),
                child: Text(
                  "Generate QR Code",
                  style: TextStyle(
                      fontSize: w * 0.05,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
              height: h * 0.1,
            ),
          ],
        ),
      ),
    );
  }
}
