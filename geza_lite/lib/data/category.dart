class Category {
  final int id;
  final String name;
  final String image;

  const Category({required this.id, required this.name, required this.image});
}

class CategoryList {
  static List<Category> list() {
    const data = <Category>[
      // Category(id: 1, name: 'All', image: 'assets/images/category/3.png'),
      Category(id: 2, name: 'Hair Care', image: 'assets/images/category/1.png'),
      Category(
          id: 3,
          name: 'Skin & Nail Care',
          image: 'assets/images/category/2.png'),
      Category(id: 4, name: 'Store', image: 'assets/images/category/4.png'),
    ];
    return data;
  }
}
