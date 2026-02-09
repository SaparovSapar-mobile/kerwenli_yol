import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

    // ❌ İnternet yoksa (sürekli)
    if (!isOnline) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6),
        color: Colors.red.withValues(alpha: 0.92),
        child: const Text(
          'İnternet bağlantısı yok',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    // ✅ İnternet geri geldiyse (2 saniye)
    if (_showBackOnline) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6),
        color: Colors.green.withValues(alpha: 0.92),
        child: const Text(
          'İnternet bağlantısı geri geldi',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    // Normal durumda görünmesin
    return const SizedBox.shrink();
  }
}
