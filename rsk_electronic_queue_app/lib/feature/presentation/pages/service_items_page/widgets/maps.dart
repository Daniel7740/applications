import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rsk_electronic_queue/core/theme/images.dart';

class MyWidgetGoogleMap extends StatefulWidget {
  const MyWidgetGoogleMap({super.key});

  @override
  State<MyWidgetGoogleMap> createState() => _MyWidgetGoogleMapState();
}

class _MyWidgetGoogleMapState extends State<MyWidgetGoogleMap> {
  // долготова/широта
  static const double _defaultLat = 42.8690662;
  static const double _defaultLng = 74.6101144;
  static const CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(_defaultLat, _defaultLng), zoom: 15);
  // ignore: unused_field
  late final GoogleMapController _googleMapController;
  MapType _currentmaptyp = MapType.normal;
  final Set<Marker> _markers = {};
// карта вид со спутника и обычная
  void _changeMAPtyp() {
    setState(() {
      _currentmaptyp =
          _currentmaptyp == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

// Добовляем маркеры
  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId("default"),
          position: _defaultLocation.target,
          icon: BitmapDescriptor.defaultMarker,
          infoWindow:
              const InfoWindow(title: "Рск Банк", snippet: "71 ул. Московская"),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        onMapCreated: (controller) => _googleMapController = controller,
        initialCameraPosition: _defaultLocation,
        mapType: _currentmaptyp,
        markers: _markers,
      ),
      Container(
        padding: const EdgeInsets.only(top: 24, right: 12),
        alignment: Alignment.topRight,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                  heroTag: "minus",
                  mini: true,
                  backgroundColor: Colors.indigoAccent,
                  onPressed: _changeMAPtyp,
                  child: AppImages.minus),
              const SizedBox(height: 10),
              FloatingActionButton(
                  heroTag: "plus",
                  mini: true,
                  backgroundColor: Colors.indigoAccent,
                  onPressed: _changeMAPtyp,
                  child: AppImages.plus),
              const SizedBox(height: 10),
              FloatingActionButton(
                  heroTag: "pointer",
                  mini: true,
                  backgroundColor: Colors.indigoAccent,
                  onPressed: _addMarker,
                  child: AppImages.pointer)
            ]),
      )
    ]);
  }
}
