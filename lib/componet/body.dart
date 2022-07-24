import 'package:YourSawaal/componet/Models/login_response_model.dart';
import 'package:YourSawaal/componet/api_service.dart';
import 'package:YourSawaal/screens/forgotpass.dart';
import 'package:YourSawaal/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:YourSawaal/screens/signup.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  bodystate createState() => bodystate();
}

class bodystate extends State<body> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? email;
  String? password;
  late LoginRequestModel requestModel;
  @override
  void initState() {
    super.initState();
    requestModel = new LoginRequestModel();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // key: scaffoldkey,
      body: ProgressHUD(
        child: Form(key: globalFormKey, child: _loginUI(context)),
        inAsyncCall: isAPIcallProcess,
        key: UniqueKey(),
      ),
    ));
  }

  Widget _loginUI(BuildContext context) {
    return Container(
        key: scaffoldkey,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              child: Image.asset("images/logo.png"),
            ),
            FormHelper.inputFieldWidget(
                context,
                "email",
                "Email Address",
                (input) =>
                    !input.contains('@') ? "Email Id should be valid" : null,
                //     (onValidateVal) {
                //   if (onValidateVal.isEmpty) {
                //     return "Email can not be Empty.";
                //   }
                //   return null;
                // },
                (input) => requestModel.email = input,
                // (onSavedVal) {
                //   email = onSavedVal;
                // },
                prefixIcon: Icon(Icons.person),
                showPrefixIcon: true,
                hintColor: Colors.black.withOpacity(0.7),
                borderRadius: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: FormHelper.inputFieldWidget(
                context,
                "password",
                "Password",
                (input) => input.length < 3
                    ? "Password should be more than 3 characters"
                    : null,
                // (onValidateVal) {
                //   if (onValidateVal.isEmpty) {
                //     return "Password can not be Empty.";
                //   }
                //   return null;
                // },
                (input) => requestModel.password = input,
                // (onSavedVal) {
                //   password = onSavedVal;
                // },
                prefixIcon: Icon(Icons.lock),
                showPrefixIcon: true,
                hintColor: Colors.black.withOpacity(0.7),
                borderRadius: 10,
                obscureText: hidePassword,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    color: Colors.red.withOpacity(0.7),
                    icon: Icon(
                      hidePassword ? Icons.visibility_off : Icons.visibility,
                    )),
              ),
            ),
            Column(children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => forgotpass()));
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 15, color: Colors.red, letterSpacing: 1.7),
                ),
              ),
            ]),
            RoundButton(
              press: () {
                // {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(builder: (context) => const nav_bar()),
                //   );
                // }
                // ;
                if (validateandsave()) {
                  // print(requestModel.toJson());

                  setState(() {
                    isAPIcallProcess = true;
                  });

                  APIService apiService = APIService();
                  apiService.login(requestModel).then((value) => {
                        // ignore: unnecessary_null_comparison
                        if (value != null)
                          {
                            setState(() {
                              isAPIcallProcess = false;
                            }),
                            // if (value.token.isNotEmpty)
                            if (value)
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const nav_bar()),
                                )
                                // Navigator.pushNamedAndRemoveUntil(
                                //     context, '/navbar', (route) => false)
                                // // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const nav_bar()),
                                // ),
                                // final snackBar =
                                //     SnackBar(content: Text("Login Successful"));
                                // scaffoldkey.currentState?.showSnackBar(snackBar);
                              }
                            else
                              {
                                FormHelper.showSimpleAlertDialog(
                                    context,
                                    "Your Sawaal",
                                    'Invalid Email/Password !',
                                    "OK", () {
                                  Navigator.pop(context);
                                }),
                                // final snackBar = SnackBar(content: Text(value.error));
                                // scaffoldkey.currentState?.showSnackBar(snackBar);
                              }
                          }
                      });
                }
              },
              // {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const nav_bar()),
              //   );
              // },
              // if (validateandsave()) {
              //   setState(() {
              //     isAPIcallProcess = true;
              //   });
              //   LoginRequestModel model =
              //       LoginRequestModel(email: email!, password: password!);
              //   APIservice.login(model).then((response) => {
              //         setState(() {
              //           isAPIcallProcess = false;
              //         }),
              //         if (response)
              //           {
              //             Navigator.pushNamedAndRemoveUntil(
              //                 context, '/navbar', (route) => false)
              //           }
              //         else
              //           {
              //             FormHelper.showSimpleAlertDialog(
              //                 context,
              //                 Config.appName,
              //                 'Invalid Email/Password !',
              //                 "OK", () {
              //               Navigator.pop(context);
              //             })
              //           }
              //       });
              // }
              // },
              text: 'Login',
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return signup();
                    },
                  ),
                );
              },
            ),
            OnDiverder(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                socialicons(
                  iconsrc: 'icons/search.png',
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const nav_bar()),
                    );
                  },
                ),
                socialicons(
                  iconsrc: 'icons/facebook.png',
                  press: () {},
                ),
                socialicons(
                  iconsrc: 'icons/apple.png',
                  press: () {},
                ),
              ],
            ),
          ],
        ));
  }

  bool validateandsave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }
}

class RoundButton extends StatelessWidget {
  final String text;
  final void Function() press;

  const RoundButton({super.key, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Colors.orange,
        ]),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final void Function() press;

  const AlreadyHaveAnAccountCheck(
      {super.key, this.login = true, required this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ?" : "Already have an Account ?",
          style: TextStyle(color: Colors.grey),
        ),
        GestureDetector(
          onTap: press,
          child: Text(login ? "Sign up" : "Sign in",
              style: TextStyle(
                  color: Color.fromARGB(139, 255, 25, 0),
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class OnDiverder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.symmetric(vertical: size.height * 0.01, horizontal: 30),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "OR",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: (Colors.grey),
        height: 1.5,
      ),
    );
  }
}

class socialicons extends StatelessWidget {
  final String iconsrc;
  final void Function() press;

  const socialicons({super.key, required this.iconsrc, required this.press});

  @override
  Widget build(Object context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Image.asset(
          iconsrc,
          height: 25,
          width: 30,
        ),
      ),
    );
  }
}
