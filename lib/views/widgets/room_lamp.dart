import 'package:flutter/material.dart';

class RoomLamp extends StatefulWidget {
  final String title;
  const RoomLamp({required this.title, super.key});

  @override
  State<RoomLamp> createState() => _RoomLampState();
}

class _RoomLampState extends State<RoomLamp> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 20.0),
                child: Text(
                  '${widget.title} Lights',
                  style: const TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.clip,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Transform.scale(
                  scale: 1.5,
                  child: Switch(
                    activeColor: Theme.of(context).colorScheme.background,
                    activeTrackColor: Theme.of(context).colorScheme.primary,
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
        ),
      ],
    );
  }
}
