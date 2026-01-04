import 'package:nexo_live/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_data_provider.dart';
import '../utils/animations.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AppDataProvider>().currentUser;

    return CustomAnimations.cardAnimation(
      Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: AppTheme.primaryGradient,
          borderRadius: BorderRadius.circular(16),
          boxShadow: AppTheme.cardShadow,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                    if (user.isOnline)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppTheme.successColor,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          if (user.isVIP) ...[
                            const SizedBox(width: 8),
                            const Icon(Icons.verified,
                                color: Colors.amber, size: 16),
                          ],
                        ],
                      ),
                      Text(
                        'ID: ${user.id}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                CustomAnimations.pulseAnimation(
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: AppTheme.liveBadgeDecoration,
                    child: const Text(
                      'LIVE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(user.visitors.toString(), 'Visitors'),
                _buildStatItem(user.following.toString(), 'Following'),
                _buildStatItem(user.followers.toString(), 'Followers'),
              ],
            ),
          ],
        ),
      ),
      0,
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          _formatNumber(value),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  String _formatNumber(String value) {
    final num = int.tryParse(value) ?? 0;
    if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(1)}K';
    }
    return value;
  }
}