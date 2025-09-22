import 'package:flutter/material.dart';

import '../widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = "profileview";

  @override
  Widget build(BuildContext context) {
    return ProfileViewBody();
  }
}
