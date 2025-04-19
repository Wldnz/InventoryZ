import 'package:flutter/material.dart';
import 'package:my_app/_Utils/account.dart';
import 'package:my_app/pages/Dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _Login();
}

class _Login extends State<LoginPage> {
  // final account = Account();

  var loginData = Map<String, String>();


  @override
  void initState() {
    // TODO: implement initState
    _isLogin();
    super.initState();
  }

  Future<void>_isLogin() async{
    var getAccount = await Account.getAccount();
    if(getAccount.isNotEmpty){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Login Page')),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Column(
              spacing: 20.0,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250.0,
                  color: Colors.blue[400],
                ),
            Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      spacing: 5.0,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlueAccent[700],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Text(
                            'Email',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          padding: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 225, 225),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(
                            inputFormatters: [],
                            decoration: InputDecoration(
                              icon: Icon(Icons.email_rounded),
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.only(
                                top: 8.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 8.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "Input Your Email Address here...",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (String value) => loginData['email'] = value,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          width: MediaQuery.of(context).size.width - 20,
                          child: Text(
                            'Password',
                            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 30,
                          padding: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 230, 225, 225),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              icon: Icon(Icons.account_box_sharp),
                              border: OutlineInputBorder(borderSide: BorderSide.none),
                              contentPadding: EdgeInsets.only(
                                top: 8.0,
                                left: 10.0,
                                right: 10.0,
                                bottom: 8.0,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 2.0,
                                ),
                              ),
                              hintText: "Input Your Email Address here...",
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            onChanged: (String value) => loginData['password'] = value,
                          ),
                        ),
                      ],
                    ),
                Text(
                  "Your credentials doesn't match",
            
                  style: TextStyle(fontSize: 16.0, color: Colors.red.shade600),
                ),
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent.shade400,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  onTap: () async {
                    if (await Account.login(loginData['email'].toString(), loginData['password'].toString())){
                      print('passed');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Dashboard()),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
