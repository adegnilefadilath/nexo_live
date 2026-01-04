class User {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isOnline;
  final bool isVIP;
  final int visitors;
  final int following;
  final int followers;
  final double balance;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isOnline = false,
    this.isVIP = false,
    this.visitors = 0,
    this.following = 0,
    this.followers = 0,
    this.balance = 0.0,
  });

  User copyWith({
    String? id,
    String? name,
    String? avatarUrl,
    bool? isOnline,
    bool? isVIP,
    int? visitors,
    int? following,
    int? followers,
    double? balance,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isOnline: isOnline ?? this.isOnline,
      isVIP: isVIP ?? this.isVIP,
      visitors: visitors ?? this.visitors,
      following: following ?? this.following,
      followers: followers ?? this.followers,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'isOnline': isOnline,
      'isVIP': isVIP,
      'visitors': visitors,
      'following': following,
      'followers': followers,
      'balance': balance,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      avatarUrl: map['avatarUrl'] ?? '',
      isOnline: map['isOnline'] ?? false,
      isVIP: map['isVIP'] ?? false,
      visitors: map['visitors']?.toInt() ?? 0,
      following: map['following']?.toInt() ?? 0,
      followers: map['followers']?.toInt() ?? 0,
      balance: map['balance']?.toDouble() ?? 0.0,
    );
  }
}

class Stream {
  final String id;
  final String title;
  final String category;
  final String country;
  final int viewers;
  final bool isLive;
  final String streamerName;
  final String streamerAvatar;
  final String thumbnailUrl;

  Stream({
    required this.id,
    required this.title,
    required this.category,
    required this.country,
    this.viewers = 0,
    this.isLive = false,
    required this.streamerName,
    required this.streamerAvatar,
    required this.thumbnailUrl,
  });
}

class Country {
  final String name;
  final String flag;
  final String code;
  final int userCount;

  Country({
    required this.name,
    required this.flag,
    required this.code,
    this.userCount = 0,
  });
}