import 'package:flutter/material.dart';

import '../../model/profile_tile_model.dart';
import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key, required this.profile});

  final ProfileData profile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F7FB),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          '${profile.name} Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              const SizedBox(height: 32),
              CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primary,
                child: Text(
                  profile.name.isEmpty ? '?' : profile.name[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                profile.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Text(
                profile.position,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              ...profile.tiles.map(
                (tile) => ProfileTile(
                  icon: tile.icon,
                  title: tile.title,
                  data: tile.value,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
