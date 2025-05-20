
import 'package:news_app_cubit_mvvm/utils/app_asset.dart';

class MyCategory {
  String id;
  String title;
  String image;
  MyCategory({required this.id, required this.title, required this.image});

  /// business entertainment general health science sport technology
  static List<MyCategory> getCatogryList({required bool isDark}) {
    return [
      MyCategory(
        id: 'general',
        title: "General",
        image: isDark ? AppAsset.genral_dark : AppAsset.genral_light,
      ),
      MyCategory(
        id: 'business',
        title: "Business",
        image: isDark ? AppAsset.business_dark : AppAsset.business_light,
      ),
      MyCategory(
        id: 'sports',
        title: "Sports",
        image: isDark ? AppAsset.sports_dark : AppAsset.sports_light,
      ),
      MyCategory(
        id: 'technology',
        title: "Technology",
        image: isDark ? AppAsset.technology_dark : AppAsset.technology_light,
      ),
      MyCategory(
        id: 'entertainment',
        title: "Entertainment",
        image:
            isDark ? AppAsset.entertianment_dark : AppAsset.entertianment_light,
      ),
      MyCategory(
        id: 'health',
        title: "Health",
        image: isDark ? AppAsset.health_dark : AppAsset.health_light,
      ),
      MyCategory(
        id: 'science',
        title: "Science",
        image: isDark ? AppAsset.science_dark : AppAsset.science_light,
      ),
    ];
  }
}
