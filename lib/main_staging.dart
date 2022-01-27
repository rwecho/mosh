import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:mosh/bootstrap.dart';
import 'package:local_storage_todos_api/local_storage_todos_api.dart';

Future<void> main() async {
  FlutterServicesBinding.ensureInitialized();

  final todosApi = LocalStorageTodosApi(
    plugin: await SharedPreferences.getInstance(),
  );

  bootstrap(todosApi: todosApi);
}
