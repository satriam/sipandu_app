import 'package:hyper_ui/testting_something/flutter_pdf/model/customer_model.dart';
import 'package:hyper_ui/testting_something/flutter_pdf/model/supplier_model.dart';

class InvoiceModel {
  final InvoiceInfoModel info;
  final SupplierModel supplier;
  final CustomerModel customer;
  final List<InvoiceItem> items;

  const InvoiceModel({
    required this.info,
    required this.supplier,
    required this.customer,
    required this.items,
  });
}

class InvoiceInfoModel {
  final String description;
  final String number;
  final DateTime date;
  final DateTime dueDate;

  const InvoiceInfoModel({
    required this.description,
    required this.number,
    required this.date,
    required this.dueDate,
  });
}

class InvoiceItem {
  final String description;
  final DateTime date;
  final int quantity;
  final double vat;
  final double unitPrice;

  const InvoiceItem({
    required this.description,
    required this.date,
    required this.quantity,
    required this.vat,
    required this.unitPrice,
  });
}
