import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../design_tools/tool_widgets/appButtons.dart';
import '../../design_tools/tool_widgets/app_colors.dart';

import '../../design_tools/tool_widgets/tool_widgets.dart';
import '../design_tools/tool_widgets/necesary_images.dart';
import '../domain/implementations/authentications_datasource_implementation.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String user;
    String pwd;
    void showSnackbar(BuildContext context, String message) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                  NecessaryImages.books_image), // Ruta de la imagen asset
              fit: BoxFit.cover, // Ajuste de la imagen dentro del contenedor
            )),
            child: Center(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: AppColors.grey
                    .withOpacity(0.5), // Color de fondo del contenedor
                borderRadius: BorderRadius.circular(
                    20), // Radio de los bordes redondeados
              ),
              child: Column(
                children: [
                  //-----------------------------------------------------------
                  //----------------------------Zona del logo
                  Expanded(child: AppWidgets.mainLogo(context, 72, 45)),

                  //------------------------Bienvenido mensaje

                  //-------------------------------------------

                  //----------------------------------------Zona de ingreso de usuario

                  Container(
                    //Container de el Usuario
                    color: AppColors.red.withOpacity(0.5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Center(
                      child: TextFormField(
                        onChanged: (value) {
                          user = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: AppColors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: AppColors.grey),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          labelText: "E-mail",
                          labelStyle: const TextStyle(
                            color: AppColors.white,
                          ),

                          // Nuevo campo para mostrar el mensaje de error
                        ),
                      ),
                    ),
                  ),
                  //-----------------------------------------------

                  //-------------------------------------------- zona de ingreso de contraseña
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  //Aquí va la password
                  Container(
                    //Container del TextFormField de la contraseña
                    color: AppColors.red.withOpacity(0.5),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      onChanged: (value) {
                        pwd = value;
                      },
                      //    obscureText: ref.watch(obscure_text_login),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: AppColors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: AppColors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                        ),
                        labelText: "Password",
                        labelStyle: const TextStyle(
                          color: AppColors.white,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                            child: const Icon(
                              color: AppColors.black,
                              Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  //------------------------------------------------------Zona de boton de registro

                  Container(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),

                  AppButtons().blackButton(
                    context: context,
                    texto: "Login",
                    onPressed: () async {
                      AuthenticationImpl().getSessKey("androiddeveloper",
                          "IG3m-QSCL-zqPS-Ciha-MsGi-sDwy-dfHI");
                      //Ir a siguiente página
                    },
                    textColor: AppColors.white,
                    fontSize: 4,
                    horizontalPadding: 22,
                    verticalPadding: 1,
                  ),

                  //-------------------------------------------------------Boton de ingreso
                ],
              ),
            )),
          ),
        ),
      ),
    );
  }
}
