import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/core/account/account_repository.dart';

enum RequestAttachment { accountController }

class System {
  final AccountRepository accountRepository;

  System(this.accountRepository);

  factory System.inMemory() {
    return System(InMemoryAccountRepository.fromIterable(accounts));
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is System && o.accountRepository == accountRepository;
  }

  @override
  int get hashCode => accountRepository.hashCode;
}
