import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/scholar.png'),
                    const Text(
                      'Scholar Chat',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'pacifico',
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      hintText: 'Email',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      hintText: 'Password',
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                    const SizedBox(height: 15),
                    CustomButton(
                      buttonText: 'REGISTER',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            await registerUser();
                            Navigator.pushNamed(
                              context,
                              ChatPage.id,
                              arguments: email,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(
                                context,
                                'The password provided is too weak.',
                              );
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(
                                context,
                                'The account already exists for that email.',
                              );
                            }
                          } catch (e) {
                            showSnackBar(
                              context,
                              e.toString(),
                            );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        } else {}
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Color(0xFFC7EDE6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
