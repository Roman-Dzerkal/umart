part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}
class SignInButtonClickedEvent extends SignInEvent {}

class SignInEmailChangedEvent extends SignInEvent {
  final String email;

  const SignInEmailChangedEvent(this.email);
}


class SignInPasswordChangedEvent extends SignInEvent {
  final String password;

  const SignInPasswordChangedEvent(this.password);
}
