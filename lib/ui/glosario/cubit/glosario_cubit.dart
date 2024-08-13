import 'package:biblia_app/data/glosario_model.dart';
import 'package:biblia_app/repository/glosario_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'glosario_state.dart';

class GlosarioCubit extends Cubit<GlosarioState> {
  final GlosarioRepository repository;

  GlosarioCubit(this.repository) : super(GlosarioState());

  Future<void> loadGlosario() async {
    try {
      final glosario = await repository.fetchGlosarioFromAssets();
      emit(state.copyWith(glosarioModel: glosario, status: GlosarioStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: GlosarioStatus.error));
    }
  }
}
