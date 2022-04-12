import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';

class PayuAssembler {
  final _container = GetIt.instance;

  String _instanceName(String? name) => '${runtimeType.toString()}_${name ?? ''}';

  @mustCallSuper
  void assemble() {}

  @mustCallSuper
  void dispose() {}

  void register<Dependency extends Object>(Dependency Function() foo, {String? name}) {
    _container.registerLazySingleton<Dependency>(() => foo(), instanceName: _instanceName(name));
  }

  void unregister<Dependency extends Object>({String? name}) {
    _container.unregister<Dependency>(instanceName: _instanceName(name));
  }

  Dependency find<Dependency extends Object>({String? name}) {
    return _container<Dependency>(instanceName: _instanceName(name));
  }
}
