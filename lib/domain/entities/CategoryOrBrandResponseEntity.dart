class CategoryOrBrandResponseEntity {
  CategoryOrBrandResponseEntity({
      this.results, 
      this.data,});

  int? results;
  List<CategoryOrBrandEntity>? data;


}

class CategoryOrBrandEntity {
  CategoryOrBrandEntity({
      this.id, 
      this.name, 
      this.slug, 
      this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;

}

