import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kanver_flutter_app/data/abstracts/irepository.dart';

class Repository<T> extends IRepository {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Repository() {
    // _fireStore = FirebaseFirestore.instance;
  }

  /// girilen entityi ilgili collection varsa oraya ekler yoksa yeni bir tane açıp
  /// içine document olarak ekler
  /// [entity] burada bir classı işaret eder
  @override
  Future<void> addAsync(entity) async {
    _fireStore
        .collection("${entity.runtimeType}")
        .add(entity.toMap() as Map<String, dynamic>);
  }

  ///girilen entity turune göre firebaseye get isteği atılır ve firebase ilgili alanın butun
  ///documentlerini getirir
  /// [entity] burada bir classı işaret eder
  @override
  Future<List<Map<String, dynamic>>> getAllAsync(entity) async {
    late Map<String, dynamic> allData;
    List<Map<String, dynamic>> documentList = [];

    try {
      var collectionPath = entity.toString();
      QuerySnapshot querySnapshot =
          await _fireStore.collection(collectionPath).get();

      var documents = querySnapshot.docs;

      for (var element in documents) {
        allData = element.data() as Map<String, dynamic>;
        documentList.add(allData);
      }

      return documentList;
    } catch (e) {
      debugPrint("Error getting documents: $e");
    }
    throw Exception();
  }

  ///removeWithIdAsync() bir entity alır ve içerisinde gerekli işlemleri yaparak
  ///o entitynin id sini kullanarak bir eşleme yapar eşleşen entityi veritabanından siler
  ///[entity] burada bir classı işaret eder
  @override
  Future<void> removeWithIdAsync(entity) async {
    String collectionPath = "${entity.runtimeType}";
    QuerySnapshot querySnapshot =
        await _fireStore.collection(collectionPath).get();
    var documents =
        querySnapshot.docs.where((element) => element.get("id") == entity.id);
    for (var element in documents) {
      if (element.data() != null) {
        _fireStore
            .doc("$collectionPath/${element.id}")
            .delete()
            .whenComplete(() => debugPrint("Silindi"));
      }
    }
    // for (var document in documents) {
    //   print(document.data());
    //   print(entity.toMap());
    // }
  }

  ///verilenlerin tablodaki ilgili alanla işleşmesi durumunda silme işlemi geçekleşir
  ///[collectionName] ilgili tablonun ismi
  ///
  ///[field] tablodaki ilgili alan
  ///
  ///[value] tablodaki ilgili alanın değeri
  ///
  @override
  Future<void> deleteDocumentsInCollectionWithFieldFilter(
      entity, String field, value) async {
    try {
      final QuerySnapshot querySnapshot = await _fireStore
          .collection(entity.toString())
          .where(field, isEqualTo: value)
          .where(field)
          .get();

      final List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (QueryDocumentSnapshot document in documents) {
        final documentReference = document.reference;
        await documentReference.delete();
      }
    } catch (e) {
      debugPrint("Firestore belge silme hatası: $e");
    }
  }
}
