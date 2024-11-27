import 'package:cropguardai/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class CodePage extends StatefulWidget {
  const CodePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE0AB),
      body: SingleChildScrollView( // Wrap the entire body in a scroll view
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 50),
              // Wrap the image with ClipRRect to add border radius
              ClipRRect(
                borderRadius: BorderRadius.circular(20),  // Apply the desired border radius
                child: Image.asset(
                  'assets/code.jpg', 
                  height: 200, 
                  width: 200,
                  fit: BoxFit.cover,  // Ensure image covers the area properly
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Verify Code',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF273E05),
                      ),
                    ),
                    Text("Confirmation code is sent to your phone or email"),
                    SizedBox(height: 20),
                    OtpTextField(
                      numberOfFields: 5,
                      borderColor: Color(0xFF273E05), // Border color for the OTP fields
                      showFieldAsBox: true,
                      focusedBorderColor: Color(0xFF273E05),
                      onCodeChanged: (String code) {
                        // Handle validation or checks here           
                      },
                      onSubmit: (String verificationCode) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Verification Code"),
                              content: Text('Code entered is $verificationCode'),
                            );
                          },
                        );
                      }, // end onSubmit
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          // You can add the logic to resend the code here
                        },
                        child: Align(
                          alignment: Alignment.centerRight, // Aligns the text to the right
                          child: const Text(
                            "Resend Code",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                      MaterialPageRoute(builder: (context) => const MainHomePage(title: 'Main Home Page')));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFFE49723)),
                        fixedSize: MaterialStateProperty.all(
                          const Size(150, 50), // Adjust the size as needed
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
