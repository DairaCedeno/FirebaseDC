import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/usermodel.dart';
import 'event.dart';
import 'state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginRequested>(_login);
    on<RegisterRequested>(_register);
    on<LogoutRequested>(_logout);
  }

  Future<void> _login(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthAuthenticated(UserModel.fromFirebaseUser(user.user!)));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Error al iniciar sesión'));
    } catch (e) {
      emit(AuthError('Error inesperado: ${e.toString()}'));
    }
  }

  Future<void> _register(
      RegisterRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthRegistrationSuccess());
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'Error al registrarse'));
    } catch (e) {
      emit(AuthError('Error inesperado: ${e.toString()}'));
    }
  }

  Future<void> _logout(LogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await FirebaseAuth.instance.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError('Error al cerrar sesión'));
    }
  }
}
