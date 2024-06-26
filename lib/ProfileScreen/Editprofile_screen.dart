import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController =
      TextEditingController(text: "vini.r01");
  final TextEditingController _nameController =
      TextEditingController(text: "Vini Rojer");
  final TextEditingController _bioController = TextEditingController(
      text:
          "Fashion Keep your face always toward the sunshine, and shadows will fall behind you.");
  final TextEditingController _emailController =
      TextEditingController(text: "vini123@gmail.com");
  final TextEditingController _phoneController =
      TextEditingController(text: "91 0000000000");

  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _bioFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _usernameFocus.dispose();
    _nameFocus.dispose();
    _bioFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  void _updateProfile() {
    if (_formKey.currentState!.validate()) {
      // Handle the profile update action
      // For example, save the data to a database or send it to a server
      print("Profile updated successfully!");
      print("Username: ${_usernameController.text}");
      print("Name: ${_nameController.text}");
      print("Bio: ${_bioController.text}");
      print("Email ID: ${_emailController.text}");
      print("Phone Number: ${_phoneController.text}");
    }
  }

  void _focusField(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  void _showPictureOptions(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom:
                    140), // Adjust this value to move it up or down and add left padding
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                width: 300, // Adjust width of the dialog box
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.camera_alt, color: Colors.black, size: 20),
                          SizedBox(width: 10),
                          Text('Take picture'),
                        ],
                      ),
                      onTap: () {
                        // Handle taking a picture
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.photo, color: Colors.black, size: 20),
                          SizedBox(width: 10),
                          Text('Select from gallery'),
                        ],
                      ),
                      onTap: () {
                        // Handle selecting from gallery
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Row(
                        children: [
                          Icon(Icons.delete, color: Colors.red, size: 20),
                          SizedBox(width: 10),
                          Text('Remove picture'),
                        ],
                      ),
                      onTap: () {
                        // Handle removing the picture
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFededed),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Edit Profile",
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
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/img_rectangle130_121x121.png'),
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.3),
                                BlendMode.darken,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 40,
                          child: GestureDetector(
                            onTap: () => _showPictureOptions(context),
                            child: Container(
                              width:
                                  20, // Adjust width based on the size needed
                              height:
                                  20, // Adjust height based on the size needed
                              decoration: BoxDecoration(
                                color: Colors
                                    .transparent, // Background color of the container
                                border: Border.all(
                                  color: Colors.white, // Border color
                                  width: 1.5, // Border width
                                ),
                                borderRadius: BorderRadius.circular(
                                    5), // Border radius to make it square-like
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add_rounded,
                                  color: Colors.white, // Icon color
                                  size: 16, // Icon size
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildProfileItem(
                      "Username", _usernameController, _usernameFocus),
                  _buildProfileItem("Name", _nameController, _nameFocus),
                  _buildProfileItem("Bio", _bioController, _bioFocus,
                      maxLines: 3),
                  _buildProfileItem("Email ID", _emailController, _emailFocus),
                  _buildProfileItem(
                      "Phone Number", _phoneController, _phoneFocus),
                  const SizedBox(height: 90), // Adjust height as needed
                  Center(
                    child: ElevatedButton(
                      onPressed: _updateProfile,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 226, 115, 64),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 130, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Update Profile",
                        style: TextStyle(color: Colors.white, fontSize: 16),
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

  Widget _buildProfileItem(
      String label, TextEditingController controller, FocusNode focusNode,
      {int maxLines = 1}) {
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
                  maxLines: maxLines,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.all(5.0),
                  ),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey), // Adjust font size as needed
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
