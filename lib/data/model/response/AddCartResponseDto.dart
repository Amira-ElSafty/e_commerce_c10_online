import 'package:flutter_e_commerce_c10_online/domain/entities/AddCartResponseEntity.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  AddCartResponseDto({
    super.status,
    super.message,
    super.numOfCartItems,
    this.statusMsg,
    super.data,
  });

  AddCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? AddCartDto.fromJson(json['data']) : null;
  }

  String? statusMsg;
}

class AddCartDto extends AddCartEntity {
  AddCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  AddCartDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(AddProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class AddProductDto extends AddProductEntity {
  AddProductDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  AddProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'];
    price = json['price'];
  }
}
