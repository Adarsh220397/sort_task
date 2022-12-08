import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filter_option_task/services/models/data_model.dart';

class UserService {
  UserService._internal();
  static UserService instance = UserService._internal();

  Future<bool> uploadData() async {
    List<DataModel> dataList = [
      DataModel(name: 'Arun', age: '25', city: 'Coimbatore'),
      DataModel(name: 'Karthick', age: '28', city: 'Chennai'),
      DataModel(name: 'Adarsh', age: '23', city: 'Hyderabad'),
      DataModel(name: 'Dinesh', age: '31', city: 'Delhi'),
      DataModel(name: 'Mohan', age: '34', city: 'Mumbai'),
      DataModel(name: 'Siraj', age: '30', city: 'Pune'),
      DataModel(name: 'Jesus', age: '22', city: 'Lucknow'),
      DataModel(name: 'Richard', age: '37', city: 'Kochi'),
      DataModel(name: 'Kaif', age: '24', city: 'Mumbai'),
    ];
    try {
      for (DataModel data in dataList) {
        DocumentReference movieRef =
            FirebaseFirestore.instance.collection('data').doc();

        await movieRef.set(data.toJson());
      }
    } catch (e) {
      print('------$e');
      return false;
    }
    return true;
  }

  Future<List<DataModel>> getData() async {
    List<DataModel> list = [];
    try {
      CollectionReference movieReleaseCollectionRef =
          FirebaseFirestore.instance.collection('data');

      QuerySnapshot stateCollectionRef = await movieReleaseCollectionRef.get();

      if (stateCollectionRef.docs.isEmpty) {
        list;
      }
      list = stateCollectionRef.docs
          .map((doc) => DataModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
      return list;
    } catch (e) {
      print('-----$e');
    }
    return list;
  }
}
