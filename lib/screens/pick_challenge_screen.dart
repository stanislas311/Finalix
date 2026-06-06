import 'package:flutter/material.dart';
import 'plan_success_screen.dart';

class PickChallengeScreen extends StatelessWidget {
  const PickChallengeScreen({super.key});

  // Femme fitness fond sombre — Unsplash libre de droits
  static const String workoutImageUrl =
      'https://images.unsplash.com/photo-1518310383802-640c2de311b2?w=600&q=80';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Bouton retour ───
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.chevron_left,
                      color: Colors.black, size: 26),
                ),
              ),

              const SizedBox(height: 22),

              // ─── Titre ───
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 30, color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'Pick a ',
                        style: TextStyle(fontWeight: FontWeight.w300)),
                    TextSpan(
                        text: 'Challenge',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ─── Image workout ───
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.network(
                        workoutImageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, progress) =>
                            progress == null
                                ? child
                                : Container(
                                    color: const Color(0xFF2A2A2A),
                                    child: const Center(
                                        child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2)),
                                  ),
                        errorBuilder: (_, __, ___) => Container(
                            color: const Color(0xFF2A2A2A),
                            child: const Icon(Icons.fitness_center,
                                size: 60, color: Colors.white30)),
                      ),
                      // Dégradé bas
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.55),
                            ],
                            stops: const [0.4, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // ─── Avatars + users ───
              Row(
                children: [
                  SizedBox(
                    width: 66,
                    height: 30,
                    child: Stack(
                      children: [
                        _avatar(0, 'https://i.pravatar.cc/50?img=11'),
                        _avatar(20, 'https://i.pravatar.cc/50?img=47'),
                        _avatar(40, 'https://i.pravatar.cc/50?img=32'),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text('+ 160k users',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500)),
                ],
              ),

              const SizedBox(height: 10),

              // ─── Titre workout ───
              const Text('Full body workout',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),

              const SizedBox(height: 6),

              Text(
                'Start shaping your body today with compound exercises that target multiple muscles for a full-body workout.',
                style: TextStyle(
                    fontSize: 13, color: Colors.grey[500], height: 1.5),
              ),

              const SizedBox(height: 24),

              // ─── Bouton Continue ───
              SizedBox(
                width: double.infinity,
                height: 58,
                child: ElevatedButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(
                          builder: (_) => const PlanSuccessScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32)),
                    elevation: 0,
                  ),
                  child: const Text('Continue',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700)),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _avatar(double left, String url) {
    return Positioned(
      left: left,
      child: Container(
        width: 28,
        height: 28,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: ClipOval(
          child: Image.network(url,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  Container(color: Colors.grey[300])),
        ),
      ),
    );
  }
}