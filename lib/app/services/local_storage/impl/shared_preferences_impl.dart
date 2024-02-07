import 'dart:convert';

import 'package:sample_project/app/modules/home/domain/entities/cloth.dart';
import 'package:sample_project/app/services/local_storage/local_storage.dart';
import 'package:sample_project/env.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesImpl implements ILocalStorage {
  @override
  Future<bool> loadDefault() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final mock = [
      Cloth(
          type: ClothType.tshirt,
          image:
              'https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dCUyMHNoaXJ0c3xlbnwwfHwwfHx8MA%3D%3D',
          name: 'Polo',
          description: 'Cool T-Shirt',
          price: 245,
          sizeList: [32, 33, 34, 35],
          colorList: ['Black', 'White', 'Blue']),
      Cloth(
          type: ClothType.tshirt,
          image:
              'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8dCUyMHNoaXJ0c3xlbnwwfHwwfHx8MA%3D%3D',
          name: 'Amazon',
          description: 'Cool T-Shirt',
          price: 175,
          sizeList: [31],
          colorList: ['Blue', 'Red']),
    ].map((e) => e.toMap()).toList();

    final result =
        await sharedPreferences.setString(localStoragePath, jsonEncode(mock));

    return result;
  }

  @override
  Future<dynamic> read() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final result = sharedPreferences.getString(localStoragePath);

    if (result != null) {
      return (jsonDecode(result) as List).map((e) => Cloth.fromMap(e)).toList();
    }

    return null;
  }

  @override
  Future<bool> save(source) {
    // TODO: implement save
    throw UnimplementedError();
  }
}
