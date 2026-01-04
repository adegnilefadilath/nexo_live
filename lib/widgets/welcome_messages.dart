import 'package:flutter/material.dart';

class WelcomeMessages extends StatefulWidget {
  const WelcomeMessages({super.key});

  @override
  State<WelcomeMessages> createState() => _WelcomeMessagesState();
}

class _WelcomeMessagesState extends State<WelcomeMessages> {
  final List<Map<String, dynamic>> messages = [
    {
      'user': 'Mums than',
      'time': 'Just now',
      'avatar': 'https://randomuser.me/api/portraits/men/10.jpg'
    },
    {
      'user': 'Rosling',
      'time': '2 min ago',
      'avatar': 'https://randomuser.me/api/portraits/women/11.jpg'
    },
    {
      'user': 'MR BeSt*',
      'time': '5 min ago',
      'avatar': 'https://randomuser.me/api/portraits/men/12.jpg',
      'isVIP': true
    },
    {
      'user': 'Lena2023',
      'time': '10 min ago',
      'avatar': 'https://randomuser.me/api/portraits/women/13.jpg'
    },
    {
      'user': 'David_89',
      'time': '12 min ago',
      'avatar': 'https://randomuser.me/api/portraits/men/14.jpg',
      'isVIP': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Welcome Messages',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                ...messages.map((message) {
                  return _buildMessageItem(message);
                }).toList(),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: _addWelcomeMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1).withAlpha(30),
                    foregroundColor: const Color(0xFF6366F1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  icon: const Icon(Icons.add, size: 16),
                  label: const Text('Send Welcome Message'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    return GestureDetector(
      onTap: () {
        _showUserDetails(message);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(message['avatar']),
                ),
                if (message['isVIP'] == true)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.star,
                        size: 10,
                        color: Colors.black,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Welcome ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: message['user'],
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: message['isVIP'] == true
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const TextSpan(
                          text: ' to the room',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    message['time'],
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                _removeMessage(message);
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey[600],
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showUserDetails(Map<String, dynamic> user) {
    showModalBottomSheet(
      context: context,
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
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user['avatar']),
              ),
              const SizedBox(height: 16),
              Text(
                user['user'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Joined ${user['time']}',
                style: TextStyle(color: Colors.grey[400]),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Envoyer un message privé
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Send Private Message'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addWelcomeMessage() {
    final newUser = {
      'user': 'NewUser_${DateTime.now().millisecondsSinceEpoch % 1000}',
      'time': 'Now',
      'avatar': 'https://randomuser.me/api/portraits/men/${DateTime.now().second % 50}.jpg',
    };

    setState(() {
      messages.insert(0, newUser);
    });

    // Afficher un snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Welcome message sent!'),
        backgroundColor: const Color(0xFF6366F1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _removeMessage(Map<String, dynamic> message) {
    setState(() {
      messages.remove(message);
    });
  }
}