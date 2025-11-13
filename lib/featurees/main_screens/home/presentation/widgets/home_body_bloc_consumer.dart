import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';
import 'home_view_body.dart';

class HomeBodyBlocConsumer extends StatelessWidget {
  final String uid;
  const HomeBodyBlocConsumer({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state.loading,
          child: HomeViewBody(uid: uid),
        );
      },
    );
  }
}
