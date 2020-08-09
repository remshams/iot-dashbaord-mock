import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/core/account/account_repository.dart';
import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:meta/meta.dart';

enum RequestAttachment { system }

@immutable
class Domains {
  final AccountRepository accountRepository;
  final DeviceDatabase deviceDatabase;

  const Domains(this.accountRepository, this.deviceDatabase);

  factory Domains.inMemory() {
    return Domains(InMemoryAccountRepository.fromIterable(accounts),
        InMemoryDeviceDatabase.fromDeviceIterable(devices));
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Domains &&
        o.accountRepository == accountRepository &&
        o.deviceDatabase == deviceDatabase;
  }

  @override
  int get hashCode => accountRepository.hashCode ^ deviceDatabase.hashCode;
}
