import 'package:btcturk_training/src/services/api_data_get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class CategoryFilterLinkCubit extends Cubit<List<String>> {
  CategoryFilterLinkCubit() : super([]);

  void changeLink(List<String> filterList) {
    if (filterList.isEmpty) {
      emit([]);
    } else {
      emit(filterList);
    }
  }
}
