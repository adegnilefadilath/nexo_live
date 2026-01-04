import 'package:flutter/material.dart';
import '../widgets/user_card.dart';
import '../widgets/countries_section.dart';
import '../widgets/trending_section.dart';
import '../widgets/visitors_section.dart';
import '../widgets/welcome_messages.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0F172A),
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Carte utilisateur
            const UserCard(),
            
            // Section des pays
            const CountriesSection(),
            
            // Section Trending
            const TrendingSection(),
            
            // Section Visitors
            const VisitorsSection(),
            
            // Messages de bienvenue
            const WelcomeMessages(),
            
            // Section VIP & Money
            _buildVIPSection(),
            
            // Section Creator Tools
            _buildCreatorSection(),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildVIPSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'VIP Family & Money',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildVIPItem('VIP 1', Icons.verified, Colors.amber),
              _buildVIPItem('VIP 2', Icons.diamond_outlined, Colors.blue),
              _buildVIPItem('VIP 3', Icons.star, Colors.purple),
            ],
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              // Ouvrir la page du portefeuille
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(50),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(Icons.attach_money, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Balance: \$1,250.75',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVIPItem(String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Voir les détails du VIP
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withAlpha(50),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Creator Tools',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildCreatorTool('Creator Center', Icons.design_services),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildCreatorTool('Event Center', Icons.event),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildCreatorTool('Wallet', Icons.account_balance_wallet),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCreatorTool(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        _showCreatorToolDetails(title);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF334155)),
        ),
        child: Column(
          children: [
            Icon(icon, color: const Color(0xFF6366F1), size: 28),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showCreatorToolDetails(String toolName) {
    showModalBottomSheet(
      context: BuildContexts.currentContext!,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                _getToolIcon(toolName),
                color: const Color(0xFF6366F1),
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                toolName,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                _getToolDescription(toolName),
                style: TextStyle(color: Colors.grey[400]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Ouvrir l'outil
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Open Tool'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  IconData _getToolIcon(String toolName) {
    switch (toolName) {
      case 'Creator Center':
        return Icons.design_services;
      case 'Event Center':
        return Icons.event;
      case 'Wallet':
        return Icons.account_balance_wallet;
      default:
        return Icons.settings;
    }
  }

  String _getToolDescription(String toolName) {
    switch (toolName) {
      case 'Creator Center':
        return 'Manage your content, analytics, and creator settings';
      case 'Event Center':
        return 'Create and manage live events, schedule streams';
      case 'Wallet':
        return 'View balance, transactions, and manage payments';
      default:
        return 'Tool details';
    }
  }
}

// Classe utilitaire pour accéder au contexte depuis un StatelessWidget
class BuildContexts {
  static BuildContext? currentContext;
  
  static void setContext(BuildContext context) {
    currentContext = context;
  }
}