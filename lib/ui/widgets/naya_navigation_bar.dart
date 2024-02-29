import 'package:flutter/material.dart';
import 'package:naya_sport_sebas/ui/providers/selected_screen_provider.dart';
import 'package:provider/provider.dart';

class NayaNavigationBar extends StatefulWidget {
  final List<BottomNavigationBarItem> items;
  final Function(int) onItemSelected;

  const NayaNavigationBar({
    super.key,
    required this.items,
    required this.onItemSelected,
  });

  @override
  State<NayaNavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NayaNavigationBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = Provider.of<SelectedScreenProvider>(context, listen: false)
        .selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      fixedColor: Colors.blueGrey,
      unselectedItemColor: Colors.grey,
      items: widget.items,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          widget.onItemSelected(index); // Notify provider
        });
      },
    );
  }
}
