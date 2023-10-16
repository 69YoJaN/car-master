// ignore_for_file: prefer_interpolation_to_compose_strings, constant_identifier_names

class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://182.76.32.122/connectus-dummy/api/v1/";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getAllDetails = "GetAllDetails";
    static const String getVitals = "web/agg_hhc_services_api";
}
