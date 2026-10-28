import 'package:dio/dio.dart';
import 'package:flutter_dummy_json_products_with_cubit/core/constants/api_constants.dart';
import 'package:flutter_dummy_json_products_with_cubit/core/network/api_result.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/data/models/products_model.dart';

class ProductsRepo {
  final Dio _dio;
  ProductsRepo(this._dio);

  Future<ApiResult<List<ProductsModel>>> getProducts() async {
    try {
      final response = await _dio.get(ApiConstants.products);
      final List rawData = response.data['products'];
      final products = rawData.map((e) => ProductsModel.fromJson(e)).toList();
      return ApiSuccess(products);
    } on DioException catch (e) {
      return ApiFailure(e.message ?? 'Something Went Wrong');
    }
  }
}
