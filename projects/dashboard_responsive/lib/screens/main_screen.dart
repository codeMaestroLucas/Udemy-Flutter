import 'package:dashboard_responsive/util/responsive.dart';
import 'package:dashboard_responsive/widgets/dash_board_widget.dart';
import 'package:dashboard_responsive/widgets/side_menu_widget.dart';
import 'package:dashboard_responsive/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      drawer:
          !isDesktop
              ? const SizedBox(width: 250, child: SideMenuWidget())
              : null,
      endDrawer:
          Responsive.isMobile(context)
              ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const SummaryWidget(),
              )
              : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop) Expanded(flex: 2, child: SizedBox(child: SideMenuWidget())),
            Expanded(flex: 7, child: DashBordWidget()),
            if (isDesktop) Expanded(flex: 3, child: SummaryWidget()),
          ],
        ),
      ),
    );
  }
}
