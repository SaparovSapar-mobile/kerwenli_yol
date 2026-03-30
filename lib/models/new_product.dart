import 'package:kerwenli_yol/models/category.dart';
import 'package:kerwenli_yol/models/product.dart';

class NewProductModel {
  final String id, companyId;
  final List<ProductModel> products;
  final CategoryModel category;

  NewProductModel({
    required this.id,
    required this.companyId,
    required this.products,
    required this.category,
  });

  factory NewProductModel.defaultValue() {
    return NewProductModel(
      id: '',
      companyId: '',
      products: [],
      category: CategoryModel.defaultValue(),
    );
  }

  factory NewProductModel.fromJson(Map<String, dynamic> json) {
    return NewProductModel(
      id: json['uuid'] ?? '',
      companyId: json['company_uuid'] ?? '',
      products: json['products'] == null || json['products'] == []
          ? []
          : List<ProductModel>.from(
              json['products'].map(
                (dataJson) => ProductModel.fromJson(dataJson),
              ),
            ),
      category: json['categories'] == null
          ? CategoryModel.defaultValue()
          : CategoryModel.fromJson(json['categories']),
    );
  }
}
