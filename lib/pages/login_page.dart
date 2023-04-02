import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/pages/chat_page.dart';
import 'package:scholar_chat/pages/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/pages/register_page.dart';
import 'package:scholar_chat/widgets/custom_button.dart';
import 'package:scholar_chat/widgets/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  static String id = 'LoginPage';
  String? email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          Navigator.pushNamed(context, ChatPage.id);
          isLoading = false;
        } else if (state is LoginFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: ((context, state) => ModalProgressHUD(
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
                                'LOGIN',
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
                            onChanged: (value) => email = value,
                          ),
                          const SizedBox(height: 10),
                          CustomTextFormField(
                            hintText: 'Password',
                            onChanged: (value) => password = value,
                          ),
                          const SizedBox(height: 15),
                          CustomButton(
                            buttonText: 'LOGIN',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<LoginCubit>(context).loginUser(
                                  email: email!,
                                  password: password!,
                                );
                              } else {}
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, RegisterPage.id);
                                },
                                child: const Text(
                                  'REGISTER',
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
          )),
    );
  }

  Future<void> loginUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
