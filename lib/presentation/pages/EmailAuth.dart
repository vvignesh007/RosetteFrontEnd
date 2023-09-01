import 'package:flutter/material.dart';
import 'package:network/presentation/pages/EmailOtp.dart';



class EmailAuth extends StatefulWidget {
  const EmailAuth({super.key});

  @override
  State<EmailAuth> createState() => _EmailAuthState();
}

class _EmailAuthState extends State<EmailAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: -100,
              right: -100,
              child: Container(
                width: 200,
                height: 200,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF00F1FF),
                      Color(0xFF399197),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Enter Your E-mail Address",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 20),
                   Text(
                    "We will send an OTP verification to you",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 254, 253, 253),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Email Address",
                        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 20),
                   Align(
                    alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {
                      //hey man call the api of firebase to send authentification
                       Navigator.push(
                  context,MaterialPageRoute(builder: (context) => EmailOtp()),
                );
              },
                    
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      minimumSize: Size(200, 50),
                    ),
                    child: const Text("Send OTP"),
                  ),
                   ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}

  