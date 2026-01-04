import 'package:flutter/material.dart';

class CustomAnimations {
  // Animation de fade in
  static Widget fadeInAnimation(Widget child, Duration duration) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Animation de slide
  static Widget slideAnimation(Widget child, Duration duration, Offset offset) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween<Offset>(begin: offset, end: Offset.zero),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Animation de scale
  static Widget scaleAnimation(Widget child, Duration duration) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.8, end: 1.0),
      duration: duration,
      curve: Curves.elasticOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Animation pour les cartes
  static Widget cardAnimation(Widget child, int index) {
    return slideAnimation(
      fadeInAnimation(
        child,
        Duration(milliseconds: 300 + (index * 100)),
      ),
      Duration(milliseconds: 400 + (index * 100)),
      const Offset(0, 50),
    );
  }

  // Animation de pulsation pour les éléments LIVE
  static Widget pulseAnimation(Widget child) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.9, end: 1.1),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOut,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Animation de shimmer pour le loading
  static Widget shimmerAnimation(double width, double height) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}