// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'global_book_cubit.dart';

class GlobalBookState extends Equatable {
  final List<BookModel> currentCollection;
  final int? currentIndexBook;
  final int? currentIndexChapter;

  const GlobalBookState({required this.currentCollection, this.currentIndexBook, this.currentIndexChapter});

  @override
  List<Object> get props => [currentCollection, currentIndexBook ?? '', currentIndexChapter ?? ''];

  GlobalBookState copyWith({
    List<BookModel>? currentCollection,
    int? currentIndexBook,
    int? currentIndexChapter,
  }) {
    return GlobalBookState(
      currentCollection: currentCollection ?? this.currentCollection,
      currentIndexBook: currentIndexBook ?? this.currentIndexBook,
      currentIndexChapter: currentIndexChapter ?? this.currentIndexChapter,
    );
  }
}
