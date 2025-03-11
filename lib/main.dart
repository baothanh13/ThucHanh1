import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  @override
  _AgeCheckerScreenState createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  String result = "";

  void checkAge() {
    String name = nameController.text;
    int? age = int.tryParse(ageController.text);

    if (age == null || name.isEmpty) {
      setState(() {
        result = "Vui lòng nhập đầy đủ thông tin!";
      });
      return;
    }

    if (age > 65) {
      result = "$name là Người già";
    } else if (age >= 6) {
      result = "$name là Người lớn";
    } else if (age >= 2) {
      result = "$name là Trẻ em";
    } else {
      result = "$name là Em bé";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("THỰC HÀNH 01")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Họ và tên"),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: "Tuổi"),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: checkAge, child: Text("Kiểm tra")),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
