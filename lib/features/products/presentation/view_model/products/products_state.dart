part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  const ProductsLoading();
}

class ProductsLoaded extends ProductsState {
  final List<Product> products;

  const ProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsError extends ProductsState {
  final String message;

  const ProductsError(this.message);

  @override
  List<Object> get props => [message];
}
