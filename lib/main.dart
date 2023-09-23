import 'package:Intersect/screens/Welcome/Welcome.dart';
import 'package:Intersect/screens/intermediate_screen/intermediate_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'theme_provider/app_theme.dart';
import 'package:provider/provider.dart';
import 'theme_provider/theme_provider_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Utils.backendUrl);

    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {

        return MaterialApp(
          title: 'Intersect',
          // darkTheme: MyThemes.darkTheme,
          theme: appPrimaryTheme(),
          debugShowCheckedModeBanner: false,
          // themeMode: themeProvider.themeMode,
          localizationsDelegates: const [
            FormBuilderLocalizations.delegate,
          ],
          home: WelcomePage(),
          //home:IntermediateScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
