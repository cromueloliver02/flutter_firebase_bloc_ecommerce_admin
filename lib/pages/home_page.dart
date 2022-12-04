import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:charts_flutter_new/flutter.dart' as chart;
// import 'package:intl/intl.dart';

import '../models/models.dart';
import '../controllers/controllers.dart';
import '../pages/pages.dart';

class HomePage extends StatelessWidget {
  static const id = '/home';

  HomePage({super.key});

  final OrderStatsController orderStatsController =
      Get.put(OrderStatsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ecommerce Admin App'),
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder(
              future: orderStatsController.stats.value,
              builder: (ctx, snapshot) {
                if (snapshot.hasError) {
                  return const SizedBox(
                    height: 150,
                    child: Center(child: Text('Something went wrong')),
                  );
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }

                return SizedBox(
                  height: 250,
                  child: CustomBarChart(orderStats: snapshot.data!),
                );
              },
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => Get.to(() => ProductPage()),
                child: const Card(
                  child: Center(child: Text('Go to Products')),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                onTap: () => Get.to(() => OrdersPage()),
                child: const Card(
                  child: Center(child: Text('Go to Orders')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomBarChart extends StatelessWidget {
  const CustomBarChart({
    Key? key,
    required this.orderStats,
  }) : super(key: key);

  final List<OrderStats> orderStats;

  @override
  Widget build(BuildContext context) {
    List<chart.Series<OrderStats, String>> series = [
      chart.Series(
        id: 'orders',
        data: orderStats,
        domainFn: (series, _) => series.index.toString(),
        // domainFn: (series, _) => DateFormat.d().format(series.dateTime).toString(),
        measureFn: (series, _) => series.orders,
        colorFn: (series, _) => series.barColor!,
      ),
    ];

    return chart.BarChart(series, animate: true);
  }
}
