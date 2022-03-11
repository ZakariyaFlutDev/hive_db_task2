import 'package:flutter/material.dart';
import 'package:hive_db_task2/model/account_model.dart';
import 'package:hive_db_task2/pages/sign_in_page.dart';
import 'package:hive_db_task2/services/hive_db.dart';
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const String id = "sign_up_page";

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();

  _doSignUp(){
    String email = emailController.text.toString().trim();
    String number = numberController.text.toString().trim();
    String address = addressController.text.toString().trim();

    var account = new Account.from(email: email, phone: number, address: address);

    HiveDB().storeAccount(account);

    var account2 = HiveDB().loadAccount();

    print(account2.email);
    print(account2.phone);
    print(account2.address);

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

                  SizedBox(height: 20,),
                  Text("Welcome", style: TextStyle(fontSize: 18,color: Colors.teal.shade300),),
                  SizedBox(height: 10,),
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),),
                  SizedBox(height: 30,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
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
                                decoration: const InputDecoration(
                                    hintText: "Enter Email",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),

                            //#number
                            Text("Number", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
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
                                controller: numberController,
                                decoration: const InputDecoration(
                                    hintText: "Enter Number",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),

                            //#address
                            Text("Address", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20),),
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
                                controller: addressController,
                                decoration: const InputDecoration(
                                    hintText: "Enter Address",
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none
                                ),
                              ),
                            ),

                            SizedBox(height: 30,),

                            //#signup
                            GestureDetector(
                              onTap: _doSignUp,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.teal.shade700,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18),),
                                ),
                              ),
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
                                      decoration: const BoxDecoration(
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
                                      decoration: const BoxDecoration(
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
                                      decoration: const BoxDecoration(
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
                          Text("Already have an account ?"),
                          SizedBox(width: 10,),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, SignInPage.id);
                            },
                            child: Text("Sign In", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),),
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
