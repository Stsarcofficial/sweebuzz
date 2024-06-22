import 'package:flutter/material.dart';
import 'package:sweebuzz/HomeScreen/home_screen.dart';

void main() {
  runApp(const CreateAccountPage());
}

class CreateAccountPage extends StatelessWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _mobileController = TextEditingController();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFededed),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  width: double.infinity,
                  color: const Color(
                      0xFFededed), // Background color set to #ededed
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        headerSection(),
                        inputFieldsSection(_mobileController, context),
                        nextButton(_formKey, context),
                        imageSection(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget headerSection() {
    return Column(
      children: const <Widget>[
        SizedBox(height: 60.0),
        Text(
          "Create Account",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget inputFieldsSection(
      TextEditingController mobileController, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        inputField(
          label: "Enter OTP",
          hintText: "Enter OTP",
          widget: TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('OTP Resent')),
              );
            },
            child: Text(
              "Resend OTP",
              style: TextStyle(
                color: Color.fromRGBO(112, 112, 112, 1),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        inputField(label: "Password", hintText: "Create Password"),
        const SizedBox(height: 20),
        inputField(label: "Confirm Password", hintText: "Confirm Password"),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget inputField(
      {required String label, required String hintText, Widget? widget}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(251, 109, 72, 1.000),
              ),
            ),
            if (widget != null) widget,
          ],
        ),
        const SizedBox(
            height: 5), // Set the gap between text and input field to 5
        TextField(
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            fillColor: const Color.fromRGBO(255, 255, 255, 1),
            filled: true,
          ),
        ),
      ],
    );
  }

  Widget nextButton(GlobalKey<FormState> formKey, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10), // Adjusted padding
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 10), // Adjusted horizontal and vertical padding
          backgroundColor: const Color.fromRGBO(251, 109, 72, 1.000),
          elevation: 0, // Remove button elevation
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageSection() {
    return Column(
      children: [
        const SizedBox(height: 0),
        const Image(
          image: AssetImage('assets/images/img_icon17331.png'),
          height: 139,
          width: 137,
        )
      ],
    );
  }
}
