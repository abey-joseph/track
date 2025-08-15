import 'package:injectable/injectable.dart';
import 'package:track/core/utils/injection/get_it.dart';
import 'package:track/features/common/domain/repo/seed_repo.dart';

@lazySingleton
class InsertSampleData {
	final SeedRepo _repo = getIt<SeedRepo>();
	Future<void> call({required String uid}) => _repo.insertSampleData(uid: uid);
}
