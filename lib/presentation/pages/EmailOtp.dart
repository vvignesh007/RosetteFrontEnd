import 'package:flutter/material.dart';

class EmailOtp extends StatefulWidget {
  const EmailOtp({super.key});

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(
            children: [
              Positioned(
                top: -100,
                right: -100,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Confirm your code",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 44,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "Enter the code we have sent to the ex*******@gmail.com.",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OTPBox(),
                      OTPBox(),
                      OTPBox(),
                      OTPBox(),
                      OTPBox(),
                      OTPBox(),
                    ],
                  ),
                  SizedBox(height: 50),
                  GestureDetector(
                    onTap: () {
                      // Code to resend the code
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 150),
                      child: Text(
                        "Send code again",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center, // Align the Confirm button horizontally
                    child: ElevatedButton(
                      onPressed: () {
                        // Code to confirm the entered OTP
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        minimumSize: Size(200, 50), // Adjust width and height as needed
                      ),
                      child: Text("Confirm"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPBox extends StatefulWidget {
  @override
  _OTPBoxState createState() => _OTPBoxState();
}

class _OTPBoxState extends State<OTPBox> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.length > 1) {
        _controller.text = _controller.text.substring(0, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 6.5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 10.0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        maxLength: 1,
        keyboardType: TextInputType.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            _focusNode.nextFocus();
          }
        },
        decoration: InputDecoration(
          counterText: '',
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}
