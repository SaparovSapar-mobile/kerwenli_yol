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

  SearchModel({
    required this.products,
    required this.companies,
    required this.news,
    required this.marks,
    required this.media,
  });

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
          : companiesData
                .map((e) => CompanyModel.fromJson(e as Map<String, dynamic>))
                .toList(),
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
