import 'package:app_valtx_asistencia/app/ui/views/home/home_controller.dart';
import 'package:app_valtx_asistencia/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

GoogleMapController? mapController;
void _onMapCreated(GoogleMapController controller) {
  //controller.setMapStyle(AppColors.mapStyles);
  mapController = controller;
}

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Obx(
        () {
          mapController?.moveCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: controller.currentLocation.value,
                zoom: 18.0,
              ),
            ),
          );
          return GoogleMap( 
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            myLocationEnabled: true,
            indoorViewEnabled: true,
            compassEnabled: false,
            myLocationButtonEnabled: false,
            //tiltGesturesEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: controller.currentLocation.value,
              zoom: 18.0,
            ),
            markers: {
              /* Marker(
                markerId: const MarkerId('current_location'),
                position: controller.currentLocation.value,
              ), */
              Marker(
                markerId: const MarkerId("lugarEspecifico"),
                position: controller.workPosition,
                infoWindow: const InfoWindow(title: "Trabajo"),
                icon: controller.iconMap,
              ),
            },
            circles: {
              Circle(
                circleId:const CircleId("circuloLugarEspecifico"),
                center: controller.workPosition,
                radius: 50,
                fillColor: AppColors.radiusMap,
                strokeColor: AppColors.primary,
                strokeWidth: 2,
              ),
            },
          );
        },
      ),
    );
  }
}
