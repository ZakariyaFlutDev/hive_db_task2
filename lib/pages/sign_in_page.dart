import 'package:flutter/material.dart';
import 'package:hive_db_task2/model/user_model.dart';
import 'package:hive_db_task2/pages/sign_up_page.dart';
import 'package:hive_db_task2/services/hive_db.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  static const String id = "sign_in-page";

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  _doSignIn(){
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();

    var user = new User.from(name: email, password: password);

    HiveDB().storeUser(user);

    var user2 = HiveDB().loadUser();

    print(user2.name);
    print(user2.password);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade700,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      image: DecorationImage(
                        image: AssetImage("assets/images/user.jpeg")
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("Welcome", style: TextStyle(fontSize: 18,color: Colors.teal.shade300),),
                  SizedBox(height: 10,),
                  Text("Sign In", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(50), topLeft: Radius.circular(50)),
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100,),

                          //#email
                          Text("Email", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border( bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.0
                                ))
                            ),
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  hintText: "Enter Email",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          SizedBox(height: 30,),

                          //#password
                          Text("Password", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
                          SizedBox(height: 10,),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border( bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1.0
                                ))
                            ),
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  hintText: "Enter Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),

                          Center(
                            child: Text("Forget Password ?", style: TextStyle(color: Colors.grey.shade400),),
                          ),
                          SizedBox(height: 30,),

                          //#signin
                          GestureDetector(
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.teal.shade700,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text("Sign In", style: TextStyle(color: Colors.white, fontSize: 18),),
                              ),
                            ),
                            onTap: _doSignIn,
                          ),
                          SizedBox(height: 20,),

                          //#OR
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                              SizedBox(width: 20,),
                              Text("OR", style: TextStyle(color: Colors.grey.shade400),),
                              SizedBox(width: 20,),
                              Expanded(
                                child: Container(
                                  height: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50,),
                          Center(
                            child: Container(
                              width: 200,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/face.png"),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/twit.png"),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  ),
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/insta.png"),
                                            fit: BoxFit.cover
                                        )
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?"),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushNamed(context, SignUpPage.id);
                          },
                          child: Text("Sign Up", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
                        )
                      ],
                    ),
                    SizedBox(height: 30,),
                  ],
                )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
