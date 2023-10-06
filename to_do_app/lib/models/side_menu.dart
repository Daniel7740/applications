class SideMenuElement {
  final String title, src, src_2;

  SideMenuElement(
      {required this.src, required this.src_2, required this.title});
}

List<SideMenuElement> sideMenus = [
  SideMenuElement(
      src: 'assets/icons/home.png',
      title: 'Home',
      src_2: 'assets/icons/home_white.png'),
  SideMenuElement(
      src: 'assets/icons/theme.png',
      title: 'Theme',
      src_2: 'assets/icons/theme_white.png'),
  SideMenuElement(
      src: 'assets/icons/language.png',
      title: 'Language',
      src_2: 'assets/icons/language_white.png'),
];

List<SideMenuElement> sideMenus2 = [
  SideMenuElement(
      src: 'assets/icons/about.png',
      title: 'About App',
      src_2: 'assets/icons/about_white.png'),
];
