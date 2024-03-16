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

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure , API rejected request
  static const int UNAUTHORISED = 401; // failure , user is not autherised
  static const int FORBIDDEN = 403; // API rejected  request
  static const int INTERNAL_SERVER_ERROR =
      500; // failure , crash in server side

  // local status code
  static const int CONNECT_TIME_OUT = -1; //
  static const int CANCEL = -2; //
  static const int RECIEVE_TIME_OUT = -3; //
  static const int SEND_TIME_OUT = -4; //
  static const int CACHE_ERROR = -5; //
  static const int NO_INTERNET_CONNECTION = -6; //
  static const int UNKNOWN = -7; //
}
