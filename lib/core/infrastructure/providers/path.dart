import 'package:path_provider/path_provider.dart';
import 'package:test_project/core/infrastructure/infrastructure.dart';

final pathProvider = Provider<String>((ref) {
  throw Exception('Provider was not initialized');
});

Future<String> initPathProvider() async {
  final appDocDir = await getApplicationDocumentsDirectory();
  return appDocDir.path;
}
