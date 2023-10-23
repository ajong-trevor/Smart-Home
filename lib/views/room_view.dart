import 'package:flutter/material.dart';

import 'widgets/devices_list.dart';

class RoomView extends StatefulWidget {
  const RoomView({super.key});

  @override
  State<RoomView> createState() => _RoomViewState();
}

class _RoomViewState extends State<RoomView> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
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
              'Living Room',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 30.0, horizontal: 20.0),
                        child: Text(
                          'Living Room Lights',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Switch(
                            activeColor:
                                Theme.of(context).colorScheme.background,
                            activeTrackColor:
                                Theme.of(context).colorScheme.primary,
                            inactiveTrackColor: Colors.transparent,
                            materialTapTargetSize: MaterialTapTargetSize.padded,
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  alignment: const Alignment(0, 0),
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.35,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage('assets/images/Table-Lamp.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    if (isSwitched)
                      Positioned(
                        bottom: 11.5,
                        left: 27,
                        child: Container(
                          width: 120,
                          height: 110,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.orangeAccent,
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                )
              ],
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
                  Icon(Icons.chair_rounded,
                      color: Theme.of(context).colorScheme.primary, size: 80.0),
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
                  )
                ],
              ),
            ),
            const DevicesList(),
          ],
        ),
      ),
    );
  }
}
