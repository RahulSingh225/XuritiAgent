// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// import 'package:groupeii_app/helper/helper_function.dart';
// import 'package:groupeii_app/pages/auth/login_page.dart';
// import 'package:groupeii_app/pages/home_page.dart';
// import 'package:groupeii_app/shared/constants.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   if (kIsWeb) {
//     await Firebase.initializeApp(
//         options: FirebaseOptions(
//             apiKey: Constants.appKey,
//             appId: Constants.appId,
//             messagingSenderId: Constants.messingSenderId,
//             projectId: Constants.projectId));
//   } else {
//     await Firebase.initializeApp();
//   }
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool _isSignedIn = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getUserLoggedInStatus();
//   }

//   getUserLoggedInStatus() async {
//     await HelperFunctions.getUserLoggedInStatus().then((value) {
//       if (value != null) {
//         _isSignedIn = value;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primaryColor: Constants().primarycolor,
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: _isSignedIn ? const HomePage() : const LoginPage(),
//     );
//   }
// }

// import 'dart:io';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:in_app_update/in_app_update.dart';
// import 'package:provider/provider.dart';
// import 'package:xuriti/ui/push_notification/notification.dart';
// import 'package:xuriti/ui/routes/router.dart';
// import 'logic/view_models/auth_manager.dart';
// import 'logic/view_models/company_details_manager.dart';
// import 'logic/view_models/password_manager.dart';
// import 'logic/view_models/profile_manager.dart';
// import 'logic/view_models/reward_manager.dart';
// import 'logic/view_models/trans_history_manager.dart';
// import 'logic/view_models/transaction_manager.dart';
// import 'models/helper/service_locator.dart';
// import 'ui/routes/routnames.dart';
// import 'package:firebase_core/firebase_core.dart';

// Future multipleReg() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   await FirebaseMessaging.instance.subscribeToTopic('topic1');
//   FirebaseInitialization.sharedInstance.registerNotification();
//   FirebaseInitialization.sharedInstance.configLocalNotification();
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//   HttpOverrides.global = MyHttpOverrides();
//   await Firebase.initializeApp();
//   await setupServiceLocator();
// }

// void main() {
//   multipleReg();
//   // AppUpdateInfo info = await InAppUpdate.checkForUpdate();
//   // if (info.updateAvailability == UpdateAvailability.updateAvailable) {
//   //   await InAppUpdate.performImmediateUpdate();
//   // }

//   runApp(const MyApp());
// }

// // void main() async {
// //   WidgetsFlutterBinding.ensureInitialized();

// //   // await InAppUpdate.checkForUpdate().then((AppUpdateInfo info) async{
// //   //   await InAppUpdate.performImmediateUpdate();
// //   // });
// //   Firebase.initializeApp().then((value) {
// //     FirebaseInitialization.sharedInstance.registerNotification();
// //     FirebaseInitialization.sharedInstance.configLocalNotification();
// //   });

// //   // FirebaseInitialization.sharedInstance.registerNotification();
// //   // FirebaseInitialization.sharedInstance.configLocalNotification();
// // //FirebaseInitialization.sharedInstance.configLocalNotification();
// //   HttpOverrides.global = MyHttpOverrides();
// //   await Firebase.initializeApp();
// //   await setupServiceLocator();

// //   runApp(const MyApp());
// // }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//         designSize: const Size(393, 786),
//         minTextAdapt: true,
//         splitScreenMode: true,
//         builder: (context, child) {
//           return MultiProvider(
//             providers: [
//               ChangeNotifierProvider(create: (context) => getIt<AuthManager>()),
//               ChangeNotifierProvider(
//                   create: (context) => getIt<CompanyDetailsManager>()),
//               ChangeNotifierProvider(
//                   create: (context) => getIt<TransactionManager>()),
//               ChangeNotifierProvider(
//                   create: (context) => getIt<PasswordManager>()),
//               ChangeNotifierProvider(
//                   create: (context) => getIt<RewardManager>()),
//               ChangeNotifierProvider(
//                   create: (context) => getIt<ProfileManager>()),
//               ChangeNotifierProvider(
//                   create: (context) => getIt<TransHistoryManager>()),
//             ],
//             child: MaterialApp(
//                 debugShowCheckedModeBanner: false,
//                 onGenerateRoute: Routers.generateRoute,
//                 initialRoute: splash),
//           );
//         });
//   }
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

//import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:groupeii_app/helper/serice_locator.dart';
import 'package:groupeii_app/pages/auth/login_page.dart';
import 'package:groupeii_app/ui/addgstinfo_page.dart';
//import 'package:groupeii_app/pages/auth/login_page.dart';
import 'package:groupeii_app/ui/basicinfo_page.dart';
import 'package:groupeii_app/ui/dash_board.dart';
import 'package:groupeii_app/ui/gstsearch_page.dart';
//import 'package:groupeii_app/ui/dash_board.dart';
// import 'package:groupeii_app/ui/addmobile_pages.dart';
//import 'package:groupeii_app/ui/home_page.dart';
//import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsFlutterBinding.ensureInitialized();
  //SharedPreferences prefs = await SharedPreferences.getInstance();

// //FirebaseInitialization.sharedInstance.configLocalNotification();

  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp();
  await setupServiceLocator();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
