class AddExpenseEntity {
  final int id;
  final String title;
  final String createdAt;
  final String? subtitle;
  final String? description;

  AddExpenseEntity({
    required this.id,
    required this.title,
    required this.createdAt,
    this.subtitle,
    this.description,
  });

  // factory AddExpenseModel.setApiData(Map<String, dynamic> data) {
  //   return AddExpenseModel(
  //     id: data["id"],
  //     title: data['title'],
  //     createdAt: data['createdAt'],
  //     subtitle: data['subTitle'],
  //     description: data['description'],
  //   );
  // }
}
