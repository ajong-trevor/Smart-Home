import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Room extends StatelessWidget {
  final String title;
  final IconData icons;
  final List<String> deviceIds;
  final String roomId;

  const Room({
    required this.icons,
    required this.deviceIds,
    required this.title,
    required this.roomId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = {
      'title': title,
      'icons': icons,
      'deviceIds': deviceIds,
      'roomId': roomId,
    };

    return GestureDetector(
      onTap: () {
        Get.toNamed('/room', arguments: data);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons,
              color: Theme.of(context).colorScheme.background,
              size: 58.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.background,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                '${deviceIds.length} Devices',
                style: TextStyle(
                  color: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(0.75),
                ),
              ),
            ),
            Icon(
              Icons.arrow_circle_right,
              color: Colors.white.withOpacity(0.25),
            ),
          ],
        ),
      ),
    );
  }
}
