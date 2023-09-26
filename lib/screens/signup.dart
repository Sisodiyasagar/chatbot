import 'package:chatgpt/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Center(
              child: Container(
                height: 250,
                width: double.infinity,
                child: Image.asset("assets/images/logosignin.png"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 35,right: 35),
                    child: Text("Email :",style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400
                    ),),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    width: double.infinity,

                    margin: EdgeInsets.only(left: 35,right: 35),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.email
                          ),
                          hintText: "Enter your email here : ",
                          hintStyle: TextStyle(fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2,color: Colors.black),
                              borderRadius: BorderRadius.circular(4)

                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 35,right: 35),
                    child: Text("Password :",style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400
                    ),),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    width: double.infinity,

                    margin: EdgeInsets.only(left: 35,right: 35),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                              Icons.lock
                          ),
                          hintText: "",
                          hintStyle: TextStyle(fontWeight: FontWeight.w500),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2,color: Colors.black),
                              borderRadius: BorderRadius.circular(4)
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      color: Colors.brown,
                      child: MaterialButton(
                        child: Text("Sign Up",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        ),),
                        onPressed: () async{
                          await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                        },
                      ),
                    )
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
