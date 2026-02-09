import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key, required this.ref, required this.apiProviders});

  final WidgetRef ref;
  final List<dynamic> apiProviders;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Result'),
          ElevatedButton(
            onPressed: () {
              for (var element in apiProviders) {
                ref.invalidate(element);
              }
            },
            child: Text('Reload'),
          ),
        ],
      ),
    );
  }
}
