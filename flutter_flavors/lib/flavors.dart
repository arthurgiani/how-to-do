enum FlavorTypes { DEVELOPMENT, PRODUCTION }

class Flavor {
  Flavor._instance();

  static FlavorTypes flavorType;

  static String get flavorMessage {
    switch (flavorType) {
      case FlavorTypes.DEVELOPMENT:
        return "Development";
      case FlavorTypes.PRODUCTION:
        return "Production";
      default:
        return "Development";
    }
  }

  static String get baseUrl {
    switch (flavorType) {
      case FlavorTypes.DEVELOPMENT:
        return "www.fakeapi.com/dev";
      case FlavorTypes.PRODUCTION:
        return "www.fakeapi.com/prd";
      default:
        return "www.fakeapi.com/dev";
    }
  }
}

