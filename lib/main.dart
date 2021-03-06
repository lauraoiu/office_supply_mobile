import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:office_supply_mobile_master/config/router.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/employee/dashboard/employee_dashboard.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/leader/dashboard/leader_dashboard.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/orderRequest/list_orderRequest.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/orderRequest/order_request_detail.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/period/list_period.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/period/period_form.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/provider/commonProvide.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/provider/companyProvide.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/provider/departmentProvide.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/provider/orderProvide.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/manager/provider/period_provide.dart';
import 'package:office_supply_mobile_master/pages/authenticated_users/profile.dart';
import 'package:office_supply_mobile_master/pages/guest/sign_in/sign_in.dart';
import 'package:office_supply_mobile_master/providers/cart.dart';
import 'package:office_supply_mobile_master/providers/sign_in.dart';
import 'package:office_supply_mobile_master/services/handler_background_message.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel',
//   'High Importance Channel',
//   importance: Importance.high,
//   playSound: true,
// );

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
          //child: const SignInPage(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DepartmentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CompanyProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PeriodProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CommonProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Sign In',
        initialRoute: mainRouter,
        routes: {
          mainRouter: (context) => const SignInPage(),
          employeeDashboardRouter: (context) => const EmployeeDashBoard(),
          leaderDashboardRouter: (context) => const LeaderDashBoard(),
          listPeriodRouter: (context) => const ListPeriod(),
          periodForm: (context) => const PeriodForm(),
          profile: (context) => const Profile(),
          listOrderRouter: (context) => const ListOrderRequest(),
          //orderRequestDetail: (context) => const OrderRequestDetail(),
        },
        theme: ThemeData(
          //primaryColor: ,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
