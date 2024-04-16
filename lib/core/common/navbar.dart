import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qrcode_generator/features/home/home.dart';
import 'package:qrcode_generator/features/qr/qrpage.dart';
import 'package:qrcode_generator/features/user/userpage.dart';

double w = 0.0;
double h = 0.0;
final nameProvier = StateProvider<String>(
  (ref) => 'QR Code',
);

class Navbar extends ConsumerStatefulWidget {
  const Navbar({super.key});

  @override
  ConsumerState<Navbar> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbar> {
  List pages = [HomePage(), QrPageScreen(), Userpage()];
  int index = 1;
  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: Colors.white,
            ),
            Text(
              ref.watch(nameProvier),
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox()
          ],
        ),
        backgroundColor: Colors.black,
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.white,
        // ),
      ),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: true,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: false,
          currentIndex: index,
          onTap: (value) {
            index = value;
            String name = '';
            value == 0
                ? name = 'Home'
                : value == 1
                    ? name = "QR Code"
                    : name = 'User';
            ref.read(nameProvier.notifier).update(
                  (state) => name,
                );
            setState(() {});
          },
          items: const [
            BottomNavigationBarItem(
                label: "",
                icon: Icon(
                  CupertinoIcons.home,
                )),
            const BottomNavigationBarItem(
                label: "", icon: Icon(CupertinoIcons.qrcode)),
            BottomNavigationBarItem(
                label: "", icon: Icon(CupertinoIcons.person)),
          ]),
    );
  }
}
