import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/src/model/colors.dart';
import 'package:myapp/src/view/allergy_page.dart';
import 'package:myapp/src/view/first_page.dart';
import 'package:myapp/src/view/login_page.dart';
import 'package:myapp/src/view/meal_control_page.dart';
import 'package:myapp/src/view/my_review.dart';
import 'package:myapp/src/view/notice_check_page.dart';
import 'package:myapp/src/view/notice_pass_page.dart';
import 'package:myapp/src/view/review_analysis_page.dart';
import 'package:myapp/src/view/troop_select_page.dart';
import 'package:myapp/src/view/suggestion_check_page.dart';
import 'package:myapp/src/view/suggestion_complain_page.dart';
import 'src/app.dart';
import 'src/binding/init_binding.dart';

void main() {
  runApp(const MyAPP());
}

class MyAPP extends StatelessWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: CustomColor.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: CustomColor.orangeColor,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/troopSelect',
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: '/', page: () => const App()),
        GetPage(name: '/first', page: () => FirstPage()),
        GetPage(name: '/login', page: () => const LoginPage()),
        GetPage(name: '/allergy', page: () => AllergyPage()),
        GetPage(name: '/suggestComplain', page: () => SuggestionComplainPage()),
        GetPage(name: '/noticeCheck', page: () => NoticeCheckPage()),
        GetPage(name: '/myReview', page: () => MyReviewPage()),
        GetPage(name: '/suggestCheck', page: () => SuggestionCheckPage()),
        GetPage(name: '/noticePass', page: () => NoticePassPage()),
        GetPage(name: '/reviewAnalysis', page: () => ReviewAnalysisPage()),
        GetPage(name: '/mealControl', page: () => MealControlPage()),
        GetPage(name: '/troopSelect', page: () => TroopSelectPage()),
      ],
    );
  }
}
