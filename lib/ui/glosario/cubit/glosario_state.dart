// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'glosario_cubit.dart';

enum GlosarioStatus { initial, loading, loaded, error }

class GlosarioState extends Equatable {
  final List<GlosarioModel>? glosarioModel;
  final GlosarioStatus? status;
  const GlosarioState({this.status, this.glosarioModel});

  @override
  List<Object?> get props => [glosarioModel, status];

  GlosarioState copyWith({
    GlosarioStatus? status,
    List<GlosarioModel>? glosarioModel,
  }) {
    return GlosarioState(
      status: status ?? this.status,
      glosarioModel: glosarioModel ?? this.glosarioModel,
    );
  }
}
