import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '/utils/colors.dart';
import '../components/custom_bottom_navigation_bar.dart';
import '../stores/landing_page_screen/landing_page_store.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForLanding = context.read<LandingPageStore>();

    final PageStorageBucket bucket = PageStorageBucket();

    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      body: Observer(
        builder: (_) {
          return PageStorage(
            child: _dataForLanding.pages[_dataForLanding.selectedIndex],
            bucket: bucket,
          );
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
