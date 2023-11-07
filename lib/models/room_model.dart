import 'package:flutter/material.dart';

class RoomModel {
  final String id;
  final String title;
  final IconData icon;
  final List<String> deviceIds;

  RoomModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.deviceIds,
  });
}
