import 'package:frontend_mobile/providers/fertilizer_provider.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/Fertilizer/sample_home.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Fertilizers()),
        ChangeNotifierProvider.value(value: Fertilizer('', '', '', '', '')),
      ],
      child: Consumer<Fertilizers>(
        builder: (ctx, authData, _) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'My Store',
          theme: ThemeData(
            primarySwatch: Colors.amber,
          ),
          // TODO:Remove below line
          home: const SampleHomeScreen(),
          // TODO:Uncomment below lines
          // initialRoute: Login.routeName,
          // routes: {
          //   AddFlower.routeName: (context) => const AddFlower(),
          //   Login.routeName: (context) => const Login(),
          //   Signup.routeName: (context) => const Signup(),
          //   Welcome.routeName: (context) => const Welcome(),
          //   ViewFlowers.routeName: (context) => const ViewFlowers(),
          //   DiseaseView.routeName: (context) => const DiseaseView(),
          //   DiseaseAdd.routeName: (context) => const DiseaseAdd()
          // },
        ),
      ),
    );
  }
}
