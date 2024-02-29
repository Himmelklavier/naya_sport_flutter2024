import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:naya_sport_sebas/ui/pages/screens/accessories_page.dart';
import 'package:naya_sport_sebas/ui/pages/screens/clients_page.dart';
import 'package:naya_sport_sebas/ui/pages/screens/contact_page.dart';
import 'package:naya_sport_sebas/ui/pages/screens/home_page.dart';
import 'package:naya_sport_sebas/ui/pages/screens/uniforms_page.dart';
import 'package:naya_sport_sebas/ui/providers/selected_screen_provider.dart';
import 'package:naya_sport_sebas/ui/widgets/naya_navigation_bar.dart';
import 'package:provider/provider.dart';

class NayaSportStore extends StatelessWidget {
  const NayaSportStore({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedScreenProvider = Provider.of<SelectedScreenProvider>(context);
    const String title = 'Naya Sport Store';
    final List<Widget> screens = [
      const HomeScreen(),
      const UniformsScreen(),
      const AccessoriesScreen(),
      const ClientsScreen(),
      const ContactScreen(),
    ];

    /* final List<NavigationDestination> destinations = [
      const NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
      const NavigationDestination(icon: Icon(Icons.shop), label: 'Uniformes'),
      const NavigationDestination(icon: Icon(Icons.shop), label: 'Accesorios'),
      const NavigationDestination(icon: Icon(Icons.shop), label: 'Clientes'),
      const NavigationDestination(icon: Icon(Icons.shop), label: 'Contacto'),
    ]; */

    final List<BottomNavigationBarItem> itemsNayaNavBar = [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.storefront),
        label: 'Uniformes',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.beach_access),
        label: 'Accesorios',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.person_2_outlined),
        label: 'Clientes',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.message_outlined),
        label: 'Contacto',
      ),
    ];

    return MaterialApp(
      title: 'Naya Sport Store',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SvgPicture.asset('assets/logo.svg'),
              const SizedBox(width: 10.0),
              const Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: screens[selectedScreenProvider.selectedIndex],
        bottomNavigationBar: NayaNavigationBar(
          items: itemsNayaNavBar,
          onItemSelected: (int index) {
            Provider.of<SelectedScreenProvider>(context, listen: false)
                .updateSelectedIndex(index);
          },
        ),
      ),
    );
  }
}
