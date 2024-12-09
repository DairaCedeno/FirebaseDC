import 'package:firebase_dc/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/loginscreen.dart';
import 'screens/registerscreen.dart';
import 'screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Firebase App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const InitialScreen(),
        routes: {
          '/login': (context) => SignInScreen(),
          '/register': (context) => RegisterScreen(),
          '/signup': (context) => RegisterScreen(),
          '/home': (context) {
            final user = FirebaseAuth.instance.currentUser;
            if (user == null) {
              return SignInScreen();
            } else {
              return DashboardScreen(user: user);
            }
          },
        },
      ),
    );
  }
}

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return DashboardScreen(user: snapshot.data!);
        } else {
          return SignInScreen();
        }
      },
    );
  }
}