import 'package:biblia_app/repository/brit_jadasha_repository.dart';
import 'package:biblia_app/repository/glosario_repository.dart';
import 'package:biblia_app/repository/glosario_two_respository.dart';
import 'package:biblia_app/repository/tanaj_repository.dart';
import 'package:biblia_app/ui/brit_jadasha/cubit/brit_jadasha_cubit.dart';
import 'package:biblia_app/ui/global_book/cubit/font_cubit.dart';
import 'package:biblia_app/ui/global_book/cubit/theme_cubit.dart';
import 'package:biblia_app/ui/glosario/cubit/glosario_cubit.dart';
import 'package:biblia_app/ui/glosario_two/cubit/glosario_two_cubit.dart';
import 'package:biblia_app/ui/tanaj/cubit/tanaj_cubit.dart';
import 'package:biblia_app/ui/global_book/cubit/global_book_cubit.dart';
import 'package:biblia_app/ui/router_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;
  double fontSize = prefs.getDouble('fontSize') ?? 1.0;
  runApp(MyApp(isDarkMode: isDarkMode, fontSize: fontSize));
}

class MyApp extends StatelessWidget {
  final bool isDarkMode;
  final double fontSize;
  const MyApp({super.key, required this.isDarkMode, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NuevoGlosarioCubit(NuevoGlosarioRepository())..loadNuevoGlosario()),
        BlocProvider(lazy: false, create: (context) => GlosarioCubit(GlosarioRepository())..loadGlosario()),
        BlocProvider<FontSizeCubit>(create: (context) => FontSizeCubit()..updateFontSize(fontSize)),
        BlocProvider(lazy: false, create: (_) => ThemeCubit()..toggleTheme(isDarkMode)),
        BlocProvider(lazy: false, create: (context) => BritJadashaCubit(BritJadashaRepository())..localBrit()),
        BlocProvider(lazy: false, create: (context) => TanajCubit(TanajRepository())..localTanaj()),
        BlocProvider(create: (context) => GlobalBookCubit()),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, theme) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: theme,
              routerConfig: router,
              title: 'Biblia App',
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: fontSize),
                  child: child!,
                );
              },
            );
          },
        );
      }),
    );
  }
}
