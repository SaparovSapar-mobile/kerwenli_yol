import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kerwenli_yol/pages/parts/internet_status_bar/parts/internet_status_bar_container.dart';
import 'package:kerwenli_yol/providers/parts/internet.dart';

class InternetStatusBar extends ConsumerStatefulWidget {
  const InternetStatusBar({super.key});

  @override
  ConsumerState<InternetStatusBar> createState() => _InternetStatusBarState();
}

class _InternetStatusBarState extends ConsumerState<InternetStatusBar> {
  bool? _lastOnline;
  bool _showBackOnline = false;
  Timer? _timer;
  ProviderSubscription<bool>? _sub;

  @override
  void initState() {
    super.initState();

    // 🔥 internet durumunu dinle
    _sub = ref.listenManual<bool>(isOnlineProvider, (prev, next) {
      // ilk değer
      if (_lastOnline == null) {
        _lastOnline = next;
        return;
      }

      // offline → online geçişi
      if (_lastOnline == false && next == true) {
        _timer?.cancel();
        if (mounted) setState(() => _showBackOnline = true);

        _timer = Timer(const Duration(seconds: 2), () {
          if (mounted) setState(() => _showBackOnline = false);
        });
      }

      _lastOnline = next;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _sub?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOnline = ref.watch(isOnlineProvider);

    if (!isOnline) {
      return InternetStatusBarContainer(
        isOnline: false,
        icon: Icons.wifi_off,
        text: 'Internet nasazlygy',
      );
    }

    if (_showBackOnline) {
      return InternetStatusBarContainer(
        isOnline: true,
        icon: Icons.wifi,
        text: 'Internet baglandy',
      );
    }

    // Normal durumda görünmesin
    return const SizedBox.shrink();
  }
}
