
import 'package:chatgpt/providers/models_provider.dart';
import 'package:chatgpt/screens/signinpage.dart';
import 'package:chatgpt/theme/themedata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'providers/chats_provider.dart';
import 'screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ModelsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'AI-jurist',
        debugShowCheckedModeBanner: false,
        theme: Apptheme.lighttheme,
        darkTheme: Apptheme.darktheme,

        themeMode: ThemeMode.system,
        home:  StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ChatScreen();
            } else {
              return signin();
            }
          },
        )
      ),
    );
  }
}
