import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dummy_json_products_with_cubit/features/products/logic/products_cubit.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products - Screen'),
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 1,
        shadowColor: Colors.black,
      ),
      body: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is ProductsFailure) {
            return Center(child: Text(state.message));
          }
          if (state is ProductsSuccess) {
            return ListView.separated(
              itemBuilder: (context, index) {
                final products = state.data;
                return ListTile(title: Text(products[index].title));
              },
              separatorBuilder: (_, _) => const Divider(),
              itemCount: state.data.length,
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
