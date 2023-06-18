import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class persons {
  final String name;
  final String prov;
  final String address;

  persons({required this.name, required this.prov, required this.address});
}

class MyApp extends StatelessWidget {
  final List<persons> per = [
    persons(name: "สังกะสี", prov: "กรุงเทพ", address: "แขวงบางไผ่ เขตบางแค"),
    persons(
        name: "น้องไอซ์",
        prov: "กรุงเทพ",
        address: "แขวงบางกอกน้อย เขตบางกอกน้อย"),
    persons(name: "เจนนี่", prov: "ชลบุรี", address: "ตำบล เมือง อำเภอ เมือง"),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Data',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: HomePage(per: per),
    );
  }
}

class AllPersonsPage extends StatelessWidget {
  final List<persons> per;

  AllPersonsPage({required this.per});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: per.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(per[index].name),
            subtitle: Text('Province: ${per[index].prov}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content:
                          Text('Are you sure you want to delete this person?'),
                      actions: [
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Delete'),
                          onPressed: () {
                            // Delete the person
                            // Code to delete the person goes here
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<persons> per;

  HomePage({required this.per});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Personal Data'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'By Province'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllPersonsPage(per: per),
            // ByProvincePage(persons: persons),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     // Navigate to data entry page
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => DataEntryPage()),
        //     );
        //   },
        // ),
      ),
    );
  }
}
