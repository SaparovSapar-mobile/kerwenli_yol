import 'package:kerwenli_yol/models/company.dart';
import 'package:kerwenli_yol/models/mark.dart';
import 'package:kerwenli_yol/models/media.dart';
import 'package:kerwenli_yol/models/news_model.dart';
import 'package:kerwenli_yol/models/product.dart';

class SearchModel {
  final List<ProductModel> products;
  final List<CompanyModel> companies;
  final List<NewsModel> news;
  final List<MarkModel> marks;
  final List<MediaModel> media;
  final String query;

  SearchModel({
    required this.products,
    required this.companies,
    required this.news,
    required this.marks,
    required this.media,
    this.query = '',
  });

  factory SearchModel.fromVisualJson(Map<String, dynamic> json) {
    final List<dynamic>? productsData = json['products'] as List?;
    final List<dynamic>? companiesData = json['companies'] as List?;

    return SearchModel(
      query: json['query'] as String? ?? '',
      products: productsData == null || productsData.isEmpty
          ? []
          : productsData.map((e) {
              final Map<String, dynamic> raw = e as Map<String, dynamic>;
              // Visual-search отдаёт товары плоско и без счётчиков:
              // нет views_count, likes_count, is_liked, category_name,
              // а имя компании разложено на company_name_tm/ru/en/tr.
              // Собираем company_name обратно в объект, счётчики
              // дотягиваются в visualSearchProvider по uuid.
              return ProductModel.fromJson({
                ...raw,
                'company_name':
                    raw['company_name'] ??
                    {
                      'tm': raw['company_name_tm'] ?? '',
                      'ru': raw['company_name_ru'] ?? '',
                      'en': raw['company_name_en'] ?? '',
                      'tr': raw['company_name_tr'] ?? '',
                    },
              });
            }).toList(),
      companies: companiesData == null || companiesData.isEmpty
          ? []
          : companiesData.map((e) {
              final Map<String, dynamic> raw = e as Map<String, dynamic>;
              // Конвертируем плоскую структуру в ту что ждёт CompanyModel.fromJson
              return CompanyModel.fromJson({
                'uuid': raw['uuid'],
                'individual_uuid': raw['individual_uuid'] ?? raw['uuid'],
                'photo': raw['logo_img'], // logo_img -> photo
                'name_tm': raw['business_name_tm'],
                'name_ru': raw['business_name_ru'],
                'name_en': raw['business_name_en'],
                'category_name': {
                  'tm': raw['category_name_tm'],
                  'ru': raw['category_name_ru'],
                  'en': raw['category_name_en'],
                  'tr': raw['category_name_tr'],
                },
                'views_count': raw['views_count'] ?? 0,
                'is_followed': raw['is_followed'] ?? false,
                'is_bookmarked': raw['is_bookmarked'] ?? false,
                'average_rating': raw['average_rating'] ?? 0,
                'ratings_count': raw['ratings_count'] ?? 0,
                'working_time': raw['working_time'],
              });
            }).toList(),
      news: [],
      marks: [],
      media: [],
    );
  }

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? productsData = json['products']?['data'] as List?;
    final List<dynamic>? companiesData = json['companies']?['data'] as List?;
    final List<dynamic>? newsData = json['news']?['data'] as List?;
    final List<dynamic>? marksData = json['marks']?['data'] as List?;
    final List<dynamic>? mediaData = json['media']?['data'] as List?;

    return SearchModel(
      products: productsData == null || productsData.isEmpty
          ? []
          : productsData
                .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      companies: companiesData == null || companiesData.isEmpty
          ? []
          : companiesData.map((e) {
              final Map<String, dynamic> raw = e as Map<String, dynamic>;
              final Map<String, dynamic>? businessName =
                  raw['business_name'] as Map<String, dynamic>?;
              final Map<String, dynamic>? mainInfo =
                  raw['main_info'] as Map<String, dynamic>?;

              return CompanyModel.fromJson({
                'uuid': raw['uuid'],
                'individual_uuid': raw['individual_uuid'] ?? raw['uuid'],
                'photo': raw['logo_img'], // если есть main_info
                'name_tm': businessName?['tm'] ?? '',
                'name_ru': businessName?['ru'] ?? '',
                'name_en': businessName?['en'] ?? '',
                'category_name': raw['category_name'],
                'views_count': raw['views_count'] ?? raw['viewsCount'] ?? 0,
                'is_followed': raw['is_followed'] ?? false,
                'is_bookmarked': raw['is_bookmarked'] ?? false,
                'average_rating': raw['average_rating'] ?? 0,
                'ratings_count': raw['ratings_count'] ?? 0,
                // ✅ working_time теперь пробрасывается в CompanyModel,
                // иначе статус "Açyk/Ýapyk" в поиске всегда был пустым
                'working_time': raw['working_time'],
                'subcategory_names': raw['subcategory_names'],
              });
            }).toList(),
      news: newsData == null || newsData.isEmpty
          ? []
          : newsData
                .map((e) => NewsModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      marks: marksData == null || marksData.isEmpty
          ? []
          : marksData
                .map((e) => MarkModel.fromJson(e as Map<String, dynamic>))
                .toList(),
      media: mediaData == null || mediaData.isEmpty
          ? []
          : mediaData
                .map((e) => MediaModel.fromJson(e as Map<String, dynamic>))
                .toList(),
    );
  }

  factory SearchModel.defaultValue() {
    return SearchModel(
      products: [],
      companies: [],
      news: [],
      marks: [],
      media: [],
    );
  }
}
