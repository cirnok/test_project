import 'package:maps_launcher/maps_launcher.dart';
import 'package:test_project/modules/user/domain/domain.dart';

void launchMapsUrl(Geo geo) async {
  MapsLauncher.launchCoordinates(double.parse(geo.lat), double.parse(geo.lng));
}
