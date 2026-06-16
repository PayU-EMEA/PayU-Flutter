import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../example/backend/data/repositories/settings_repository.dart';

class SettingsFeaturesPage extends StatefulWidget {
  const SettingsFeaturesPage({super.key});

  @override
  State<SettingsFeaturesPage> createState() => _SettingsFeaturesPageState();
}

class _SettingsFeaturesPageState extends State<SettingsFeaturesPage> {
  late final SettingsRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = Get.find<SettingsRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Features'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Card installments'),
            subtitle: const Text('Enable card installments options fetching'),
            value: _repository.cardInstallments,
            onChanged: (value) async {
              await _repository.setCardInstallments(value);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}

