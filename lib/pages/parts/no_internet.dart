import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/providers/parts/internet.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, required this.ref, required this.apiProviders});

  final WidgetRef ref;
  final List<dynamic> apiProviders;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Internet'),
          ElevatedButton(
            onPressed: () {
              ref.invalidate(checkInConnProvider);
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
