import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  //Declaración de variables
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser =  false;


  @override
  Widget build(BuildContext context) {

    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: const AssetImage('assets/arizona_fondo.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.darken)
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 70,
              child: _construirTop()
              ),
            Positioned(
              bottom: 0,
              child: _construirBottom()
              )
          ],
        ),
      ),
    );
  }

  //Creación de una widget externa
  //Parte superior
  Widget _construirTop(){
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_sharp,
          size: 100,
          color: Colors.white,
          ),
          Text(
            'VER MAPA',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              letterSpacing: 2
            ),
            )
        ],
      ),
    );
  }

  //Parte inferior
  Widget _construirBottom(){
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _construirFormulario(),
        ), 
      ),
    );
  }

  //Formulario
  Widget _construirFormulario(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bienvenidos',
          style: TextStyle(
            color: Colors.amber,
            fontSize: 32,
            fontWeight: FontWeight.w500
          ),
        ),
        _construirTextoPlomo('Por favor ingresar tus datos'),
        const SizedBox(height: 30),
        _construirTextoPlomo('Dirección de Email'),
        _construirInputField(emailController),
        const SizedBox(height: 40),
        _construirTextoPlomo('Contraseña'),
        _construirInputField(passwordController, isPassWord: true),
        const SizedBox(height: 20),
        _construirRememberForgot(),
        const SizedBox(height: 20),
        _construirBotonLogeo(),
        const SizedBox(height: 20),
        _construirOtroLogeo()
      ]
      );
  }

  //Textos en color plomo para formulario
  Widget _construirTextoPlomo(String text){
    return Text(
      text,
      style: const TextStyle(
        color: Colors.grey,        
      ),
      );
  }

  Widget _construirInputField(TextEditingController controller, {isPassWord = false}){
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: isPassWord ? const Icon(Icons.remove_red_eye) : const Icon(Icons.done)
      ),
      obscureText: isPassWord,
    );
  }

  Widget _construirRememberForgot(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value){
                setState(() {
                  rememberUser = value!;
                });
              }
              ),
            _construirTextoPlomo('Recordar contraseña')
          ],
        ),
        TextButton(
          onPressed: (){},
          child: _construirTextoPlomo('Olvide mi contraseña')
          )
      ],
    );
  }

  Widget _construirBotonLogeo(){
    return ElevatedButton(
      onPressed: (){
        debugPrint("Email: ${emailController.text}");
        debugPrint("Contraseña: ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        elevation: 10,
        shadowColor: Colors.orange,
        minimumSize: const Size.fromHeight(60)
      ),
      child: const Text(
        'REGISTRARSE',
        style: TextStyle(
          color: Colors.orange
        ),
        )
      );
  }

  Widget _construirOtroLogeo(){
    return Center(
      child: Column(
        children: [
          _construirTextoPlomo("O acceder con"),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(
                icon: Image.asset('assets/github.png'),                
              ),
              Tab(
                icon: Image.asset('assets/instagram.png'),
              ),
              Tab(
                icon: Image.asset('assets/logotipo-cuadrado-de-vimeo.png'),
              )
            ],
          )
        ],
      ),
    );
  }
}