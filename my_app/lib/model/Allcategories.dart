class Classification {
  final int id;
  final String classificationName;
  final List<CategoryGroup> categoryGroups;

  Classification(
      {required this.id,
      required this.classificationName,
      required this.categoryGroups});

  factory Classification.fromJson(Map<String, dynamic> json) {
    List<CategoryGroup> categoryGroups = [];
    for (var categoryGroup in json['classification']['categoriesGroups']) {
      categoryGroups.add(CategoryGroup.fromJson(categoryGroup));
    }

    return Classification(
      id: json['classification']['id'],
      classificationName: json['classification']['ClassificationName'],
      categoryGroups: categoryGroups,
    );
  }
}

class CategoryGroup {
  final int id;
  final String categoriesGroupName;
  final List<Category> categories;

  CategoryGroup(
      {required this.id,
      required this.categoriesGroupName,
      required this.categories});

  factory CategoryGroup.fromJson(Map<String, dynamic> json) {
    List<Category> categories = [];
    for (var category in json['categories']) {
      categories.add(Category.fromJson(category));
    }

    return CategoryGroup(
      id: json['id'],
      categoriesGroupName: json['categoriesGroupName'],
      categories: categories,
    );
  }
}
class Category {
  final int id;
  final String categoryName;
  

  Category({required this.id, required this.categoryName});

  factory Category.fromJson(Map<String, dynamic> json) {
    List<Category> categories =[];
    return Category(
      id: json['id'],
      categoryName: json['CategoryName'],
    );
  }
}
