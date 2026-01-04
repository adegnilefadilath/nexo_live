import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AppDataProvider extends ChangeNotifier {
  // Données utilisateur actuel
  User _currentUser = User(
    id: '50753432258',
    name: 'Darrell Steward',
    avatarUrl: 'https://randomuser.me/api/portraits/men/41.jpg',
    isOnline: true,
    isVIP: true,
    visitors: 2000,
    following: 1000,
    followers: 10000,
    balance: 1250.75,
  );

  // Liste des pays
  final List<Country> _countries = [
    Country(name: 'Saudi Arabia', flag: '🇸🇦', code: 'SA', userCount: 45200),
    Country(name: 'USA', flag: '🇺🇸', code: 'US', userCount: 120500),
    Country(name: 'India', flag: '🇮🇳', code: 'IN', userCount: 89700),
  ];

  // Liste des streams trending
  final List<Stream> _trendingStreams = [
    Stream(
      id: '1',
      title: 'Music Festival Live',
      category: 'Music',
      country: 'Philippines',
      viewers: 15300,
      isLive: true,
      streamerName: 'DJ_Philippines',
      streamerAvatar: 'https://randomuser.me/api/portraits/men/1.jpg',
      thumbnailUrl: 'https://picsum.photos/300/200?random=1',
    ),
    Stream(
      id: '2',
      title: 'Gaming Tournament',
      category: 'Gaming',
      country: 'Colombia',
      viewers: 8700,
      isLive: true,
      streamerName: 'Gamer_Col',
      streamerAvatar: 'https://randomuser.me/api/portraits/men/2.jpg',
      thumbnailUrl: 'https://picsum.photos/300/200?random=2',
    ),
    Stream(
      id: '3',
      title: 'Art Workshop',
      category: 'Art',
      country: 'Iran',
      viewers: 6200,
      isLive: true,
      streamerName: 'Artist_IR',
      streamerAvatar: 'https://randomuser.me/api/portraits/women/3.jpg',
      thumbnailUrl: 'https://picsum.photos/300/200?random=3',
    ),
  ];

  // Getters
  User get currentUser => _currentUser;
  List<Country> get countries => _countries;
  List<Stream> get trendingStreams => _trendingStreams;

  // Méthodes pour mettre à jour les données
  void updateUserBalance(double newBalance) {
    _currentUser = _currentUser.copyWith(balance: newBalance);
    notifyListeners();
  }

  void followUser() {
    _currentUser = _currentUser.copyWith(following: _currentUser.following + 1);
    notifyListeners();
  }

  void addVisitor() {
    _currentUser = _currentUser.copyWith(visitors: _currentUser.visitors + 1);
    notifyListeners();
  }

  void toggleOnlineStatus() {
    _currentUser = _currentUser.copyWith(isOnline: !_currentUser.isOnline);
    notifyListeners();
  }

  // Méthodes pour les pays
  Country getCountryByCode(String code) {
    return _countries.firstWhere(
      (country) => country.code == code,
      orElse: () => Country(name: 'Unknown', flag: '🏳️', code: 'UN'),
    );
  }

  // Méthodes pour les streams
  Stream getStreamById(String id) {
    return _trendingStreams.firstWhere(
      (stream) => stream.id == id,
      orElse: () => Stream(
        id: '0',
        title: 'Unknown Stream',
        category: 'Unknown',
        country: 'Unknown',
        streamerName: 'Unknown',
        streamerAvatar: '',
        thumbnailUrl: '',
      ),
    );
  }

  void incrementStreamViewers(String streamId) {
    notifyListeners();
  }
}