import 'package:YourSawaal/componet/Models/signup_response_model.dart';
import 'package:YourSawaal/componet/api_service.dart';
import 'package:flutter/material.dart';
import 'package:YourSawaal/screens/login.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

import '../screens/home.dart';

class signupbody extends StatefulWidget {
  const signupbody({super.key});

  @override
  signupstate createState() => signupstate();
}

class signupstate extends State<signupbody> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? fname;
  String? lname;
  String? email;
  String? password;
  late signupRequestModel requestModel;
  @override
  void initState() {
    super.initState();
    requestModel = signupRequestModel();
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ProgressHUD(
        inAsyncCall: isAPIcallProcess,
        key: UniqueKey(),
        child: Form(key: globalFormKey, child: _signupUI(context)),
      ),
    ));
  }

  Widget _signupUI(BuildContext context) {
    return Container(
        key: scaffoldkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              child: Image.asset("images/logo2.png"),
            ),
            SizedBox(
              height: 60,
            ),
            FormHelper.inputFieldWidget(context, "fname", "First Name",
                (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return "Name can not be Empty.";
              }
              return null;
            }, (input) => requestModel.fname = input,
                // (onSavedVal) {
                //   name = onSavedVal;
                // },
                prefixIcon: Icon(Icons.person),
                showPrefixIcon: true,
                hintColor: Colors.black.withOpacity(0.7),
                borderRadius: 10),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FormHelper.inputFieldWidget(context, "lname", "Last Name",
                  (onValidateVal) {
                if (onValidateVal.isEmpty) {
                  return "Name can not be Empty.";
                }
                return null;
              }, (input) => requestModel.lname = input,
                  // (onSavedVal) {
                  //   name = onSavedVal;
                  // },
                  prefixIcon: Icon(Icons.person),
                  showPrefixIcon: true,
                  hintColor: Colors.black.withOpacity(0.7),
                  borderRadius: 10),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormHelper.inputFieldWidget(
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
                  //  (onSavedVal) {
                  //   email = onSavedVal;
                  // },
                  prefixIcon: Icon(Icons.person),
                  showPrefixIcon: true,
                  hintColor: Colors.black.withOpacity(0.7),
                  borderRadius: 10),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: FormHelper.inputFieldWidget(context, "name", "Name",
            //       (onValidateVal) {
            //     if (onValidateVal.isEmpty) {
            //       return "Name can not be Empty.";
            //     }
            //     return null;
            //   }, (input) => requestModel.name = input,
            //       // (onSavedVal) {
            //       //   name = onSavedVal;
            //       // },
            //       prefixIcon: Icon(Icons.person),
            //       showPrefixIcon: true,
            //       hintColor: Colors.black.withOpacity(0.7),
            //       borderRadius: 10),
            // ),
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
            RoundButton(
              press: () {
                if (validateandsave()) {
                  setState(() {
                    isAPIcallProcess = true;
                  });
                  APIService apiService = APIService();
                  apiService.signup(requestModel).then((value) => {
                        if (value != null)
                          {
                            setState(() {
                              isAPIcallProcess = false;
                            }),
                            if (value)
                              {
                                FormHelper.showSimpleAlertDialog(
                                    context,
                                    "Your Sawaal",
                                    'Signup Successfull. Please Login to access',
                                    "OK", () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => login()));
                                  // Navigator.pushNamedAndRemoveUntil(
                                  //     context, '/login', (route) => false);
                                }),
                              }
                            else
                              {
                                FormHelper.showSimpleAlertDialog(
                                    context,
                                    "Your Sawaal",
                                    "Signup Successfull. Please try again",
                                    "OK", () {
                                  Navigator.pop(context);
                                })
                              }
                          }
                      });
                }
                // if (validateandsave()) {
                //   setState(() {
                //     isAPIcallProcess = true;
                //   });
                //   RegisterRequestModel model = RegisterRequestModel(
                //       email: email!, name: name!, password: password!);
                //   APIservice.register(model).then((response) => {
                //         setState(() {
                //           isAPIcallProcess = true;
                //         }),
                //         if (response.data != null)
                //           {
                //             FormHelper.showSimpleAlertDialog(
                //                 context,
                //                 Config.appName,
                //                 'Signup Successfull. Please Login to access',
                //                 "OK", () {
                //               Navigator.pushNamedAndRemoveUntil(
                //                   context, '/login', (route) => false);
                //             }),
                //           }
                //         else
                //           {
                //             FormHelper.showSimpleAlertDialog(
                //                 context, Config.appName, response.message, "OK",
                //                 () {
                //               Navigator.pop(context);
                //             })
                //           }
                //       });
                // }
              },
              text: 'Signup',
            ),
            AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return login();
                      },
                    ),
                  );
                }),
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
          padding: EdgeInsets.symmetric(vertical: 20),
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
