import 'package:chat_app/mobile/UI/screens/chat_screen.dart';
import 'package:chat_app/mobile/UI/screens/register_screen.dart';
import 'package:chat_app/mobile/UI/screens/users_screen.dart';
import 'package:flutter/material.dart';

import '../mobile/UI/screens/loading_screen.dart';
import '../mobile/UI/screens/login_screen.dart';

final routesMap = <String, Widget Function(BuildContext)>{
  '/login'   : (_) => const LoginScreen(),
  '/users'   : (_) => const UsuariosScreen(),
  '/chat'    : (_) => const ChatScreen(),
  '/register': (_) => const RegisterScreen(),
  '/loading': (_) => const LoadingScreen(),
};