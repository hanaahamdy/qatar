
import '../../../../core/entities/base_entity.dart';

class ContactEntity extends BaseEntity{
  final String? fullName;
  final String? phone;
  final String? email;
  final String? message;

  ContactEntity({this.fullName, this.message, this.phone, this.email});

  @override
  List<Object?> get props => [];
}