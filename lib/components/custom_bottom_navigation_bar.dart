import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../stores/landing_page_screen/landing_page_store.dart';
import '../utils/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final _dataForCustomNavBar = context.read<LandingPageStore>();
    return Container(
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: const BoxDecoration(
        color: AppColors.btmNvgColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          4,
          (index) {
            return Observer(
              builder: (_) {
                return GestureDetector(
                  onTap: () => _dataForCustomNavBar.selectedIndex = index,
                  child: SvgPicture.asset(
                    _dataForCustomNavBar.navBarIcons[index],
                    height: index == 1 ? 50 : 43,
                    colorFilter: ColorFilter.mode(
                      _dataForCustomNavBar.selectedIndex == index
                          ? AppColors.primaryColor
                          : AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
