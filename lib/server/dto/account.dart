import 'package:equatable/equatable.dart';
import 'package:iot_dashboard_mock/core/account/model.dart';

class AccountDto extends Equatable {
  final String id;
  final String username;
  final String email;

  const AccountDto(this.id, this.username, this.email);

  Map<String, dynamic> toJson() =>
      {'id': id, 'username': username, 'email': email};

  AccountDto.fromAccount(Account account)
      : this(account.id, account.username, account.email);
  AccountDto.fromJson(Map<String, dynamic> json)
      : this(json['id'] as String, json['username'] as String,
            json['email'] as String);

  @override
  List<Object> get props => [id, username, email];
}
