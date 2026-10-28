part of 'products_cubit.dart';

sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<ProductsModel> data;
  ProductsSuccess(this.data);
}

class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure(this.message);
}
