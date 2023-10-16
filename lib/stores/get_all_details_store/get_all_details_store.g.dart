// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllDetailsStore on _GetAllDetailsStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_GetAllDetailsStore.loading'))
      .value;

  late final _$fetchPostsFutureAtom =
      Atom(name: '_GetAllDetailsStore.fetchPostsFuture', context: context);

  @override
  ObservableFuture<GetAllDetailsModel?> get fetchPostsFuture {
    _$fetchPostsFutureAtom.reportRead();
    return super.fetchPostsFuture;
  }

  @override
  set fetchPostsFuture(ObservableFuture<GetAllDetailsModel?> value) {
    _$fetchPostsFutureAtom.reportWrite(value, super.fetchPostsFuture, () {
      super.fetchPostsFuture = value;
    });
  }

  late final _$alldetailsResponseAtom =
      Atom(name: '_GetAllDetailsStore.alldetailsResponse', context: context);

  @override
  GetAllDetailsModel? get alldetailsResponse {
    _$alldetailsResponseAtom.reportRead();
    return super.alldetailsResponse;
  }

  @override
  set alldetailsResponse(GetAllDetailsModel? value) {
    _$alldetailsResponseAtom.reportWrite(value, super.alldetailsResponse, () {
      super.alldetailsResponse = value;
    });
  }

  late final _$SuccessAtom =
      Atom(name: '_GetAllDetailsStore.Success', context: context);

  @override
  bool get Success {
    _$SuccessAtom.reportRead();
    return super.Success;
  }

  @override
  set Success(bool value) {
    _$SuccessAtom.reportWrite(value, super.Success, () {
      super.Success = value;
    });
  }

  late final _$postAllDetailsAsyncAction =
      AsyncAction('_GetAllDetailsStore.postAllDetails', context: context);

  @override
  Future<dynamic> postAllDetails(String type) {
    return _$postAllDetailsAsyncAction.run(() => super.postAllDetails(type));
  }

  late final _$_GetAllDetailsStoreActionController =
      ActionController(name: '_GetAllDetailsStore', context: context);

  @override
  void setSuccess(bool value) {
    final _$actionInfo = _$_GetAllDetailsStoreActionController.startAction(
        name: '_GetAllDetailsStore.setSuccess');
    try {
      return super.setSuccess(value);
    } finally {
      _$_GetAllDetailsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchPostsFuture: ${fetchPostsFuture},
alldetailsResponse: ${alldetailsResponse},
Success: ${Success},
loading: ${loading}
    ''';
  }
}
