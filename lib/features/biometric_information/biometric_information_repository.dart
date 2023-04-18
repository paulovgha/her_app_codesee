import 'package:project_cycles/features/biometric_information/biometric_information_services.dart';
import 'package:project_cycles/services/secure_storage_service.dart';

class BiometricInformationRepository extends BiometricInformationServices {
  BiometricInformationRepository();

  SecureStorageService secureStorageService = const SecureStorageService();

  // @override
  // Future<void> postBiometricInformation(
  //     BiometricInformationModel biometricInformationModel) async {
  //   final url = Uri.parse('$_apiAddress/biometricInformation');

  //   final cookie = await _secureStorageService.readOne(key: ConfigKeys.cookie);

  //   //const cookie =
  //   //    'connect.sid=s%3A14NRCKC6raXYS8BiPe0GDPu9Ofq8-qtd.WIJpHUvhvgFZPBqTtv%2Fl05FrVayZVUbhktpaIUxNaUQ; Path=/; HttpOnly; Expires=Sat, 25 Mar 2023 13:39:33 GMT;';

  //   final Map<String, String> headers = {
  //     'Content-Type': 'application/json',
  //     'cookie': cookie ?? ''
  //   };

  //   final response = await http.post((url),
  //       body: biometricInformationModel.toJson(), headers: headers);

  //   if (response.statusCode == 201) {
  //     log('Biometric Information Post request: ${response.body}');
  //   } else {
  //     throw Exception('Failed to patch data');
  //   }
  // }

  // @override
  // Future<void> deleteBiometricInformation(
  //     BiometricInformationModel biometricInformationModel) async {
  //   final url = Uri.parse('$_apiAddress/biometricInformation');

  //   final response = await http.delete(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     log('Biometric Information Delete request: $responseData');
  //   } else {
  //     throw Exception('Failed to make HTTP request');
  //   }
  // }

  // @override
  // Future<void> editBiometricInformation(
  //     BiometricInformationModel biometricInformationModel) async {
  //   final url = Uri.parse('https://$_apiAddress/');

  //   final map = {
  //     "profileId": biometricInformationModel.profileId,
  //     "hrv": biometricInformationModel.hrv,
  //     "heartBeat": biometricInformationModel.heartBeat,
  //     "remsLeep": biometricInformationModel.remsLeep,
  //     "deepsLeep": biometricInformationModel.deepsLeep,
  //     "restTime": biometricInformationModel.restTime,
  //     "activityTime": biometricInformationModel.activityTime,
  //     "temperature": biometricInformationModel.temperature,
  //     "respiratoryRate": biometricInformationModel.respiratoryRate,
  //   };

  //   final body = jsonEncode(map);

  //   final response = await http.put(
  //     url,
  //     headers: <String, String>{
  //       'Content-Type': 'application/json',
  //     },
  //     body: body,
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     log('Biometric Information Edit request: $responseData');
  //   } else {
  //     throw Exception('Failed to make HTTP request');
  //   }
  // }

  // @override
  // Future<void> getBiometricInformation(
  //     BiometricInformationModel biometricInformationModel) async {
  //   final url = Uri.parse('https://$_apiAddress/');

  //   final response = await http.get(url);

  //   final itemList = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     return itemList.map<BiometricInformationModel>((itemMap) {
  //       return BiometricInformationModel.fromMap(itemMap);
  //     }).toList();
  //   } else {
  //     throw Exception('Failed to make HTTP request');
  //   }
  // }

  // @override
  // Future<BiometricInformationModel> getByIdBiometricInformation(
  //     BiometricInformationModel biometricInformationModel) async {
  //   final url = Uri.parse('https://$_apiAddress/}');

  //   final response = await http.get(url);
  //   final itemMap = jsonDecode(response.body);

  //   if (response.statusCode == 200) {
  //     return BiometricInformationModel.fromMap(itemMap);
  //   } else {
  //     throw Exception('Failed to make HTTP request');
  //   }
  // }
}
