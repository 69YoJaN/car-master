// ignore_for_file: unused_field, use_rethrow_when_possible, avoid_print, non_constant_identifier_names, unnecessary_null_comparison, prefer_typing_uninitialized_variables, unused_local_variable, depend_on_referenced_packages, unused_import

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:car_master/data/network/constants/endpoints.dart';
import 'package:car_master/data/network/dio_client.dart';
import 'package:car_master/data/network/rest_client.dart';
import 'package:car_master/models/get_all_details/get_all_details.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:car_master/models/post/post_list.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  /// Returns list of post in response

  Future<GetAllDetailsModel> postAllDetails(
    String type,
  ) async {
    try {
      var body = {
        'type': 'CAR',
      };
      final res = await _dioClient.post(Endpoints.getAllDetails,
          data: json.encode(body));
      return GetAllDetailsModel.fromJson(res);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }

  Future<PostList> getVitalsist(param) async {
    try {
      final res = await _dioClient.get(
        '${Endpoints.getVitals + param}/',
      );
      return PostList.fromJson(res);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
