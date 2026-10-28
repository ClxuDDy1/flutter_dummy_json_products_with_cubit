import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dummy_json_products_with_cubit/core/network/api_result.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/data/models/products_model.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/data/repos/products_repo.dart';
part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepo _repo;
  ProductsCubit(this._repo) : super(ProductsInitial());

  Future<void> readProducts() async {
    emit(ProductsLoading());
    final data = await _repo.getProducts();
    switch (data) {
      case ApiSuccess(:final data):
        emit(ProductsSuccess(data));
      case ApiFailure(:final message):
        emit(ProductsFailure(message));
    }
  }
}
