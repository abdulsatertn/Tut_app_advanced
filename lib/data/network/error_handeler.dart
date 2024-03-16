import 'package:store_app_advanced/data/network/Failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIME_OUT,
  CANCEL,
  RECIEVE_TIME_OUT,
  SEND_TIME_OUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseCode.SUCCESS, ResponseMessage.SUCCESS);

      case DataSource.NO_CONTENT:
        return Failure(ResponseCode.NO_CONTENT, ResponseMessage.NO_CONTENT);

      case DataSource.BAD_REQUEST:
        return Failure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST);

      case DataSource.FORBIDDEN:
        return Failure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN);

      case DataSource.UNAUTHORISED:
        return Failure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED);

      case DataSource.NOT_FOUND:
        return Failure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND);

      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR);

      case DataSource.CONNECT_TIME_OUT:
        return Failure(
            ResponseCode.CONNECT_TIME_OUT, ResponseMessage.CONNECT_TIME_OUT);

      case DataSource.CANCEL:
        return Failure(ResponseCode.CANCEL, ResponseMessage.CANCEL);

      case DataSource.RECIEVE_TIME_OUT:
        return Failure(
            ResponseCode.RECIEVE_TIME_OUT, ResponseMessage.RECIEVE_TIME_OUT);

      case DataSource.SEND_TIME_OUT:
        return Failure(
            ResponseCode.SEND_TIME_OUT, ResponseMessage.SEND_TIME_OUT);

      case DataSource.CACHE_ERROR:
        return Failure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR);

      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure , API rejected request
  static const int UNAUTHORISED = 401; // failure , user is not autherised
  static const int FORBIDDEN = 403; // API rejected  request
  static const int INTERNAL_SERVER_ERROR =
      500; // failure , crash in server side
  static const int NOT_FOUND = 404; // Failure , not found

  // local status code
  static const int CONNECT_TIME_OUT = -1;
  static const int CANCEL = -2; //
  static const int RECIEVE_TIME_OUT = -3;
  static const int SEND_TIME_OUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int UNKNOWN = -7;
}

class ResponseMessage {
  static const String SUCCESS = 'success'; // success with data
  static const String NO_CONTENT =
      'success'; // success with no data (no content)
  static const String BAD_REQUEST =
      'bad request , try again later'; // failure , API rejected request
  static const String UNAUTHORISED =
      'user is unauthorised, try again later'; // failure , user is not autherised
  static const String FORBIDDEN = 'fornidden request'; // API rejected  request
  static const String INTERNAL_SERVER_ERROR =
      'something went wrong , try again later'; // failure , crash in server side
  static const String NOT_FOUND =
      'something went wrong , try again later'; // API rejected  request

  // local status code
  static const String CONNECT_TIME_OUT = 'Time out  error , try again later';
  static const String CANCEL = 'request was cancelled try again later';
  static const String RECIEVE_TIME_OUT = 'Time out  error , try again later';
  static const String SEND_TIME_OUT = 'Time out  error , try again later';
  static const String CACHE_ERROR = 'Cache error , try again later';
  static const String NO_INTERNET_CONNECTION =
      'Please check your internet connection';
  static const String UNKNOWN = 'something went wrong , try again later';
}
