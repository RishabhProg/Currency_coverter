import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class material_page extends StatefulWidget {
  const material_page({super.key});
  @override
  State<material_page> createState() => _material_page();
}

class _material_page extends State<material_page> {
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  double value = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    setState(() {
      try {
        value = double.parse(textEditingController.text) * mult;
      } catch (e) {
        print(e);
        Fluttertoast.showToast(
          msg: "Invalid Amount",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    });
  } //logic code

  double mult = 81;
  String sign = '₹';
  String _dropdownValue = 'INR';

  final List<String> _item = ['INR', 'Dollar', 'Yen', 'Won'];
  void change(String curr) {
    switch (curr) {
      case 'INR':
        mult = 81;
        sign = '₹';
        break;
      case 'Dollar':
        mult = 1;
        sign = '\$';
        break;
      case 'Yen':
        mult = 145.49;
        sign = '¥';
        break;
      case 'Won':
        mult = 1341.20;
        sign = '₩';
        break;
    }
  }
  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(30, 30, 30, 1),
          elevation: 0,
          title: const Text(
            "Currency Converter",
            style: TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          centerTitle: true,
          actions: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(47, 47, 47, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: DropdownButton(
                  items: _item.map((String item) {
                    return DropdownMenuItem(value: item, child: Text(item));
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _dropdownValue = newValue!;
                      change(newValue);
                      value = 0;
                    });
                  },
                  value: _dropdownValue,
                  style:
                      const TextStyle(color: Color.fromRGBO(155, 14, 225, 1)),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${sign}${value == 0 ? value.toStringAsFixed(0) : value.toStringAsFixed(2)}",
                style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(250, 248, 247, 1)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(color: Color.fromRGBO(14, 13, 13, 1)),
                  decoration: const InputDecoration(
                      hintText: "Enter amount in Dollar",
                      hintStyle:
                          TextStyle(color: Color.fromRGBO(14, 13, 13, 1)),
                      prefixIcon: Icon(Icons.monetization_on),
                      prefixIconColor: Color.fromRGBO(155, 14, 225, 1),
                      filled: true,
                      fillColor: Color.fromRGBO(228, 224, 224, 1),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal:
                              10.0), // Adjusting padding to make it slimmer

                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(70.0)),
                          borderSide: BorderSide.none)),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: ElevatedButton(
                    onPressed: convert,
                    style: ElevatedButton.styleFrom(
                        elevation: 15,
                        minimumSize: const Size(double.infinity, 40),
                        backgroundColor: const Color.fromRGBO(155, 14, 225, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      "CONVERT",
                      style: TextStyle(
                          color: Color.fromRGBO(253, 252, 254, 1),
                          fontWeight: FontWeight.w700),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
