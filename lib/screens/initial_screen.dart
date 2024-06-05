import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetonic_books/design_tools/tool_widgets/appButtons.dart';

import '../design_tools/tool_widgets/necesary_images.dart';

class InitialScreen extends ConsumerWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        color: Colors.white,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image:
                    AssetImage(NecessaryImages.logo), // Ruta de la imagen asset
                fit: BoxFit.contain, //
              )),
            ),
            AppButtons().blackButton(
              fontSize: 5,
              horizontalPadding: 12,
              verticalPadding: 2,
              context: context,
              texto: "Welcome",
              onPressed: () {
                GoRouter.of(context).go('/descriptionPage');
                ;
              },
            )
          ],
        )));
  }
}
