import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';
import 'signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFededed),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                _inputField(context),
                _googleLoginSection(context),
                _signup(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        SizedBox(height: 50), // Adjust for top padding
        Text(
          "Welcome Back!",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(), // Adjust for spacing between texts
        Text(
          "Login to your existing account",
          style: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 123, 123, 123),
          ),
        ),
        SizedBox(), // Add some spacing
        Image(
          image: AssetImage('assets/images/img_saly1.png'), // Replace with your image asset path
          width: 180, // Adjust the size as needed
          height: 188,
        ),
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Mobile Number",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color.fromRGBO(251, 109, 72, 1.000)),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12), // Padding for the label
            hintText: "Enter Number",
            hintStyle: TextStyle(color: Color.fromARGB(255, 164, 163, 163)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: Color(0xFFF2F2F2),
            filled: true,
          ),
          keyboardType: TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(bottom: 5),
          child: Text(
            "Password",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: Color.fromRGBO(251, 109, 72, 1.000)),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12), // Padding for the label
            hintText: "Enter Password",
            hintStyle: TextStyle(color: Color.fromARGB(255, 164, 163, 163)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            fillColor: Color(0xFFF2F2F2),
            filled: true,
            suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            ),
          ),
          obscureText: !_isPasswordVisible,
        ),
        const SizedBox(), // Padding between password field and forgot password
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero, // Remove default padding
            ),
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0, // Remove elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 14),
            backgroundColor: const Color.fromRGBO(251, 109, 72, 1.000),
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w900),
          ),
        ),
      ],
    );
  }

  _googleLoginSection(context) {
    
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(height: 50),
            Expanded(child: Divider(thickness: 1)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "Or Login with",
                style: TextStyle(color: Color.fromARGB(255, 116, 116, 116)),
              ),
            ),
            Expanded(child: Divider(thickness: 1)),
          ],
        ),
        const SizedBox(height: 8),
        ElevatedButton.icon(
          onPressed: () {
            // Add Google login logic here
          },
          style: ElevatedButton.styleFrom(
            elevation: 0, // Remove elevation
            backgroundColor: const  Color.fromRGBO(251, 109, 72, 1.000), // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical:  0, horizontal: 15),
          ),
          icon: const Icon(Icons.g_mobiledata_outlined, color: Color(0xFFF2F2F2)),
          label: const Text(
            "Google",
            style: TextStyle(color:  Color(0xFFF2F2F2)),
          ),
        ),
      ],
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("You Don't have an account ?", style: TextStyle(color: Colors.grey)),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: const Text(
            "Sign up",
            style: TextStyle(color: Color.fromRGBO(251, 109, 72, 1.000)),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(const LoginPage());
}
