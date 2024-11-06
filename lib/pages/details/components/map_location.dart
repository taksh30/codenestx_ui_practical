import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapLocation extends StatelessWidget {
  const MapLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2.0),
        ),
        child: FlutterMap(
          options: const MapOptions(
            initialCenter: LatLng(20.5937, 78.9629),
            initialZoom: 15.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: const ['a', 'b', 'c'],
            ),
            const MarkerLayer(
              markers: [
                Marker(
                  point: LatLng(20.5937, 78.9629),
                  child: Icon(
                    Icons.location_pin,
                    color: Colors.green,
                    size: 36,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
