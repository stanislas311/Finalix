import 'package:flutter/material.dart';
import 'pick_challenge_screen.dart';

class ProgramPlanScreen extends StatelessWidget {
  const ProgramPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ══════════════════════════════
              // HEADER : Titre + Photo homme
              // ══════════════════════════════
              SizedBox(
                height: 220,
                child: Stack(
                  children: [
                    // Photo à droite
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      width: 175,
                      child: Image.asset(
                        'assets/images/hero_man.png',
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Image.network(
                          'https://images.unsplash.com/photo-1567013127542-490d757e6349?w=400&q=80',
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            color: const Color(0xFFEEEEEE),
                            child: const Icon(Icons.person,
                                size: 80, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    // Titre à gauche
                    Positioned(
                      left: 24,
                      bottom: 24,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Fitness',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w300,
                                color: Color(0xFF666666),
                                height: 1.1,
                              )),
                          Text('Program',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                height: 1.1,
                              )),
                          Text('Plan',
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                                height: 1.1,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ══════════════════════════════
              // STAT CARDS
              // ══════════════════════════════
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                child: Column(
                  children: [
                    _StatCard(
                      emoji: '😊',
                      bg: const Color(0xFFFFF8E1),
                      title: "5'11, 140 lbs",
                      subtitle: 'Body assessment',
                      hasCheck: true,
                    ),
                    const SizedBox(height: 8),
                    _StatCard(
                      emoji: '🔥',
                      bg: const Color(0xFFFFECE0),
                      title: '2 658 kcal',
                      subtitle: 'Calorie estimate',
                    ),
                    const SizedBox(height: 8),
                    _StatCard(
                      emoji: '💪',
                      bg: const Color(0xFFE8F5E9),
                      title: 'Full body',
                      subtitle: 'Workout focus',
                    ),
                    const SizedBox(height: 8),
                    _StatCard(
                      emoji: '🏃',
                      bg: const Color(0xFFE3F2FD),
                      title: 'Beginner',
                      subtitle: 'Fitness adjustment',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ══════════════════════════════
              // BARRE DE PROGRESSION
              // ══════════════════════════════
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 11, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('24%',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LinearProgressIndicator(
                            value: 0.24,
                            backgroundColor: const Color(0xFFEEEEEE),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFF7DC67E)),
                            minHeight: 9,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ══════════════════════════════
              // BOUTON GET STARTED
              // ══════════════════════════════
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const PickChallengeScreen()),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      elevation: 0,
                    ),
                    child: const Text('Get Started',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ══════════════════════════════════════
// WIDGET CARTE STATISTIQUE
// ══════════════════════════════════════
class _StatCard extends StatelessWidget {
  final String emoji;
  final Color bg;
  final String title;
  final String subtitle;
  final bool hasCheck;

  const _StatCard({
    required this.emoji,
    required this.bg,
    required this.title,
    required this.subtitle,
    this.hasCheck = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
                color: bg, borderRadius: BorderRadius.circular(10)),
            child:
                Center(child: Text(emoji, style: const TextStyle(fontSize: 18))),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)),
                Text(subtitle,
                    style:
                        TextStyle(fontSize: 12, color: Colors.grey[500])),
              ],
            ),
          ),
          if (hasCheck)
            Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                  color: Color(0xFF7DC67E), shape: BoxShape.circle),
              child: const Icon(Icons.check, color: Colors.white, size: 14),
            ),
        ],
      ),
    );
  }
}