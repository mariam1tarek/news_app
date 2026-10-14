import 'package:news_app/gen/assets.gen.dart';
enum CategoryEnums {
  General,
  Business,
  Sports,
  Technology,
  Entertainment,
  Health,
  Science;

  String get getImage {
    switch (this) {
      case CategoryEnums.General:
        return Assets.images.general.path;

      case CategoryEnums.Business:
        return Assets.images.busniess.path;

      case CategoryEnums.Sports:
        return Assets.images.sport.path;

      case CategoryEnums.Technology:
        return Assets.images.technology.path;

      case CategoryEnums.Entertainment:
        return Assets.images.entertainment.path;

      case CategoryEnums.Health:
        return Assets.images.helth.path;

      case CategoryEnums.Science:
        return Assets.images.science.path;
    }
  }
}