import 'package:biblia_app/ui/extra_screen/intro_screen.dart';
import 'package:biblia_app/ui/extra_screen/pays_and_donation_screen.dart';
import 'package:biblia_app/ui/global_book/chapter_screen.dart';
import 'package:biblia_app/ui/glosario/glosario_screen.dart';
import 'package:biblia_app/ui/glosario_two/nuevo_glosario_screen.dart';
import 'package:biblia_app/ui/home/home_screen.dart';
import 'package:biblia_app/ui/extra_screen/social_media_screen.dart';
import 'package:go_router/go_router.dart';

// Pantallas
// import 'home_screen.dart';
// import 'profile_screen.dart';
// import 'settings_screen.dart';
// import 'tanaj_list_screen.dart';
// import 'book_detail_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: HomeScreen.path,
  routes: [
    GoRoute(path: IntroScreen.path, builder: (context, state) => IntroScreen()),
    GoRoute(path: HomeScreen.path, builder: (context, state) => const HomeScreen()),
    GoRoute(path: CollectionListScreen.path, builder: (context, state) => const CollectionListScreen()),
    GoRoute(path: BookDetailScreen.path, builder: (context, state) => BookDetailScreen()),
    GoRoute(path: ContactScreen.path, builder: (context, state) => ContactScreen()),
    GoRoute(path: GlosarioScreen.path, builder: (context, state) => const GlosarioScreen()),
    GoRoute(path: NuevoGlosarioScreen.path, builder: (context, state) => NuevoGlosarioScreen()),
    GoRoute(path: PaysAndDonations.path, builder: (context, state) => PaysAndDonations()),
  ],
);
