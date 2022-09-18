import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_folderstructure/utils/routes/routes.dart';
import 'package:provider_folderstructure/view/auth_view_model.dart';
import 'package:provider_folderstructure/view/home_screen.dart';

import 'utils/routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewModel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.login,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
