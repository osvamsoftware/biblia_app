import 'package:biblia_app/data/book_model.dart';
import 'package:biblia_app/repository/brit_jadasha_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'brit_jadasha_state.dart';

class BritJadashaCubit extends Cubit<BritJadashaState> {
  final BritJadashaRepository _tanajRepository;

  BritJadashaCubit(this._tanajRepository) : super(const BritJadashaState([]));

  Future<void> localBrit() async {
    try {
      final tanaj = await _tanajRepository.fetchBritFromAssets();
      emit(state.copyWith(tanajData: tanaj));
    } catch (e) {
      emit(state);
    }
  }
}
