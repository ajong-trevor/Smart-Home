import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Room extends StatelessWidget {
  const Room({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/room');
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
              Icons.chair_rounded,
              color: Theme.of(context).colorScheme.background,
              size: 58.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                'Living Room',
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
                '8 Devices',
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
