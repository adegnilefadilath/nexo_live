import 'package:flutter/material.dart';

class VisitorsSection extends StatefulWidget {
  const VisitorsSection({super.key});

  @override
  State<VisitorsSection> createState() => _VisitorsSectionState();
}

class _VisitorsSectionState extends State<VisitorsSection> {
  final List<Map<String, dynamic>> visitors = [
    {
      'name': 'Jozeb',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'isOnline': true,
      'isVIP': true
    },
    {
      'name': 'Leslie',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'isOnline': true,
      'isVIP': false
    },
    {
      'name': 'Devon',
      'avatar': 'https://randomuser.me/api/portraits/men/3.jpg',
      'isOnline': false,
      'isVIP': true
    },
    {
      'name': 'Eleanor',
      'avatar': 'https://randomuser.me/api/portraits/women/4.jpg',
      'isOnline': true,
      'isVIP': false
    },
    {
      'name': 'Robert',
      'avatar': 'https://randomuser.me/api/portraits/men/5.jpg',
      'isOnline': true,
      'isVIP': true
    },
    {
      'name': 'Sophia',
      'avatar': 'https://randomuser.me/api/portraits/women/6.jpg',
      'isOnline': false,
      'isVIP': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recent Visitors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  _showAllVisitors(context);
                },
                child: const Text(
                  'See All',
                  style: TextStyle(color: Color(0xFF6366F1)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: visitors.length,
              itemBuilder: (context, index) {
                final visitor = visitors[index];
                return GestureDetector(
                  onTap: () {
                    _showVisitorProfile(context, visitor);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundImage: NetworkImage(visitor['avatar']),
                            ),
                            if (visitor['isVIP'])
                              Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.star,
                                    size: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            if (visitor['isOnline'])
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          visitor['name'],
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                        if (visitor['isVIP'])
                          Container(
                            margin: const EdgeInsets.only(top: 2),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              color: Colors.amber.withAlpha(30),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'VIP',
                              style: TextStyle(
                                color: Colors.amber,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAllVisitors(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1E293B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'All Visitors',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: visitors.length,
                  itemBuilder: (context, index) {
                    final visitor = visitors[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(visitor['avatar']),
                      ),
                      title: Text(
                        visitor['name'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        visitor['isOnline'] ? 'Online' : 'Offline',
                        style: TextStyle(
                          color: visitor['isOnline']
                              ? Colors.green
                              : Colors.grey,
                        ),
                      ),
                      trailing: visitor['isVIP']
                          ? const Icon(Icons.verified,
                              color: Colors.amber, size: 20)
                          : null,
                      onTap: () {
                        Navigator.pop(context);
                        _showVisitorProfile(context, visitor);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showVisitorProfile(
      BuildContext context, Map<String, dynamic> visitor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1E293B),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(visitor['avatar']),
              ),
              const SizedBox(height: 16),
              Text(
                visitor['name'],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: visitor['isOnline'] ? Colors.green : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    visitor['isOnline'] ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: visitor['isOnline'] ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
              if (visitor['isVIP']) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.amber.withAlpha(30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'VIP Member',
                        style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6366F1),
                  ),
                  child: const Text('Close'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}