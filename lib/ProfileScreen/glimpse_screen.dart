import 'package:flutter/material.dart';

class EditGlimpsePage extends StatefulWidget {
  const EditGlimpsePage({super.key});

  @override
  _EditGlimpsePageState createState() => _EditGlimpsePageState();
}

class _EditGlimpsePageState extends State<EditGlimpsePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _birthDateController =
      TextEditingController(text: "20 - 03 - 2002");
  final TextEditingController _cityController =
      TextEditingController(text: "Bangalore");
  final TextEditingController _professionController =
      TextEditingController(text: "Fashion Designer");
  final TextEditingController _zodiacSignController =
      TextEditingController(text: "Taurus");
  final TextEditingController _hobbiesController =
      TextEditingController(text: "Dancing, Painting");
  final TextEditingController _interestsController =
      TextEditingController(text: "Cricket, Sketching, Web Series");

  final FocusNode _birthDateFocus = FocusNode();
  final FocusNode _cityFocus = FocusNode();
  final FocusNode _professionFocus = FocusNode();
  final FocusNode _zodiacSignFocus = FocusNode();
  final FocusNode _hobbiesFocus = FocusNode();
  final FocusNode _interestsFocus = FocusNode();

  @override
  void dispose() {
    _birthDateController.dispose();
    _cityController.dispose();
    _professionController.dispose();
    _zodiacSignController.dispose();
    _hobbiesController.dispose();
    _interestsController.dispose();
    _birthDateFocus.dispose();
    _cityFocus.dispose();
    _professionFocus.dispose();
    _zodiacSignFocus.dispose();
    _hobbiesFocus.dispose();
    _interestsFocus.dispose();
    super.dispose();
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // Handle the profile update action
      // For example, save the data to a database or send it to a server
      print("Profile updated successfully!");
      print("Birth Date: ${_birthDateController.text}");
      print("City: ${_cityController.text}");
      print("Profession: ${_professionController.text}");
      print("Zodiac Sign: ${_zodiacSignController.text}");
      print("Hobbies: ${_hobbiesController.text}");
      print("Interests: ${_interestsController.text}");
    }
  }

  void _focusField(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Edit Glimpse",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white, // Set background color here
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProfileItem("Birth Date", _birthDateController, _birthDateFocus),
                  _buildProfileItem("City", _cityController, _cityFocus),
                  _buildProfileItem("Profession", _professionController, _professionFocus),
                  _buildProfileItem("Zodiac Sign", _zodiacSignController, _zodiacSignFocus),
                  _buildProfileItem("Hobbies", _hobbiesController, _hobbiesFocus),
                  _buildProfileItem("Interests", _interestsController, _interestsFocus),
                  const SizedBox(height: 140), // Adjust height as needed
                  Center(
                    child: ElevatedButton(
                      onPressed: _updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 226, 115, 64),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 130, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, TextEditingController controller, FocusNode focusNode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controller,
                  focusNode: focusNode,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                  style: const TextStyle(fontSize: 16, color: Colors.grey), // Adjust font size as needed
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter $label';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.drive_file_rename_outline_outlined,
                color: Color.fromARGB(255, 226, 115, 64)),
            onPressed: () {
              _focusField(focusNode);
            },
          ),
        ],
      ),
    );
  }
}

