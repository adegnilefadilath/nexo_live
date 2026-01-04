import 'package:nexo_live/utils/app_theme.dart';
import 'package:flutter/material.dart';

class InteractiveButton extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final bool isAnimated;

  const InteractiveButton({
    super.key,
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
    this.isAnimated = true,
  });

  @override
  State<InteractiveButton> createState() => _InteractiveButtonState();
}

class _InteractiveButtonState extends State<InteractiveButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    if (widget.isAnimated) {
      setState(() {
        _isPressed = true;
      });
      _animationController.forward();
    }
  }

  void _onTapUp(TapUpDetails details) {
    if (widget.isAnimated) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
    widget.onPressed();
  }

  void _onTapCancel() {
    if (widget.isAnimated) {
      setState(() {
        _isPressed = false;
      });
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: widget.color.withAlpha(_isPressed ? 100 : 30),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.color.withAlpha(_isPressed ? 200 : 100),
            ),
            boxShadow: _isPressed
                ? [
                    BoxShadow(
                      color: widget.color.withAlpha(100),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                color: widget.color,
                size: 28,
              ),
              const SizedBox(height: 8),
              Text(
                widget.label,
                style: TextStyle(
                  color: widget.color,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowButton extends StatefulWidget {
  final bool isFollowing;
  final VoidCallback onPressed;

  const FollowButton({
    super.key,
    required this.isFollowing,
    required this.onPressed,
  });

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: widget.isFollowing
            ? Colors.grey.withAlpha(50)
            : AppTheme.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: widget.isFollowing ? Colors.grey : AppTheme.primaryColor,
        ),
      ),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.isFollowing ? Icons.check : Icons.add,
              size: 16,
              color: widget.isFollowing ? Colors.grey : Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              widget.isFollowing ? 'Following' : 'Follow',
              style: TextStyle(
                color: widget.isFollowing ? Colors.grey : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  final int likeCount;
  final bool isLiked;
  final VoidCallback onPressed;

  const LikeButton({
    super.key,
    required this.likeCount,
    required this.isLiked,
    required this.onPressed,
  });

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.withAlpha(20),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.isLiked ? Icons.favorite : Icons.favorite_border,
              size: 16,
              color: widget.isLiked ? Colors.red : Colors.grey,
            ),
            const SizedBox(width: 4),
            Text(
              widget.likeCount.toString(),
              style: TextStyle(
                color: widget.isLiked ? Colors.red : Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}