class ExpenseEntity {
  final int? id;
  final bool isExpense;
  final String title;
  final double amount;
  final String category;
  final String comment;
  final DateTime date;

  ExpenseEntity(
      {this.id,
      required this.title,
      required this.isExpense,
      required this.category,
      required this.amount,
      required this.comment,
      required this.date});
}
