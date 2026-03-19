import 'package:flutter/widgets.dart';
import 'package:kerwenli_yol/models/product.dart';
import 'package:kerwenli_yol/pages/parts/no_result.dart';

class SearchProducts extends StatelessWidget {
  const SearchProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final bool hasData = products.isNotEmpty;

    return hasData ? Center(child: Text('has data')) : NoResult();
  }
}
