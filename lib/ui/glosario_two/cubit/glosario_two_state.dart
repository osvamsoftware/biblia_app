part of 'glosario_two_cubit.dart';

enum NuevoGlosarioStatus { initial, loading, loaded, error }

class NuevoGlosarioState extends Equatable {
  final List<NuevoGlosarioModel>? nuevoGlosarioModel;
  final NuevoGlosarioStatus? status;

  const NuevoGlosarioState({
    this.status = NuevoGlosarioStatus.initial,
    this.nuevoGlosarioModel,
  });

  @override
  List<Object?> get props => [nuevoGlosarioModel, status];

  NuevoGlosarioState copyWith({
    NuevoGlosarioStatus? status,
    List<NuevoGlosarioModel>? nuevoGlosarioModel,
  }) {
    return NuevoGlosarioState(
      status: status ?? this.status,
      nuevoGlosarioModel: nuevoGlosarioModel ?? this.nuevoGlosarioModel,
    );
  }
}
