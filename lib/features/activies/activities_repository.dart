import 'package:dio/dio.dart';
import 'package:project_cycles/features/activies/activities_model.dart';
import 'package:project_cycles/features/activies/activities_services.dart';
import 'package:project_cycles/services/dio_connect.dart';
import 'package:get/get.dart' as getx;
import 'package:project_cycles/services/secure_storage_service.dart';

class ActivitiesRepository extends ActivitiesServices {
  ActivitiesRepository();

  SecureStorageService secureStorageService = const SecureStorageService();

  DioConnection dioConnection = getx.Get.find();

  Dio get dio => dioConnection.dio;

  @override
  Future<void> postActivities(ActivitiesModel activitiesModel) async {
    // final cookie = await _secureStorageService.readOne(key: ConfigKeys.cookie);

    // final Response response = await dio.post('$_apiAddress/activities',
    //     data: activitiesModel.toJson());

    // if (response.statusCode == 201) {
    //   log('Activities Post request: ${response.data}');
    // } else {
    //   throw Exception('Failed to patch data');
    // }
  }

  Future<void> deleteActivities(ActivitiesModel activitiesModel) async {
    // final url = Uri.parse('https://$_apiAddress/');

    // final Response response = await dio.delete(
    //   'https://$_apiAddress/');

    // if (response.statusCode == 200) {
    //   log('Activities Delete request: ${response.data}');
    // } else {
    //   throw Exception('Failed to make HTTP request');
    // }
  }

//   @override
//   Future<void> editActivities(ActivitiesModel activitiesModel) async {
//     final url = Uri.parse('https://$activitiesModel/');

//     final map = {
//       'profileId': activitiesModel.profileId,
//       'activeName': activitiesModel.activeName,
//       'activeDescription': activitiesModel.activeDescription,
//       'checklist': activitiesModel.checklist,
//     };

//     final body = jsonEncode(map);

//     final response = await http.put(
//       url,
//       headers: <String, String>{
//         'Content-Type': 'application/json',
//       },
//       body: body,
//     );

//     if (response.statusCode == 200) {
//       final responseData = jsonDecode(response.body);
//       log('Activities Patch request: $responseData');
//     } else {
//       throw Exception('Failed to make HTTP request');
//     }
//   }

//   @override
//   Future<void> getActivities(ActivitiesModel activitiesModel) async {
//     final url = Uri.parse('https://$_apiAddress/todolist');

//     final response = await http.get(url);

//     final itemList = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       return itemList.map<ActivitiesModel>((itemMap) {
//         return ActivitiesModel.fromMap(itemMap);
//       }).toList();
//     } else {
//       throw Exception('Failed to make HTTP request');
//     }
//   }

//   @override
//   Future<ActivitiesModel> getByIdActivities(
//       ActivitiesModel activitiesModel) async {
//     var url = Uri.parse('https://' '/${activitiesModel.profileId}');

//     final response = await http.get(url);
//     final itemMap = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       return ActivitiesModel.fromMap(itemMap);
//     } else {
//       throw Exception('Failed to make HTTP request');
//     }
//   }
// }

  // Future<void> getActivities(String url) async {
  //   final response = await http.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     log(responseData);
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
// TODO (CHARLESTON): Rever se podemos remover código morto
}
