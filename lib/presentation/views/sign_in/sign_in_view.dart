import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umart/presentation/views/sign_in/bloc/sign_in_bloc.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: const SignInLayout(),
    );
  }
}

class SignInLayout extends StatelessWidget {
  const SignInLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<SignInBloc>();
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Color(0xFFfff7ec),
            appBar: AppBar(actions: [],),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign In"),
                  const SizedBox(height: 40),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        onChanged: (value) {
                          bloc.add(SignInEmailChangedEvent(value));
                        },
                      ),
                      const SizedBox(height: 10),
                      TextField(onChanged: (value) {
                          bloc.add(SignInPasswordChangedEvent(value));
                        },
                          decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey))),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          bloc.add(SignInButtonClickedEvent());
                        },
                        child: const Text('Sign in'),
                      )
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }
}
