import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStateProvider<bool> mainPageOpenToTopProvider =
    StateProvider.autoDispose<bool>((ref) => false);

final AutoDisposeStateProvider<ScrollController> mainPageScrollCtrlProvider =
    StateProvider.autoDispose<ScrollController>((ref) {
      final controller = ScrollController();
      controller.addListener(() {
        if (controller.position.pixels > 1000) {
          ref.read(mainPageOpenToTopProvider.notifier).state = true;
        } else {
          ref.read(mainPageOpenToTopProvider.notifier).state = false;
        }
      });
      return controller;
    });
