import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';

class MainNavigationShell extends ConsumerStatefulWidget {
  const MainNavigationShell({super.key, required this.child, required this.currentIndex});

  final Widget child;
  final int currentIndex;

  @override
  ConsumerState createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends ConsumerState<MainNavigationShell> {

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/saved');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColors.whiteColor,
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                    widget.currentIndex == 0 ? Icons.home : Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  widget.currentIndex == 1 ? Icons.bookmark : Icons.bookmark_outline,
                ),
                label: 'Saved',
              ),
            ]
        ),
      ),
    );
  }
}
