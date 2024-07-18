


import 'package:flutter/material.dart';
import 'package:frontend/data/remotes/articles/http_articles_impl.dart';
import 'package:frontend/data/repositories/articles/articles_repository_impl.dart';
import 'package:frontend/views/blocs/articles/articles_bloc.dart';
import 'package:frontend/views/pages/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (_) => ArticlesBloc(ArticlesRepositoryImpl(httpArticles: HttpArticlesImpl())),
    ),
  ],child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
       localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      supportedLocales: [
         Locale('es', ''), 
     
      ],
      home: HomePage()
    );
  }
}