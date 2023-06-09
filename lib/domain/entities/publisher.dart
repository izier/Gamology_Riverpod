import 'package:equatable/equatable.dart';

class Publisher extends Equatable{
  const Publisher({
    required this.id,
    required this.name,
  });
  final int id;
  final String name;

  @override
  List<Object?> get props => [
    id,
    name
  ];
}