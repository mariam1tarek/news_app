import 'package:flutter/material.dart';
import 'package:news_app/enums/category_enums.dart';
import 'package:timeago/timeago.dart' as timeago;

class AppStrings {
  AppStrings._();

  static void init() {
    timeago.setLocaleMessages('ar', timeago.ArMessages());
  }

  static const Map<String, Map<String, String>> _values = {
    'en': {
      'home': 'Home',
      'greeting': 'Good Morning\nHere is Some News For You.',
      'view_all': 'View All',
      'by': 'By',
      'unknown_author': 'Unknown Author',
      'news_details': 'News Details',
      'national_headlines':
          'National headlines from {source} - Catch up on developing stories.',
      'no_content': 'No additional content available.',
      'no_details': 'No details available',
      'view_full': 'View Full Article',
      'no_data': 'No data found',
      'no_articles': 'No articles found',
      'refresh': 'Refresh',
      'search': 'Search',
      'no_results': 'No results found',
      'app_name': 'News App',
      'go_home': 'Go To Home',
      'theme': 'Theme',
      'dark': 'Dark',
      'light': 'Light',
      'language': 'Language',
      'cat_general': 'General',
      'cat_business': 'Business',
      'cat_sports': 'Sports',
      'cat_technology': 'Technology',
      'cat_entertainment': 'Entertainment',
      'cat_health': 'Health',
      'cat_science': 'Science',
    },
    'ar': {
      'home': 'الرئيسية',
      'greeting': 'صباح الخير\nإليك بعض الأخبار.',
      'view_all': 'عرض الكل',
      'by': 'بواسطة',
      'unknown_author': 'كاتب غير معروف',
      'news_details': 'تفاصيل الخبر',
      'national_headlines': 'أهم العناوين من {source} - تابع آخر التطورات.',
      'no_content': 'لا يوجد محتوى إضافي.',
      'no_details': 'لا توجد تفاصيل متاحة',
      'view_full': 'عرض المقال كاملاً',
      'no_data': 'لا توجد بيانات',
      'no_articles': 'لا توجد مقالات',
      'refresh': 'تحديث',
      'search': 'بحث',
      'no_results': 'لا توجد نتائج',
      'app_name': 'تطبيق الأخبار',
      'go_home': 'الذهاب للرئيسية',
      'theme': 'المظهر',
      'dark': 'داكن',
      'light': 'فاتح',
      'language': 'اللغة',
      'cat_general': 'عام',
      'cat_business': 'أعمال',
      'cat_sports': 'رياضة',
      'cat_technology': 'تكنولوجيا',
      'cat_entertainment': 'ترفيه',
      'cat_health': 'صحة',
      'cat_science': 'علوم',
    },
  };

  static String translate(
    String languageCode,
    String key, {
    Map<String, String>? args,
  }) {
    var text = _values[languageCode]?[key] ?? _values['en']![key] ?? key;
    args?.forEach((k, v) => text = text.replaceAll('{$k}', v));
    return text;
  }
}

extension AppLocalizationX on BuildContext {
  String get languageCode => Localizations.localeOf(this).languageCode;
  bool get isArabic => languageCode == 'ar';

  String tr(String key, {Map<String, String>? args}) =>
      AppStrings.translate(languageCode, key, args: args);

  String categoryName(CategoryEnums c) => tr('cat_${c.name.toLowerCase()}');

  String timeAgo(DateTime date) =>
      timeago.format(date, locale: isArabic ? 'ar' : 'en');
}
