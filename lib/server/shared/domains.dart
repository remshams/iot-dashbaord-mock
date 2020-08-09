import 'package:equatable/equatable.dart';
import 'package:iot_dashboard_mock/assets/db.dart';
import 'package:iot_dashboard_mock/core/account/account_repository.dart';
import 'package:iot_dashboard_mock/core/device/database/device_database.dart';
import 'package:iot_dashboard_mock/core/device/device_service.dart';
import 'package:iot_dashboard_mock/core/shared/environment/host.dart';
import 'package:iot_dashboard_mock/server/configuration.dart';
import 'package:meta/meta.dart';

enum RequestAttachment { system }

@immutable
class Domains extends Equatable {
  final AccountRepository accountRepository;
  final DeviceService deviceService;

  const Domains(this.accountRepository, this.deviceService);

  factory Domains.inMemory(ServerConfiguration serverConfiguration) {
    return Domains(
        InMemoryAccountRepository.fromIterable(accounts),
        DeviceService(InMemoryDeviceDatabase.fromDeviceIterable(devices),
            Host(serverConfiguration.host, serverConfiguration.port)));
  }

  @override
  List<Object> get props => [accountRepository, deviceService];
}
