class AppConstants {

  AppConstants._();

  static const passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  static const emailRegex = '^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\$';

  ///Images View Screen Texts
  static const imageScreenTitle = "Pixel Art Images";
}