import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<SignInButtonClickedEvent>((event, emit) async {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: state.email, password: state.password);
      print(user.user!.email);
    });
    on<SignInEmailChangedEvent>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
     on<SignInPasswordChangedEvent>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
  }
}
