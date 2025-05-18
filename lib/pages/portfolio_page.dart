import 'package:flutter/material.dart';
import 'package:flutter_asssesment/widgets/card.dart';
import 'package:flutter_asssesment/widgets/search_bar.dart';
import 'package:flutter_asssesment/widgets/svg_icon.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_asssesment/theme/color_palette.dart';

class Item {
  final String title;
  final String image;

  Item({
    required this.title,
    required this.image,
  });
}

final items = [
  Item(
      title: 'Kemampuan Merangkum Tulisan123',
      image: 'assets/images/photo0.jpg'),
  Item(
      title: 'Kemampuan Merangkum Tulisan230',
      image: 'assets/images/photo1.jpg'),
  Item(
      title: 'Kemampuan Merangkum Tulisan349',
      image: 'assets/images/photo2.jpg'),
  Item(
      title: 'Kemampuan Merangkum Tulisan458',
      image: 'assets/images/photo3.jpg'),
  Item(
      title: 'Kemampuan Merangkum Tulisan567',
      image: 'assets/images/photo4.jpg'),
];

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    super.key,
    required this.tabController,
  });
  final TabController tabController;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        ListView(
          children: [
            SearchBarWidget(
              controller: searchController,
              onChanged: (t) {
                setState(() {});
              },
            ),
            ...items
                .where(
              (i) => i.title.contains(searchController.text),
            )
                .map(
              (item) {
                return cardWidget(
                  imageText: item.image,
                  title: item.title,
                );
              },
            ),
          ],
        ),
        Placeholder(),
        Placeholder(),
        Placeholder(),
      ],
    );
  }
}

Widget tabBarText({required String text}) {
  return SizedBox(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: 'Roboto',
      ),
    ),
  );
}

portfolioAppBar(TabController controller) {
  return AppBar(
    title: Text(
      'Portofolio',
      style: TextStyle(
        fontSize: 18.sp,
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: ColorPallete.backgroundColor,
    centerTitle: false,
    actionsPadding: EdgeInsets.only(
      right: 16.w,
    ),
    actions: [
      svgIcon(svgText: 'assets/icons/shopping-bag.svg'),
      SizedBox(
        width: 16.w,
      ),
      svgIcon(svgText: 'assets/icons/notification.svg'),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(32.h),
      child: Container(
        alignment: Alignment.centerLeft,
        child: TabBar(
          controller: controller,
          labelColor: ColorPallete.mainColor,
          unselectedLabelColor: ColorPallete.blackColor,
          indicatorColor: ColorPallete.mainColor,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          tabs: [
            Tab(
              child: tabBarText(text: 'Project'),
            ),
            Tab(
              child: tabBarText(text: 'Saved'),
            ),
            Tab(
              child: tabBarText(text: 'Shared'),
            ),
            Tab(
              child: tabBarText(text: 'Achievment'),
            ),
          ],
        ),
      ),
    ),
  );
}
