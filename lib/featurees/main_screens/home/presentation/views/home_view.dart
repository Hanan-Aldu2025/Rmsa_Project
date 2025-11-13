import 'package:flutter/material.dart';
import '../widgets/home_body_bloc_consumer.dart';

class HomeView extends StatelessWidget {
  final String uid;
  const HomeView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: HomeBodyBlocConsumer(uid: uid));
  }
}
