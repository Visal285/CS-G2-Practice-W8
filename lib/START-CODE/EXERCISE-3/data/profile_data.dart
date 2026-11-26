import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Von Visal",
  position: "Flutter Developer",
  avatarUrl: '',
  tiles: [
    TileData(icon: Icons.phone, title: "Phone Number", value: "081 758 742"),
    TileData(
      icon: Icons.location_on,
      title: "Address",
      value: "Prek Pnov, Cambodia",
    ),
    TileData(icon: Icons.email, title: "Email", value: "visal.von@student.cadt.edu.kh"),
    TileData(icon: Icons.school, title: "School", value: "CADT"),
    TileData(
      icon: Icons.code,
      title: "Specialization",
      value: "Mobile Development",
    ),
  ],
);
