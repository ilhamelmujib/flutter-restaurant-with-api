import 'package:flutter/material.dart';
import 'package:flutter_restaurant/data/api/api_service.dart';
import 'package:flutter_restaurant/provider/restaurant_provider.dart';
import 'package:flutter_restaurant/ui/detail_page.dart';
import 'package:flutter_restaurant/ui/list_page.dart';
import 'package:provider/provider.dart';

import 'common/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
            ),
        textTheme: textTheme,
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: ChangeNotifierProvider<RestaurantProvider>(
        create: (_) => RestaurantProvider.list(apiService: ApiService()),
        child: const ListPage(),
      ),
      routes: {
        DetailPage.routeName: (context) =>
            ChangeNotifierProvider<RestaurantProvider>(
              create: (_) => RestaurantProvider.detail(
                  apiService: ApiService(),
                  id: ModalRoute.of(context)?.settings.arguments as String),
              child: const DetailPage(),
            ),
      },
    );
  }
}
