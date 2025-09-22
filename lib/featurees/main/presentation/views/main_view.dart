import 'package:appp/featurees/home/presentation/views/home_view.dart';
import 'package:appp/featurees/profile/presentation/views/profile_view.dart';
import 'package:appp/utils/app_colors.dart';
import 'package:appp/utils/app_images.dart';
import 'package:appp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = "mainview";

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;

  // الصفحات الرئيسية
  final List<Widget> _pages = [
    HomeView(),
    Center(child: Container(child: Text('favourite'))),
    Center(child: Container(child: Text('cart'))),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // لتثبيت الأيقونات
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        selectedLabelStyle: AppStyles.styleExtraBold12.copyWith(fontSize: 14),
        unselectedLabelStyle: AppStyles.styleExtraBold12,
        backgroundColor: Colors.white,

        selectedItemColor: AppColors.bgBrownLight, // لون العنصر المحدد
        unselectedItemColor: Colors.grey, // لون العناصر الغير محددة
        showUnselectedLabels: true, // إظهار أسماء جميع الأيقونات
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              SvgImages.imagesprofile,
              height: 26,
              width: 26,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
