import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SharedPreferencesPackage extends StatefulWidget {
  const SharedPreferencesPackage({super.key});

  @override
  State<SharedPreferencesPackage> createState() =>
      _SharedPreferencesPackageState();
}

class _SharedPreferencesPackageState extends State<SharedPreferencesPackage> {
  String retrievedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shared Preferences Package')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferencesService service =
                        SharedPreferencesService();
                    await service.saveData('name', 'Zakaria');
                  },
                  child: const Text('Save Data'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferencesService service =
                        SharedPreferencesService();
                    String value = await service.getData('name') ?? '';
                    setState(() {
                      retrievedValue = value;
                    });
                    print('Retrieved value: $value');
                  },
                  child: const Text('Retrieve Data'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    SharedPreferencesService service =
                        SharedPreferencesService();
                    await service.removeData('name');
                    print('Data removed');
                  },
                  child: const Text('Remove Data'),
                ),
                const SizedBox(height: 20),
                Text(
                  retrievedValue.isEmpty
                      ? 'No data retrieved yet.'
                      : 'Retrieved value: $retrievedValue',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SharedPreferencesService {
  Future<void> saveData(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> removeData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
