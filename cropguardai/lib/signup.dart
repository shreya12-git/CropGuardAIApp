import 'package:cropguardai/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'codepage.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key, required this.title});
  final String title;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFCAE0AB), // Add background color here
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/login2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Create your account',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF273E05),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          filled: true, // Ensures the background color is applied
                          fillColor: Color.fromARGB(147, 54, 87, 9), // Background color
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent), // Transparent border
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF375709)), // Border color on focus
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: "Email/UserName",
                          labelStyle: const TextStyle(color: Color.fromARGB(255, 223, 218, 218)),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true, // Ensures the background color is applied
                          fillColor: Color.fromARGB(147, 54, 87, 9), // Background color
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent), // Transparent border
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF375709)), // Border color on focus
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Color.fromARGB(255, 223, 218, 218)),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true, // Ensures the background color is applied
                          fillColor: Color.fromARGB(147, 54, 87, 9), // Background color
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent), // Transparent border
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF375709)), // Border color on focus
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelText: "Confirm Password",
                          labelStyle: const TextStyle(color: Color.fromARGB(255, 223, 218, 218)),
                          floatingLabelStyle: const TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please Enter Your Password';
                          }
                          return null;
                        },
                      ),
                    ),
      

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                                Navigator.push(
                          context,
                      MaterialPageRoute(builder: (context) => const CodePage(title: 'Code Page')));
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Color.fromARGB(219, 221, 166, 85)), // Set background color
                            fixedSize: MaterialStateProperty.all(
                              const Size(150, 50), // Adjust the size as needed
                            ),
                          ),
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white), // Optional: Change text color if needed
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
