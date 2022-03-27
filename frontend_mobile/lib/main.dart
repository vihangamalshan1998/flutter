import 'package:frontend_mobile/providers/fertilizer_provider.dart';
import 'package:frontend_mobile/screens/Fertilizer/add_edit_fertilizer_screen.dart';
import 'package:flutter/material.dart';
import 'package:frontend_mobile/screens/Fertilizer/fertilizers_screen.dart';
import 'package:frontend_mobile/screens/Fertilizer/sample_home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Fertilizers(),
      child: MaterialApp(
        title: 'Mal Mal Kade',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        initialRoute: SampleHomeScreen.routeName,
        routes: {
          SampleHomeScreen.routeName: (context) => const SampleHomeScreen(),
          AddEditFertilizerScreen.routeName: (context) =>
              const AddEditFertilizerScreen(),
          FertilizersScreen.routeName: (context) => const FertilizersScreen(),
        },
      ),
    );
  }
}
