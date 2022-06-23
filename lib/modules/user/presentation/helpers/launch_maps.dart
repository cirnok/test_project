import 'package:maps_launcher/maps_launcher.dart';
import 'package:test_project/modules/user/domain/domain.dart';

void launchMapsUrl(Geo geo) async {
  MapsLauncher.launchCoordinates(geo.lat, geo.lng);
}
