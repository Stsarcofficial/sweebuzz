import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweebuzz/LoginScreen/login_screen.dart';
import 'signup_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Sign Up",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30),
                _inputField("Name", "Enter Name", TextInputType.text),
                const SizedBox(height: 15),
                _inputField("Username", "Enter Username", TextInputType.text),
                const SizedBox(height: 15),
                _inputField("Mobile Number", "Enter Mobile Number", TextInputType.phone),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: const Color.fromRGBO(251, 109, 72, 1.000),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Or Sign Up with",
                        style: TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 40,
                  height: 30, // Set the width and height of the button to match the image
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Add Google sign-up logic here
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: const Color.fromRGBO(251, 109, 72, 1.000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    icon: const Icon(Icons.g_mobiledata_outlined, size: 14, color: Color(0xFFF2F2F2)),
                    label: const Text(
                      "Google",
                      style: TextStyle(color: Color(0xFFF2F2F2), fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?", style: TextStyle(color: Colors.grey)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Color.fromRGBO(251, 109, 72, 1.000)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField(String label, String hint, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromRGBO(251, 109, 72, 1.000)),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hint,
            hintStyle: const TextStyle(color: Color.fromARGB(255, 164, 163, 163)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color(0xFFF2F2F2),
            filled: true,
          ),
          keyboardType: keyboardType,
          inputFormatters: keyboardType == TextInputType.phone
              ? [
                  LengthLimitingTextInputFormatter(10),
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
        ),
      ],
    );
  }
}

void main() {
  runApp(const SignUpPage());
}
