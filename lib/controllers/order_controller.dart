import 'package:get/get.dart';

import '../models/models.dart';
import '../services/database_service.dart';

class OrderController extends GetxController {
  final DatabaseService database = DatabaseService();

  var orders = <Order>[].obs;
  var pendingOrders = <Order>[].obs;

  @override
  void onInit() {
    orders.bindStream(database.getOrders());
    pendingOrders.bindStream(database.getPendingOrders());
    super.onInit();
  }

  Future<void> updateOrder(Order order, String field, bool value) async {
    await database.updateOrder(order, field, value);
  }
}
