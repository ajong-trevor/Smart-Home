import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/devices_list.dart';
import '../services/devices_services.dart';
import '../models/devices_model.dart';
import 'widgets/room_lamp.dart';

class RoomView extends StatefulWidget {
  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  var data = Get.arguments;
  List<DevicesModel> roomDevices = [];

  @override
  Widget build(BuildContext context) {
    final List<String> roomDeviceIds = data['deviceIds'];

    for (var roomDeviceId in roomDeviceIds) {
      List<DevicesModel> selectedRoomDevices = devices.where((device) {
        return roomDeviceId == device.id;
      }).toList();

      roomDevices.add(selectedRoomDevices.first);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.background,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Text(
              data['title'],
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).colorScheme.background,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RoomLamp(
              title: data['title'],
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 20.0,
              ),
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 10,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    data['icons'],
                    color: Theme.of(context).colorScheme.primary,
                    size: 80.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Devices on',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              '0',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Text(
                            'Devices off',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              '4',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DevicesList(
              roomDevices: roomDevices,
            ),
          ],
        ),
      ),
    );
  }
}
