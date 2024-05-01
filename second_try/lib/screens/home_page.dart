import 'package:flutter/material.dart';
import 'package:second_try/screens/profile_screen.dart';
import 'package:second_try/services/firebase_services.dart';

class HomePage extends StatelessWidget {
  final FirebaseServices firebaseServices =
      FirebaseServices(); // Create instance

  @override
  Widget build(BuildContext context) {
    final TextEditingController dataController = TextEditingController();
    final TextEditingController imageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            icon: Icon(Icons.verified_user),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: dataController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: imageController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: "Enter image link",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  firebaseServices.createData(
                      data: dataController.text, image: imageController.text);
                  dataController.text = '';
                  imageController.text = '';
                },
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            StreamBuilder(
                stream: firebaseServices.getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data?.length ?? 0,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  snapshot.data?[index].image ?? '',
                                ),
                                Text(
                                  snapshot.data?[index].data ?? '',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 20),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    firebaseServices.removeFromDataBase(
                                        snapshot.data?[index].id ?? '');
                                  },
                                  child: Text("delete"),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox();
                })
          ],
        ),
      ),
    );
  }
}
