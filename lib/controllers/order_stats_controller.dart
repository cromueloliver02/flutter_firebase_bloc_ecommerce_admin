import 'package:flutter_firebase_bloc_ecommerce_admin/models/models.dart';
import 'package:get/get.dart';

import '../services/database_service.dart';

class OrderStatsController extends GetxController {
  final DatabaseService database = DatabaseService();

  final stats = Future.value(<OrderStats>[]).obs;

  @override
  void onInit() {
    stats.value = database.getOrderStats();
    super.onInit();
  }
}
