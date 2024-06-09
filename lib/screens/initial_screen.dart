import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetonic_books/design_tools/tool_widgets/appButtons.dart';
import 'package:timetonic_books/design_tools/tool_widgets/app_colors.dart';
import 'package:timetonic_books/design_tools/tool_widgets/tool_widgets.dart';

import '../design_tools/tool_widgets/necesary_images.dart';

class InitialScreen extends ConsumerStatefulWidget {
  const InitialScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InitialScreenState();
}

class _InitialScreenState extends ConsumerState<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(NecessaryImages
                          .books_image), // Ruta de la imagen asset
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: AppWidgets.mainLogo(context, 40, 25),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 30),
                  margin: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: AppWidgets.smallText(
                      context,
                      "Welcome to our book app! Explore a vast collection of titles from all genres and discover new stories that will inspire you. Enjoy reading anytime, anywhere.",
                      5),
                ),
                AppButtons().blackButton(
                    fontSize: 5,
                    horizontalPadding: 12,
                    verticalPadding: 1.5,
                    context: context,
                    texto: "Get Started",
                    onPressed: () {
                      GoRouter.of(context).go('/loginPage');
                      ;
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
