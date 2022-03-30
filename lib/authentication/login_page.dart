import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffECEFF1),
          iconTheme: const IconThemeData(color: Color(0xff263238)),
        title:const Text(
            "Login/Signup",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
              child: ElevatedButton(
                  onPressed: (){},
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.mail),
                      SizedBox(width: 20.0,),
                      Text(
                        "Continue with Google",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all<Color>(Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
                "OR",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const Text(
                "Continue with Mobile Number and OTP",
              style : TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 25.0),
                child: ListView(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        labelText: "Phone Number",
                      ),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "OTP",
                        labelText: "OTP",
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: (){},
                          child: const Text(
                            "Send OTP",
                          ),
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          child: const Text(
                            "Submit OTP",
                          ),
                        ),
                      ],
                    )
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

