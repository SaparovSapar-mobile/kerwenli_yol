import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AutoDisposeStreamProvider<List<ConnectivityResult>>
connectivityStreamProvider =
    StreamProvider.autoDispose<List<ConnectivityResult>>((ref) {
      final Connectivity connectivity = Connectivity();
      return connectivity.onConnectivityChanged;
    });

// ========= Check Online Internet Connection =======
final AutoDisposeProvider<bool> isOnlineProvider = Provider.autoDispose<bool>((
  ref,
) {
  final AsyncValue<List<ConnectivityResult>> asyncConn = ref.watch(
    connectivityStreamProvider,
  );

  return asyncConn.maybeWhen(
    data: (results) =>
        results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet),
    orElse: () => true,
  );
});
