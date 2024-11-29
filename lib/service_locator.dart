import 'package:flutter_sql/data/data_sources/local/local_data_source.dart';
import 'package:flutter_sql/data/data_sources/local/sql_flight_impl/local_data_source_sql_flight_impl.dart';
import 'package:flutter_sql/data/repository_impl.dart';
import 'package:flutter_sql/domain/repositories/repository.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

final repository = _getIt<Repository>();

Future<void> serviceLocator() async => setupSync();

void setupSync() {
  _getIt.registerSingleton<LocalDataSource>(LocalDataSourceSqlFlightImpl());

  _getIt.registerSingleton<Repository>(RepositoryImpl(
    localDataSource: _getIt<LocalDataSource>(),
  ));
}
