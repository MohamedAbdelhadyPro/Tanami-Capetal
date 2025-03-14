import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/widgets/image_widget.dart';
import 'package:tanami_capital_task/features/dashboard_feature/presentation/dashboard_page.dart';

import '../../../app_core/style/colors/colors.dart';
import '../../../app_core/style/images/assets.gen.dart';
import '../../market_feature/presentation/market_page.dart';
import '../../profile_feature/presentation/profile_page.dart';
import 'components/HomeCustomScaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  final List<Widget> _children = [
    DashboardPage(),
    MarketPage(),
    HomeCustomScaffold(body: Center(child: Text("History"))),
    HomeCustomScaffold(body: Center(child: Text("Portfolio"))),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        elevation: 1,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.black,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: ImageWidget(Assets.images.dashboard.path, height: 22),
            ),
            label: context.tr.dashboard,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: ImageWidget(Assets.images.shoppingCart.path, height: 22),
            ),
            label: context.tr.market,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: ImageWidget(Assets.images.history.path, height: 22),
            ),
            label: context.tr.history,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: ImageWidget(Assets.images.pieChart.path, height: 22),
            ),
            label: context.tr.portfolio,
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(bottom: 6.0),
              child: ImageWidget(Assets.images.profile.path, height: 22),
            ),
            label: context.tr.profile,
          ),
        ],
      ),
      body: _children[pageIndex],
    );
  }
}
