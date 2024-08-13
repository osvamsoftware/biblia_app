import 'package:biblia_app/data/glosario_two_model.dart';
import 'package:biblia_app/repository/glosario_two_respository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'glosario_two_state.dart';

class NuevoGlosarioCubit extends Cubit<NuevoGlosarioState> {
  final NuevoGlosarioRepository repository;

  NuevoGlosarioCubit(this.repository) : super(const NuevoGlosarioState());

  Future<void> loadNuevoGlosario() async {
    try {
      emit(state.copyWith(status: NuevoGlosarioStatus.loading));
      final nuevoGlosario = await repository.fetchNuevoGlosarioFromAssets();
      emit(state.copyWith(
        status: NuevoGlosarioStatus.loaded,
        nuevoGlosarioModel: nuevoGlosario,
      ));
    } catch (e) {
      emit(state.copyWith(status: NuevoGlosarioStatus.error));
    }
  }
}
