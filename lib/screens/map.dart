import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:api_test/models/user.dart';

class MapScren extends StatefulWidget {
  const MapScren({super.key, required this.user});
  final User user;

  @override
  State<MapScren> createState() => _MapScrenState();
}

class _MapScrenState extends State<MapScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.user.fullName}'s Location")),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(
            double.parse(widget.user.lat),
            double.parse(widget.user.long),
          ),
          initialZoom: 5,
          minZoom: 1,
          maxZoom: 18,
          interactionOptions: const InteractionOptions(
            flags:
                InteractiveFlag.doubleTapZoom |
                InteractiveFlag.pinchZoom |
                InteractiveFlag.drag,
          ),
          cameraConstraint: CameraConstraint.contain(
            bounds: LatLngBounds(LatLng(-85.0, -180.0), LatLng(85.0, 180.0)),
          ),
          keepAlive: true,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.api_test',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                alignment: Alignment.center,
                point: LatLng(
                  double.parse(widget.user.lat),
                  double.parse(widget.user.long),
                ),
                child: Icon(Icons.location_on, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
