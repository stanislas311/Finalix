import 'package:flutter/material.dart';

class PlanSuccessScreen extends StatefulWidget {
  const PlanSuccessScreen({super.key});

  @override
  State<PlanSuccessScreen> createState() => _PlanSuccessScreenState();
}

class _PlanSuccessScreenState extends State<PlanSuccessScreen> {
  int selectedDay = 1;

  // Données graphique : poids décroissants vers l'objectif
  final List<_WeightBar> bars = const [
    _WeightBar(label: '140\nlbs', value: 1.0),
    _WeightBar(label: '137\nlbs', value: 0.85),
    _WeightBar(label: '134\nlbs', value: 0.70),
    _WeightBar(label: '132\nlbs', value: 0.58),
    _WeightBar(label: '130\nlbs', value: 0.46),
  ];

  final List<String> dayHeaders = ['SU', 'MO', 'TU', 'WE', 'TH', 'FR', 'SA'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ─── Header ───
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.w300),
                  children: [
                    TextSpan(text: 'Plan for '),
                    TextSpan(
                        text: 'Success',
                        style: TextStyle(fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  children: [
                    TextSpan(text: 'Reach '),
                    TextSpan(
                        text: '130 lbs',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                    TextSpan(text: ' by '),
                    TextSpan(
                        text: '31 December',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black87)),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // ─── Graphique ───
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 3))
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 110,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: bars.map((b) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 600),
                                width: 42,
                                height: 100 * b.value,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF7DC67E),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: bars
                          .map((b) => Text(b.label,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey[500],
                                  height: 1.4)))
                          .toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ─── Badge 85% ───
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2))
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFFF9C4),
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(
                          child: Text('💡', style: TextStyle(fontSize: 20))),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                              fontSize: 13, color: Colors.black87, height: 1.4),
                          children: [
                            TextSpan(
                                text: '85%',
                                style: TextStyle(fontWeight: FontWeight.w800)),
                            TextSpan(text: ' of users lost '),
                            TextSpan(
                                text: '10+ lbs',
                                style: TextStyle(fontWeight: FontWeight.w800)),
                            TextSpan(text: '\nwith our app'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ─── 30-day Shred ───
              const Text('30-day Shred',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black)),

              const SizedBox(height: 14),

              // ─── Calendrier ───
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 12,
                        offset: const Offset(0, 3))
                  ],
                ),
                child: Column(
                  children: [
                    // En-têtes jours
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: dayHeaders
                          .map((d) => SizedBox(
                                width: 34,
                                child: Text(d,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey[400])),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 12),

                    // Semaine 1 (décalée : commence lundi)
                    _buildWeekRow([null, 1, 2, 3, 4, 5, 6]),
                    const SizedBox(height: 6),

                    // Semaine 2
                    _buildWeekRow([7, 8, 9, 10, 11, 12, 13]),
                    const SizedBox(height: 16),

                    // Bouton Get a Plan
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28)),
                          elevation: 0,
                        ),
                        child: const Text('Get a Plan',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Semaine 3
                    _buildWeekRow([21, 22, 23, 24, 25, 26, 27]),
                  ],
                ),
              ),

              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeekRow(List<int?> days) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days.map((day) {
        if (day == null) return const SizedBox(width: 34, height: 34);
        final bool isSelected = day == selectedDay;
        return GestureDetector(
          onTap: () => setState(() => selectedDay = day),
          child: Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w400,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _WeightBar {
  final String label;
  final double value; // 0.0 → 1.0
  const _WeightBar({required this.label, required this.value});
}