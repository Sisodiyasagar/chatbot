import 'package:chatgpt/screens/chat_screen.dart';
import 'package:chatgpt/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class signin extends StatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  State<signin> createState() => _signinState();
}


class _signinState extends State<signin> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 210,
                width: double.infinity,
                child: Image.asset("assets/images/logosignin.png"),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  width: 130,
                  height: 45,
                  child: MaterialButton
                    (
                    color: Colors.brown,

                    child: Text("Sign in",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21

                    ),),
                    onPressed: (){

                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  width: 130,
                  height: 45,
                  child: MaterialButton
                    (
                    color: Colors.brown,

                    child: Text("Sign Up",style: TextStyle(
                        fontWeight: FontWeight.bold,

                        fontSize: 21,


                    ),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Signuppage()));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 35,right: 35),
                    width: double.infinity,
                    child: Text("Email :",style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400
                    ),),
                  ),
                ),

              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 35,right: 35),
                    width: double.infinity,

                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter Your Email Here ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)
                          )
                      ),
                    ),
                  ),
                )
              ],
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
                          border: OutlineInputBorder(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 40,
                ),
                InkWell(
                  onTap: (){

                  },
                  highlightColor: Colors.blueAccent,
                  child: Container(
                      child: Text("Forgot Password ?",style: TextStyle(
                          fontSize: 18,

                          fontWeight: FontWeight.w400
                      ),)),
                ),
                SizedBox(
                  width: 34,
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  width: 140,
                  height: 40,
                  child: MaterialButton(
                    color: Colors.brown,
                    child: Text("Login",style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                    ),),
                    onPressed: () async{
                      if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text,
                          );

                          User? user = userCredential.user;
                          print('Signed in: ${user!.uid}');
                          setState(() {
                            isLoading = false;
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatScreen()));
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      }
                      else{
                        print('Empty Fields');
                      }

                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage()));
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),




          ],
        ),
      ),
    );

  }
}
