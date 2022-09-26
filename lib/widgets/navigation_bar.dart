import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cambios/tasa_cambios_page.dart';

class NavigationBarPrincipal extends StatefulWidget {
  const NavigationBarPrincipal({Key? key}) : super(key: key);

  @override
  State<NavigationBarPrincipal> createState() => _NavigationBarPrincipalState();
}

class _NavigationBarPrincipalState extends State<NavigationBarPrincipal> {
  int _selectedIndex = 1;

  final List<Widget> _widgetOptions = [
    Container(),
    const TasaCambiosPage(),
    Container(),
    Container(),
    Container()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Tasa de Cambios',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xffCEFF00).withOpacity(0),
                      const Color(0xffCEFF00),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(50)),
              child: const Icon(
                FontAwesomeIcons.user,
                color: Colors.black,
                size: 16,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedColor: const Color(0xff0073e6),
        unSelectedColor: const Color(0xffafafaf),
        iconSize: 18,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.house),
          ),
          CustomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.arrowTrendUp),
          ),
          CustomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.globe),
          ),
          CustomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.arrowRightArrowLeft),
          ),
          CustomNavigationBarItem(
            icon: const Icon(FontAwesomeIcons.arrowUpRightDots),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
