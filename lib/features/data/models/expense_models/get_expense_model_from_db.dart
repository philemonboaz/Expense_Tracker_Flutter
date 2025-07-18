class GetExpenseModelFromDb {
  final int id;
  final String title;
  final String createdAt;
  final String? description;
  final String? amount; // Added amount since it's in JSON

  GetExpenseModelFromDb({
    required this.id,
    required this.title,
    required this.createdAt,
    this.description,
    this.amount, // Include amount if needed
  });

  factory GetExpenseModelFromDb.fromJson(Map<String, dynamic> json) {
    return GetExpenseModelFromDb(
      id: json["sno"] ?? 0, // Default to 0 if null
      title: json["title"] ?? "No Title", // Default fallback
      createdAt: json["createdAt"] ?? "", // Ensure it's not null
      description: json["description"], // Nullable, no default needed
      amount: json["amount"], // Nullable, no default needed
    );
  }
}
