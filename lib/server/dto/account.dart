import 'package:equatable/equatable.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';

class AccountDto extends Equatable {
  final String id;
  final String name;
  final String email;

  const AccountDto(this.id, this.name, this.email);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};

  AccountDto.fromAccount(Account account)
      : this(account.id, account.name, account.email);
  AccountDto.fromJson(Map<String, dynamic> json)
      : this(json['id'] as String, json['name'] as String,
            json['email'] as String);

  @override
  List<Object> get props => [id, name, email];
}
