// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:car_master/models/get_all_details/get_all_details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:car_master/data/repository.dart';
import 'package:car_master/models/post/post_list.dart';
import 'package:car_master/stores/error/error_store.dart';
part 'get_all_details_store.g.dart';

class GetAllDetailsStore = _GetAllDetailsStore with _$GetAllDetailsStore;

abstract class _GetAllDetailsStore with Store {
  // repository instance
  late final Repository _repository;

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // constructor:---------------------------------------------------------------
  _GetAllDetailsStore(Repository repository) : _repository = repository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<GetAllDetailsModel?> emptyPostResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<GetAllDetailsModel?> fetchPostsFuture =
      ObservableFuture<GetAllDetailsModel?>(emptyPostResponse);

  @observable
  GetAllDetailsModel? alldetailsResponse;

  @observable
  bool Success = false;

  @computed
  bool get loading => fetchPostsFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future postAllDetails(
    String type,
  
  ) async {
    final future = _repository.postAllDetails(
      type
    );
    fetchPostsFuture = ObservableFuture(future);

    future.then((alldetailsResponse) {
      Success = true;
      this.alldetailsResponse = alldetailsResponse;
      if (kDebugMode) {}
    }).catchError((error) {
      if (error is DioError) {
        if (error.type == DioErrorType.connectTimeout) {
          // throw Exception("Connection  Timeout Exception");
          Success = false;
          if (kDebugMode) {}
        } else {
          final dioError = error;
          if (kDebugMode) {
            print('########errrrrr ${dioError.message}');
          }
          Success = false;
          errorStore.errorMessage = "Something went wrong!";
          if (kDebugMode) {}
        }
      } else {
        final dioError = error as DioError;
        if (kDebugMode) {
          print('########errrrrr ${dioError.message}');
        }
        Success = false;
        errorStore.errorMessage = "Something went wrong!";
        if (kDebugMode) {}
      }
    });
  }

  @action
  void setSuccess(bool value) {
    Success = value;
  }

  void resetValues() {
    alldetailsResponse = null;
    Success = false;
  }
}
