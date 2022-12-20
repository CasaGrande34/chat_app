import 'package:flutter/material.dart';
//dependencies

//file addresses
import '../../widgets/logo.dart';
import '../../widgets/labels.dart';
import '../../widgets/custom_input.dart';
import '../../widgets/buttons/button_blue.dart';

//dependencies

//file addresses


class LoginScreen extends StatelessWidget {
  
  const LoginScreen({super.key});

    @override
    Widget build(BuildContext context) {
      // double w = MediaQuery.of(context).size.width; 
      double h = MediaQuery.of(context).size.height; 
      return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              height: h * 0.9,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Logo( titulo: 'Messenger', ),
                    _Form(),
                    Labels( ruta: '/register', 
                      title: 'No tienes cuenta?', 
                      subtitle: 'Create una ahora!',
                    ),
                    Text(
                      'Terminos y condiciones de uso', style: TextStyle( fontWeight: FontWeight.w200 ),
                    )
                ],
              ),
            ),
          ),
        ),
       );
  }
}

class _Form extends StatefulWidget {
  const _Form({Key? key}) : super(key: key);

  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only( top: 40 ),
      padding: const EdgeInsets.symmetric( horizontal: 50 ),
      child: Column(
        children: [
          
          CustomInput(
            icon: Icons.mail_outline,
            placeholder: 'Correo',
            textEditingController: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textEditingController: passwordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
          ),
          ButtonBlue(
            text: 'Ingrese',
            onPressed: () {},
          )          
        ],
      ),
    );
  }
}

