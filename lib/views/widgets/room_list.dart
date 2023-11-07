import 'package:flutter/material.dart';

import 'room.dart';
import '../../services/room_services.dart';

class RoomList extends StatelessWidget {
  const RoomList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 100.0,
        bottom: 20.0,
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.75 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return Room(
            roomId: rooms[index].id,
            title: rooms[index].title,
            icons: rooms[index].icon,
            deviceIds: rooms[index].deviceIds,
          );
        },
      ),
    );
  }
}
