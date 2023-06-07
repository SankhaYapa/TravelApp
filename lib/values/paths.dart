class Paths {
  //assets path
  static const IMAGE_PATH = 'assets/images/';
  static const ICON_PATH = 'assets/icons/';

  //nav bar image path
  static const NAVBAR_ICON_PATH = 'assets/icons/bottomNavBarIcons/';

  //assets function
  static String imageAssets(img) => "$IMAGE_PATH$img";

  //assets nav bar function
  static String iconNavBaAssets(icn) => "$NAVBAR_ICON_PATH$icn";

  //icon assets function
  static String iconAssets(icn) => "$ICON_PATH$icn";
}
