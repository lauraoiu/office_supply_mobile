import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:office_supply_mobile_master/config/paths.dart';
import 'package:office_supply_mobile_master/config/themes.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/employee/dashboard/employee_dashboard.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/employee/order_history/employee_order_history.dart';
import 'package:office_supply_mobile_master/providers/sign_in.dart';
import 'package:office_supply_mobile_master/services/period.dart';

class BottomNavigation extends StatelessWidget {
  final SignInProvider signInProvider;
  const BottomNavigation({
    Key? key,
    required this.signInProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 46,
      index: 2,
      color: primaryLightColor,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: primaryColor,
      onTap: (index) {
        reloadPeriod(signInProvider: signInProvider);

        switch (index) {
          case 0:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EmployeeDashBoard(),
              ),
            );
            break;
          case 1:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EmployeeDashBoard(),
              ),
            );
            break;
          case 2:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EmployeeDashBoard(),
              ),
            );
            break;
          case 3:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EmployeeOrderHistory(),
              ),
            );
            break;
          case 4:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const EmployeeDashBoard(),
              ),
            );
            break;
        }
      },
      items: [
        Image.asset(
          imagePath + infomationPNG,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
        Image.asset(
          imagePath + profilePNG,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
        Image.asset(
          imagePath + homePNG,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
        Image.asset(
          imagePath + recentPNG,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
        Image.asset(
          imagePath + settingPNG,
          height: 20,
          width: 20,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  reloadPeriod({required SignInProvider signInProvider}) async {
    signInProvider.period = await PeriodService.fetchPeriod(
        departmentId: signInProvider.department!.id,
        jwtToken: signInProvider.auth!.jwtToken);
  }
}
