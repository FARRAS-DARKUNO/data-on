

import 'package:data_on/data/api/api.dart';
import 'package:data_on/data/model/university_model.dart';
import 'package:dio/dio.dart';

class UniversityRepository {
  var dio = Dio();

  Future<List<UniversityModel>> getSearchData() async {
   
      var response = await dio.get(baseUrl);

      List result = response.data;

      return result.map((value) => UniversityModel.fromMap(value)).toList();
     
  
  }
}
