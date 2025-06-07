class GetExpenseModel {
  final int id;
  final String title;
  final String createdAt;
  final String? description;
  final int? amount; // Added amount since it's in JSON

  GetExpenseModel({
    required this.id,
    required this.title,
    required this.createdAt,
    this.description,
    this.amount, // Include amount if needed
  });

  factory GetExpenseModel.fromJson(Map<String, dynamic> json) {
    return GetExpenseModel(
      id: json["id"] ?? 0, // Default to 0 if null
      title: json["title"] ?? "No Title", // Default fallback
      createdAt: json["createdAt"] ?? "", // Ensure it's not null
      description: json["description"], // Nullable, no default needed
      amount: json["amount"], // Nullable, no default needed
    );
  }
}
