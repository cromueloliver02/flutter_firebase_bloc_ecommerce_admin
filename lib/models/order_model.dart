import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final int customerId;
  final List<int> productIds;
  final double deliveryFee;
  final double subtotal;
  final double total;
  final bool isAccepted;
  final bool isDelivered;
  final bool isCancelled;
  final DateTime createdAt;

  const Order({
    required this.id,
    required this.customerId,
    required this.productIds,
    required this.deliveryFee,
    required this.subtotal,
    required this.total,
    required this.isAccepted,
    required this.isDelivered,
    required this.isCancelled,
    required this.createdAt,
  });

  Order copyWith({
    String? id,
    int? customerId,
    List<int>? productIds,
    double? deliveryFee,
    double? subtotal,
    double? total,
    bool? isAccepted,
    bool? isDelivered,
    bool? isCancelled,
    DateTime? createdAt,
  }) {
    return Order(
      id: id ?? this.id,
      customerId: customerId ?? this.customerId,
      productIds: productIds ?? this.productIds,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      subtotal: subtotal ?? this.subtotal,
      total: total ?? this.total,
      isAccepted: isAccepted ?? this.isAccepted,
      isDelivered: isDelivered ?? this.isDelivered,
      isCancelled: isCancelled ?? this.isCancelled,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'customerId': customerId});
    result.addAll({'productIds': productIds});
    result.addAll({'deliveryFee': deliveryFee});
    result.addAll({'subtotal': subtotal});
    result.addAll({'total': total});
    result.addAll({'isAccepted': isAccepted});
    result.addAll({'isDelivered': isDelivered});
    result.addAll({'isCancelled': isCancelled});
    result.addAll({'createdAt': createdAt.millisecondsSinceEpoch});

    return result;
  }

  factory Order.fromDoc(DocumentSnapshot doc) {
    final Map<String, dynamic> map = doc.data() as Map<String, dynamic>;

    return Order(
      id: doc.id,
      customerId: map['customerId']?.toInt() ?? 0,
      productIds: List<int>.from(map['productIds']),
      deliveryFee: map['deliveryFee']?.toDouble() ?? 0.0,
      subtotal: map['subtotal']?.toDouble() ?? 0.0,
      total: map['total']?.toDouble() ?? 0.0,
      isAccepted: map['isAccepted'] ?? false,
      isDelivered: map['isDelivered'] ?? false,
      isCancelled: map['isCancelled'] ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'Order(id: $id, customerId: $customerId, productIds: $productIds, deliveryFee: $deliveryFee, subtotal: $subtotal, total: $total, isAccepted: $isAccepted, isDelivered: $isDelivered, isCancelled: $isCancelled, createdAt: $createdAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      customerId,
      productIds,
      deliveryFee,
      subtotal,
      total,
      isAccepted,
      isDelivered,
      isCancelled,
      createdAt,
    ];
  }

  static List<Order> orders = [
    Order(
      id: '1',
      customerId: 2345,
      productIds: const [1, 2],
      deliveryFee: 10,
      subtotal: 20,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
    Order(
      id: '2',
      customerId: 23,
      productIds: const [1, 2, 3],
      deliveryFee: 10,
      subtotal: 30,
      total: 30,
      isAccepted: false,
      isDelivered: false,
      isCancelled: false,
      createdAt: DateTime.now(),
    ),
  ];
}
