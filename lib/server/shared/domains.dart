import 'package:equatable/equatable.dart';
import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/core/account/account_repository.dart';
import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:iot_dashboard_mock/core/device/device_service.dart';
import 'package:meta/meta.dart';

enum RequestAttachment { system }

@immutable
class Domains extends Equatable {
  final AccountRepository accountRepository;
  final DeviceService deviceService;

  const Domains(this.accountRepository, this.deviceService);

  factory Domains.inMemory() {
    return Domains(InMemoryAccountRepository.fromIterable(accounts),
        DeviceService(InMemoryDeviceDatabase.fromDeviceIterable(devices)));
  }

  @override
  List<Object> get props => [accountRepository, deviceService];
}
