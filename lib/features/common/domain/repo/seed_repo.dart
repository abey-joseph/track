abstract class SeedRepo {
  Future<void> ensureDefaultsIfEmpty({required String uid});
  Future<void> insertSampleData({required String uid});
}


