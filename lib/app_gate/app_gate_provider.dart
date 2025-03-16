import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smartbin/app_gate/app_gate_enum.dart';

final appGateProvider = StateNotifierProvider<AppGateProvider, AppGateEnum>((ref) {
  return AppGateProvider();
});

class AppGateProvider extends StateNotifier<AppGateEnum> {
  AppGateProvider() : super(AppGateEnum.login);
  void updateAppGate(AppGateEnum appGate) {
    state = appGate;
  }
}
