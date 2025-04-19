import 'package:track/core/errors/failure.dart';

abstract class DatabaseFailure extends Failure {
  DatabaseFailure(super.message);
}

class DatabaseFetchFailure extends DatabaseFailure {
  DatabaseFetchFailure(super.message);
}

class DatabaseAddFailure extends DatabaseFailure {
  DatabaseAddFailure(super.message);
}

class DatabaseEditFailure extends DatabaseFailure {
  DatabaseEditFailure(super.message);
}

class DatabaseDeleteFailure extends DatabaseFailure {
  DatabaseDeleteFailure(super.message);
}
