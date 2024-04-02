import 'package:flutter_e_commerce_c10_online/domain/entities/CategoryOrBrandResponseEntity.dart';

class ProductResponseEntity {
  ProductResponseEntity({
      this.results, 
      this.data,});

  num? results;
  List<ProductEntity>? data;

}

class ProductEntity {
  ProductEntity({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage,
      });

  num? sold;
  List<String>? images;
  List<SubcategoryEntity>? subcategory;
  num? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  num? quantity;
  num? price;
  String? imageCover;
  CategoryOrBrandEntity? category;
  CategoryOrBrandEntity? brand;
  num? ratingsAverage;
}

class SubcategoryEntity {
  SubcategoryEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  String? id;
  String? name;
  String? slug;
  String? category;

}
