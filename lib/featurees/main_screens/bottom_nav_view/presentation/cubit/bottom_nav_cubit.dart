// lib/features/bottom_nav/presentation/cubit/bottom_nav_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void changeTab(int index) => emit(index);
}
