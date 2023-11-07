import 'package:flutter/material.dart';

import 'device.dart';
import '../../models/devices_model.dart';

class DevicesList extends StatelessWidget {
  final List<DevicesModel> roomDevices;

  const DevicesList({
    required this.roomDevices,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: roomDevices.length,
      itemBuilder: (context, index) {
        return Device(
          name: roomDevices[index].name,
          status: roomDevices[index].status,
        );
      },
    );
  }
}
