import 'package:flutter/material.dart';
import 'package:my_app/_Utils/env.dart';
import 'package:my_app/pages/Dashboard.dart';
import 'package:my_app/pages/account.dart';
import 'package:my_app/pages/productAdmin.dart';
import 'package:my_app/pages/transaction.dart';

class NavigationBottomAdmin extends StatefulWidget {
  const NavigationBottomAdmin({super.key});

  @override
  State<NavigationBottomAdmin> createState() => _NavigationBottomAdmin();
}

class _NavigationBottomAdmin extends State<NavigationBottomAdmin> {
  int _selectedIndex = Environment.getSelectedIndexNavigationBottom();

  var destinationAttribute = [
    {
      "tooltip": 'Home',
      "icon": Icon(Icons.home),
      "selectedIcon": Icon(
        Icons.home_filled,
        color: Colors.blueAccent.shade700,
      ),
      "label": 'Home',
    },
    {
      "tooltip": 'Manage Products',
      "icon": Icon(Icons.production_quantity_limits),
      "selectedIcon": Icon(
        Icons.production_quantity_limits,
        color: Colors.blueAccent.shade700,
      ),
      "label": 'Products',
    },
    {
      "tooltip": 'Manage Transaction',
      "icon": Icon(Icons.list_alt),
      "selectedIcon": Icon(
        Icons.list_alt_outlined,
        color: Colors.blueAccent.shade700,
      ),
      "label": 'Transaction',
    },
    {
      "tooltip": 'Manage Accounts',
      "icon": Icon(Icons.account_circle),
      "selectedIcon": Icon(
        Icons.account_circle_outlined,
        color: Colors.blueAccent.shade700,
      ),
      "label": 'Account',
    },
  ];

  var pages = [Dashboard(), ProductAdmin(), Transaction(), Account()];

  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: _selectedIndex,
      onDestinationSelected: (int index) {
        if (index == _selectedIndex) return;
        setState(() {
          Environment.setSelectedIndexNavigationBottom(index);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pages[index]),
          );
        });
      },
      destinations: [
        ...destinationAttribute.map(
          (value) => NavigationDestination(
            icon: value['icon'] as Icon,
            label: value['label'] as String,
            selectedIcon: value['selectedIcon'] as Icon,
            tooltip: value['tooltip'] as String,
          ),
        ),
      ],
    );
  }
}
