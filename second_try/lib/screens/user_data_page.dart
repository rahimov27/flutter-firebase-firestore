import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:second_try/services/firebase_services.dart';
import 'package:second_try/screens/home_page.dart';
import 'package:second_try/models/UserDataModel.dart';

class UserDataPage extends StatelessWidget {
  const UserDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controllerName = TextEditingController();
    final TextEditingController controllerSurname = TextEditingController();
    final TextEditingController controllerGender = TextEditingController();
    final TextEditingController controllerAge = TextEditingController();
    final service = FirebaseServices();
    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text("UserDataPage"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controllerName,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerSurname,
              decoration: InputDecoration(
                hintText: "Surname",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerGender,
              decoration: InputDecoration(
                hintText: "Gender",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controllerAge,
              decoration: InputDecoration(
                hintText: "Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  service.createUserData(
                    model: UserDataModel(
                      id: auth.currentUser?.uid,
                      name: controllerName.text,
                      surname: controllerSurname.text,
                      gender: controllerGender.text,
                      age: controllerAge.text,
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
