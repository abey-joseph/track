abstract class ExpenseFailure {
  final String message;
  ExpenseFailure(this.message);
}

class DatabaseFetchFailure extends ExpenseFailure {
  DatabaseFetchFailure(super.message);
}

class DatabaseAddFailure extends ExpenseFailure {
  DatabaseAddFailure(super.message);
}

class DatabaseEditFailure extends ExpenseFailure {
  DatabaseEditFailure(super.message);
}

class DatabaseDeleteFailure extends ExpenseFailure {
  DatabaseDeleteFailure(super.message);
}
