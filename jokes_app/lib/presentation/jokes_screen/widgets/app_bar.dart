part of '../jokes_screen.dart';

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return AppBar(
      title: Text(
        'Jokes',
        style: Theme.of(context).textTheme.titleMedium,
      ),
      actions: [
        GestureDetector(
          onTap: () {
            // themeProvider.toggleLanguage();
          },
          child: SizedBox(
            width: 25,
            height: 25,
            child: Image.asset(
              // themeProvider.themeMode == ThemeMode.light
              'assets/icons/en.png',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            themeProvider.toggleTheme();
          },
          child: Image.asset(
            themeProvider.themeMode == ThemeMode.light
                ? 'assets/icons/sun.png'
                : 'assets/icons/moon.png',
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
