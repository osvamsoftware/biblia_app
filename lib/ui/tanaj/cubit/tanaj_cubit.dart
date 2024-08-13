import 'package:biblia_app/data/book_model.dart';
import 'package:biblia_app/repository/tanaj_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'tanaj_state.dart';

class TanajCubit extends Cubit<TanajState> {
  final TanajRepository _tanajRepository;

  TanajCubit(this._tanajRepository) : super(TanajState([]));

  Future<void> localTanaj() async {
    try {
      final tanaj = await _tanajRepository.fetchTanajFromAssets();
      emit(state.copyWith(tanajData: tanaj));
    } catch (e) {
      print('');
    }
  }
}
