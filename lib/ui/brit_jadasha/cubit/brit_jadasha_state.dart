// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'brit_jadasha_cubit.dart';

class BritJadashaState {
  final List<BookModel> tanajData;

  const BritJadashaState(this.tanajData);

  BritJadashaState copyWith({
    List<BookModel>? tanajData,
  }) {
    return BritJadashaState(
      tanajData ?? this.tanajData,
    );
  }
}
