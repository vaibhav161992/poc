class AppConsts {
  static const String appName = 'Lost and Found';
  static const double screenWidth = 360.0;
  static const double screenHeight = 690.0;
  static RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static const String appId = 'cd92e69c21d9e6a1553407da741ccf91';
  static const String baseURL = 'https://api.openweathermap.org/data/2.5/';
  static const String metric = 'metric';
  static const String forecastEndPoint = 'forecast';
}
