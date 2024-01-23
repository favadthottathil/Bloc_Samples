import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_authLoginRequsted);

    on<AuthLogoutRequested>(_authLogoutRequested);
  }

  FutureOr<void> _authLogoutRequested(event, emit) async {
    emit(AuthLoading());
    try {
      await Future.delayed(
        const Duration(seconds: 1),
        () {
          return emit(AuthInitial());
        },
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  FutureOr<void> _authLoginRequsted(AuthLoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final email = event.email;

      final password = event.password;

      if (password.length < 6) {
        return emit(AuthFailure('PassWord Cannot be Lessthan 6 Character'));
      }

      await Future.delayed(
        const Duration(seconds: 1),
        () {
          return emit(AuthSuccess(uid: '$email-$password'));
        },
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
