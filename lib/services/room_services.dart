import 'package:flutter/material.dart';
import '../models/room_model.dart';

final List<RoomModel> rooms = [
  RoomModel(
    id: 'R001',
    title: 'Living Room',
    icon: Icons.chair_rounded,
    deviceIds: ['D001', 'D003', 'D004'],
  ),
  RoomModel(
    id: 'R002',
    title: 'Kitchen',
    icon: Icons.kitchen,
    deviceIds: ['D001', 'D002'],
  ),
  RoomModel(
    id: 'R003',
    title: 'Bath Room',
    icon: Icons.bathroom_rounded,
    deviceIds: ['D001', 'D002', 'D003', 'D004'],
  ),
  RoomModel(
    id: 'R004',
    title: 'Lundray Room',
    icon: Icons.local_laundry_service_rounded,
    deviceIds: ['D001', 'D002', 'D003'],
  ),
  RoomModel(
    id: 'R005',
    title: 'Garage',
    icon: Icons.garage_rounded,
    deviceIds: ['D001'],
  ),
  RoomModel(
    id: 'R006',
    title: 'Bed Room',
    icon: Icons.bedroom_parent_rounded,
    deviceIds: ['D001', 'D002', 'D003', 'D004'],
  ),
];
