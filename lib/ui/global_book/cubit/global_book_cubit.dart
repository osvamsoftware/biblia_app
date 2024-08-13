import 'package:biblia_app/data/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'global_book_state.dart';

class GlobalBookCubit extends Cubit<GlobalBookState> {
  GlobalBookCubit() : super(const GlobalBookState(currentCollection: [], currentIndexBook: 0, currentIndexChapter: 1));

  Future<void> setCurrentCollection(List<BookModel> bookCollection) async {
    try {
      emit(state.copyWith(currentCollection: bookCollection));
    } catch (e) {
      print('error');
    }
  }

  Future<void> setBook(int bookIndex) async {
    try {
      emit(state.copyWith(currentIndexBook: bookIndex));
    } catch (e) {
      print('error');
    }
  }

  Future<void> setChapter(int chapterIndex) async {
    try {
      emit(state.copyWith(currentIndexChapter: chapterIndex));
    } catch (e) {
      print('error');
    }
  }
}
