
import '../../../../core/entities/base_entity.dart';

class AboutEntity extends BaseEntity{

  final String? slug;
  final String? body;

  AboutEntity({required this.slug, required this.body});

  @override
  List<Object?> get props => [];


}