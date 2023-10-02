import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompleteProfileVIew extends ConsumerStatefulWidget {
  const CompleteProfileVIew({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CompleteProfileVIewState();
}

class _CompleteProfileVIewState extends ConsumerState<CompleteProfileVIew> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold();
  }
}
