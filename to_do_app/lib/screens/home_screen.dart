import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isMenuOpen = false;

    void toggleMenu() {
      setState(() {
        isMenuOpen = !isMenuOpen;
      });
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: toggleMenu,
                    child: Image.asset(
                      isMenuOpen
                          ? 'assets/icons/close.png'
                          : 'assets/icons/menu.png',
                      scale: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/icons/search.png',
                      scale: 20,
                    ),
                  )
                ],
              ),
              const Spacer(
                flex: 1,
              ),
              const Text(
                'What\'s up, Danil!',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const Spacer(),
              Text('Categories'.toUpperCase()),
              const Spacer(),
              SingleChildScrollView(
                child: Container(
                  color: Colors.teal,
                  width: MediaQuery.sizeOf(context).height,
                  height: MediaQuery.sizeOf(context).height / 1.7,
                ),
              ),
              const Spacer(
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
