// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tanaj_cubit.dart';

class TanajState {
  final List<BookModel> tanajData;

  const TanajState(this.tanajData);

  TanajState copyWith({
    List<BookModel>? tanajData,
  }) {
    return TanajState(
      tanajData ?? this.tanajData,
    );
  }
}
