import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController iqdController = TextEditingController();
  TextEditingController usdController = TextEditingController();

  double _result = 0.0;
  
  final double _usdTo = 1.41;

  void convertCurrency() {
    double DenarAmount = double.tryParse(usdController.text) ?? 0.0;
    setState(() {
      _result = DenarAmount * _usdTo;
      iqdController.text = _result.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('USD To IQD '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/images/aa.png', width: 300),

            SizedBox(height: 20),
            TextField(
              controller: usdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Nrxi USD Daxlka ',
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent),
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.attach_money),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 12),
            TextField(
              controller: iqdController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Nrxi Dinar',
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.money),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white,
                  textStyle: TextStyle(fontSize: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: convertCurrency,
                child: Text('Click ka'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
