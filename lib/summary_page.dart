import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final String name;
  final String city;
  final String age;
  final String nationallity;
  final List<String> hobbies;

  const SummaryPage({
    super.key,
    required this.name,
    required this.city,
    required this.age,
    required this.nationallity,
    required this.hobbies,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Summary Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name: $name', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('City: $city', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Age: $age', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              Text('Nationality: $nationallity', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              Text('Hobbies:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              hobbies.isEmpty
                  ? Text('No hobbies added.', style: TextStyle(fontSize: 16))
                  : Wrap(
                      spacing: 8,
                      children: hobbies
                          .map((hobby) => Chip(
                                label: Text(hobby),
                              ))
                          .toList(),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
