import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../design_tools/tool_widgets/appButtons.dart';
import '../design_tools/tool_widgets/app_colors.dart';
import '../design_tools/tool_widgets/necesary_images.dart';
import '../design_tools/tool_widgets/spacing.dart';
import '../design_tools/tool_widgets/tool_widgets.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Container(
                color: AppColors.white,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    buttonsBackandTittle(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }

  Widget buttonsBackandTittle() {
    //---------------------Botones de notificaciones y menú-----------------
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Centra los elementos horizontalmente
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: AppButtons().blackButton(
            context: context,
            //icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            },
            fontSize: 6,
            horizontalPadding: 3,
            verticalPadding: 1, texto: '<-',
          ),
        ),
        Spacer(flex: 1), // Espacio flexible para centrar el MainText
        Expanded(
          flex: 5,
          child: Center(
            // Centra el MainText en el eje horizontal
            child: AppWidgets.mainText(
              context,
              "PRODUCTOS",
              4,
            ),
          ),
        ),
        Spacer(flex: 3), // Espacio flexible para espaciado uniforme
      ],
    );
  }

  Widget _bookCard(
      {required String logoUrl,
      required String name,
      required String productId}) {
    return GestureDetector(
      onTap: () {},
      child: AppWidgets.customCard(
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.all(3.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          18), // Ajusta el radio para redondear las esquinas
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withOpacity(0.3), // Color de la sombra
                              spreadRadius:
                                  2, // Tamaño de expansión de la sombra
                              blurRadius:
                                  5, // Tamaño del desenfoque de la sombra
                              offset: const Offset(0,
                                  2), // Desplazamiento de la sombra en el eje Y
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                              10), // Ajusta el radio para redondear las esquinas
                        ),
                        child: logoUrl == ''
                            ? Image.asset(NecessaryImages.logo)
                            : Image.network(
                                logoUrl,
                                fit: BoxFit.fill,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacing.vertical(5),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Center(
                    child: AppWidgets.elipsisText(
                      context,
                      name,
                      3.5,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
