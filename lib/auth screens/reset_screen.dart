import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodversity/core/extension/context_extension.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  TextEditingController emailTextController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(
                    image: AssetImage('assets/images/logo.png'),
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Reset Password!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Please enter your email",
                style: context.primaryTextTheme.titleMedium!.copyWith(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 30),
              TextFormField(
                controller: emailTextController,
                obscureText: false,
                enableSuggestions: true,
                autocorrect: !false,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  hintStyle: context.primaryTextTheme.titleSmall!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: context.colorScheme.primary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(
                      color: context.colorScheme.error,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await auth.sendPasswordResetEmail(
                        email: emailTextController.text,
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.message ==
                          'There is no user record corresponding to this identifier. The user may have been deleted.') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: context.colorScheme.error,
                            behavior: SnackBarBehavior.floating,
                            elevation: 1,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
                            content: const Text(
                              "No record found.",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }

                      if (e.message == 'Given String is empty or null') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            elevation: 1,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
                            content: Text(
                              "E-mail address is required.",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                      if (e.message ==
                          'The email address is badly formatted.') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.red,
                            behavior: SnackBarBehavior.floating,
                            elevation: 1,
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 150),
                            content: Text(
                              "Invalid email format!",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            duration: Duration(seconds: 5),
                          ),
                        );
                      }
                      emailTextController.clear();
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      context.colorScheme.error,
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: context.colorScheme.error,
                        ),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Want to login?",
                    style: context.primaryTextTheme.titleSmall!.copyWith(
                      color: context.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 07),
                  GestureDetector(
                    child: Text(
                      'Login here',
                      style: context.primaryTextTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colorScheme.error,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
