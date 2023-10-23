import 'package:flutter/material.dart';

import 'widgets/room_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Trevor's House",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        actions: [
          Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.primary,
              size: 40.0,
            ),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: const Alignment(0, 0),
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: 80.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 120,
                    // padding: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: BorderRadius.circular(15.0),
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.15),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '27\u2103',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'House temperature',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.white.withOpacity(0.25),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '3',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Devices on',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.25),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const RoomList(),
          ],
        ),
      ),
    );
  }
}
