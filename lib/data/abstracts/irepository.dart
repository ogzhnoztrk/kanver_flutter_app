abstract class IRepository<T> {
  Future<void> addAsync(T entity);
  Future<void> removeWithIdAsync(T entity);
  // Future<void> getFirstOrDefault();
  Future<List<Map<String, dynamic>>> getAllAsync(T entity);
  Future<void> deleteDocumentsInCollectionWithFieldFilter(
      T entity, String field, dynamic value);
}
