import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_asssesment/theme/color_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'other_pages.dart';
import 'portfolio_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _bottomTabController;
  late TabController _portofilioTabController;

  late List<PreferredSizeWidget?> _appBars;

  @override
  void initState() {
    super.initState();
    _bottomTabController = TabController(length: 4, vsync: this);
    _portofilioTabController = TabController(length: 4, vsync: this);
    _appBars = [
      null,
      portfolioAppBar(_portofilioTabController),
      null,
      null,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.backgroundColor,
      appBar: _appBars[_bottomTabController.index],
      body: TabBarView(
        controller: _bottomTabController,
        children: [
          HomePage(),
          PortfolioPage(
            tabController: _portofilioTabController,
          ),
          InputPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        height: 60.h,
        decoration: BoxDecoration(
          color: ColorPallete.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(48, 48, 48, 0.1),
              offset: Offset(0, -3.h),
              blurRadius: 6.r,
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              20.r,
            ),
          ),
        ),
        child: TabBar(
          onTap: (_) {
            setState(() {});
          },
          controller: _bottomTabController,
          labelColor: ColorPallete.mainColor,
          unselectedLabelColor: ColorPallete.unselectedNavBar,
          indicatorPadding: EdgeInsets.only(
            top: 3.h,
          ),
          
          indicator: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: ColorPallete.mainColor,
                width: 2.sp,
              ),
            ),
          ),
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          tabs: [
            Tab(
              icon: navBarItem(
                'assets/icons/Home.svg',
                0,
              ),
              text: 'Home',
            ),
            Tab(
              icon: navBarItem(
                'assets/icons/Portfolia.svg',
                1,
              ),
              text: 'Portfolio',
            ),
            Tab(
              icon: navBarItem(
                'assets/icons/Input.svg',
                2,
              ),
              text: 'Input',
            ),
            Tab(
              icon: navBarItem(
                'assets/icons/Profile.svg',
                3,
              ),
              text: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget navBarItem(
    String iconText,
    int index,
  ) {
    return SvgPicture.asset(
      iconText,
      colorFilter: ColorFilter.mode(
        _bottomTabController.index == index
            ? ColorPallete.mainColor
            : ColorPallete.unselectedNavBar,
        BlendMode.srcIn,
      ),
    );
  }
}
