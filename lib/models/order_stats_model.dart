import 'package:charts_flutter_new/flutter.dart' as chart;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class OrderStats extends Equatable {
  final DateTime dateTime;
  final int index;
  final int orders;
  chart.Color? barColor;

  OrderStats({
    required this.dateTime,
    required this.index,
    required this.orders,
    this.barColor,
  }) {
    barColor = chart.ColorUtil.fromDartColor(Colors.black);
  }

  @override
  List<Object?> get props => [dateTime, index, orders, barColor];

  @override
  String toString() {
    return 'OrderStats(dateTime: $dateTime, index: $index, orders: $orders, barColor: $barColor)';
  }

  factory OrderStats.fromDoc(DocumentSnapshot doc, int index) {
    final map = doc.data() as Map<String, dynamic>;

    return OrderStats(
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      index: index,
      orders: map['orders']?.toInt() ?? 0,
    );
  }

  static final List<OrderStats> data = [
    OrderStats(
      dateTime: DateTime.now(),
      index: 0,
      orders: 10,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 1,
      orders: 12,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 2,
      orders: 15,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 3,
      orders: 12,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 4,
      orders: 9,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 5,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 6,
      orders: 16,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 7,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 8,
      orders: 21,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 9,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 10,
      orders: 27,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 11,
      orders: 30,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 12,
      orders: 19,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 13,
      orders: 25,
    ),
    OrderStats(
      dateTime: DateTime.now(),
      index: 14,
      orders: 29,
    ),
  ];
}
