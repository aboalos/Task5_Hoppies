import 'package:flutter/material.dart';
import 'package:myapp/summary_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userCityController = TextEditingController();
  TextEditingController userAgeController = TextEditingController();
  TextEditingController userNationallityController = TextEditingController();

  List<String> hobbies = [];
  String? selectedHobby;

  // Sample hobby options
  final List<String> hobbyOptions = ['Reading', 'Gaming', 'Swimming', 'Cooking'];

  void addHobby(String hobby) {
    if (hobby.isNotEmpty && !hobbies.contains(hobby)) {
      setState(() {
        hobbies.add(hobby);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'The user name'),
                controller: userNameController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'The user city'),
                controller: userCityController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'The user age'),
                controller: userAgeController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'The user nationality'),
                controller: userNationallityController,
              ),

              SizedBox(height: 20),

              // Dropdown to select hobbies
              DropdownButton<String>(
                value: selectedHobby,
                hint: Text('Select a hobby'),
                isExpanded: true,
                items: hobbyOptions.map((String hobby) {
                  return DropdownMenuItem<String>(
                    value: hobby,
                    child: Text(hobby),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedHobby = newValue;
                  });
                },
              ),

              SizedBox(height: 10),

              // Button to add selected hobby
              ElevatedButton(
                onPressed: () {
                  if (selectedHobby != null) {
                    addHobby(selectedHobby!);
                  }
                },
                child: Text('Add Hobby'),
              ),

              SizedBox(height: 10),

              // Display added hobbies
              Wrap(
                spacing: 8.0,
                children: hobbies
                    .map((hobby) => Chip(
                          label: Text(hobby),
                          onDeleted: () {
                            setState(() {
                              hobbies.remove(hobby);
                            });
                          },
                        ))
                    .toList(),
              ),

              SizedBox(height: 40),

              ElevatedButton(
                child: Text('Save'),
                onPressed: () {
                  final userName = userNameController.text.trim();
                  final userCity = userCityController.text.trim();
                  final userAge = userAgeController.text.trim();
                  final userNationallity = userNationallityController.text.trim();

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SummaryPage(
                        name: userName,
                        city: userCity,
                        age: userAge,
                        nationallity: userNationallity,
                        hobbies: hobbies,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
