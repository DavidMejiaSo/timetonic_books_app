import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timetonic_books/design_tools/tool_widgets/app_colors.dart';

class DescriptionScreen extends ConsumerStatefulWidget {
  const DescriptionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DescriptionScreenState();
}

class _DescriptionScreenState extends ConsumerState<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.red,
      child: Column(
        children: [],
      ),
    );
  }
}
