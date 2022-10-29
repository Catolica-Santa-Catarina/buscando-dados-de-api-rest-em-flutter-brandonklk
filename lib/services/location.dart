import 'package:geolocator/geolocator.dart';
import 'package:tempo_template/entity/coordinates_entity.dart';
import 'package:tempo_template/entity/location_entity.dart';
import 'package:tempo_template/services/network_helper.dart';

class Location {
  LocationEntity locationEntity = LocationEntity(0, 0);
  NetworkHelper networkHelper = NetworkHelper();
  late CoordinatesEntity coordinates;

  Future<Position> _getCurrentPosition() async {

    await _checkLocationPermission();

    Position position = await Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    return position;
  }

  Future<void> getCoordinates() async {
    Position position = await _getCurrentPosition();

    coordinates = await getLocation(position.latitude, position.longitude);
  }

  Future<void> _checkLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('O serviço de localização está desabilitado.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Sem permissão para acesso à localização');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future
          .error('A permissão para acesso a localização foi '
          'negada para sempre. Não é possível pedir permissão.');
    }
  }

  CoordinatesEntity getCoordinatesEntity() {
    return coordinates;
  }

  Future<CoordinatesEntity> getLocation(double latitude, double longitude) async {
    return await networkHelper.getData(latitude, longitude);
  }

}