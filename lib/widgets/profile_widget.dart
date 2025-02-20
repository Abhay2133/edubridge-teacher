import 'package:flutter/material.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  String name = "";
  String phoneNumber = "";
  String email = "";
  String profileImage = "";
  List<String> subjects = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadProfileData();
  }

  Future<void> loadProfileData() async {
    await Future.delayed(
        const Duration(milliseconds: 200)); // Simulating API delay
    setState(() {
      name = "Sandi Cage";
      phoneNumber = "+91 9876543210";
      email = "johndoe@example.com";
      profileImage =
          "https://tse3.mm.bing.net/th?id=OIP.2i5UaEHaQM3PYAYXQyM1AAAAAA&w=465&h=465&c=7"; // Replace with actual image URL
      subjects = ["Mathematics", "Physics", "Chemistry"];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          profileImage,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Center(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      leading: const Icon(Icons.phone, color: Colors.blue),
                      title: Text(phoneNumber),
                    ),
                    ListTile(
                      leading: const Icon(Icons.email, color: Colors.red),
                      title: Text(email),
                    ),
                    const SizedBox(height: 12),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Text(
                            "Subjects:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 8,
                        children: subjects
                            .map(
                              (subject) => Chip(
                                label: Text(subject),
                                shape: StadiumBorder(
                                  side: BorderSide(
                                    color: const Color.fromARGB(255, 233, 233, 233), // Change this to your desired border color
                                    width: 2, // Adjust the border width
                                  ),
                                ),
                                // backgroundColor: Color.fromRGBO(217, 235, 255, 1),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
