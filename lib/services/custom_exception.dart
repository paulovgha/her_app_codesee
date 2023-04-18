import 'package:dio/dio.dart';

class CustomException implements Exception {
  String? errorMessage;
  CustomException({this.errorMessage = ''});

  factory CustomException.fromHttpError({required int statusCode}) {
    switch (statusCode) {
      case 400:
        return CustomException(errorMessage: "Unable to process the request");
      case 401:
        return CustomException(
            errorMessage: "Unable to authenticate the request");
      case 403:
        return CustomException(errorMessage: "Access denied");
      case 302:
        return CustomException(errorMessage: "Token expired");
      default:
        return CustomException(errorMessage: "Something went wrong");
    }
  }

  factory CustomException.fromDioError(DioError dioError) {
    getHttpErrorDescription(DioError dioError) {
      switch (dioError.response!.statusCode) {
        case 400:
          return "Unable to process the request";
        case 401:
          return "Unable to authenticate the request";
        case 403:
          return "Access denied";
        case 302:
          return "Token expired";
        default:
          return "Something went wrong";
      }
    }

    getDioErrorDescription(DioError dioError) {
      switch (dioError.type) {
        case DioErrorType.connectionTimeout:
          return "Connection timeout. Unable to connect to the server.";
        case DioErrorType.receiveTimeout:
          return "Receive timeout. Unable to connect to the server.";
        case DioErrorType.sendTimeout:
          return "Send timeout. Unable to connect to the server.";
        case DioErrorType.cancel:
          return "Request cancelled. Unable to connect to the server.";
        default:
          if (dioError.response != null) {
            return getHttpErrorDescription(dioError);
          }
          return "Something went wrong";
      }
    }

    if (dioError.response == null) {
      return CustomException(errorMessage: getDioErrorDescription(dioError));
    } else {
      return CustomException(errorMessage: getHttpErrorDescription(dioError));
    }
  }
}

// class VerifyResponse {
//   static verifyResponse(http.Response response) {
//     List<int> sucessStatus = [200, 201, 204, 202, 203, 205, 206, 207, 208, 226];
//     if (sucessStatus.contains(response.statusCode)) {
//       return jsonDecode(response.body);
//     }
//     throw CustomException.fromHttpError(statusCode: response.statusCode);
//   }
// }
