import 'package:flutter/material.dart';

import '../theme/arcade_colors.dart';
import '../widgets/arcade_button.dart';
import '../widgets/brick_backdrop.dart';

class TeamMember {
  const TeamMember({
    required this.name,
    required this.role,
    required this.color,
  });

  final String name;
  final String role;
  final Color color;

  String get initials {
    final parts = name.split(' ').where((p) => p.isNotEmpty).toList();
    if (parts.length == 1) return parts.first.substring(0, 1);
    return '${parts.first[0]}${parts[1][0]}'.toUpperCase();
  }
}

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  static const members = [
    TeamMember(
      name: 'Cristian Morés Dalcin',
      role: 'PROGRAMAÇÃO',
      color: ArcadeColors.cyan,
    ),
    TeamMember(
      name: 'Eduardo dos Santos',
      role: 'PROGRAMAÇÃO',
      color: ArcadeColors.pink,
    ),
    TeamMember(
      name: 'Gustavo Henrique Rajab',
      role: 'DESIGN',
      color: ArcadeColors.yellow,
    ),
    TeamMember(
      name: 'Kédyna Lagni',
      role: 'DOCUMENTAÇÃO',
      color: ArcadeColors.purple,
    ),
    TeamMember(
      name: 'Paula Cristina da Rocha Paim',
      role: 'TESTES',
      color: ArcadeColors.green,
    ),
    TeamMember(
      name: 'William Miguel Santos Pereira',
      role: 'GAMEPLAY',
      color: ArcadeColors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BrickBackdrop(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const BackLink(),
                const SizedBox(height: 8),
                Text(
                  'INTEGRANTES',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.separated(
                    itemCount: members.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final member = members[index];
                      return Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.45),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: member.color, width: 1.5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 48,
                              height: 48,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: member.color),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                member.initials,
                                style: TextStyle(
                                  fontFamily: 'PressStart2P',
                                  fontSize: 10,
                                  color: member.color,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    member.name,
                                    style: const TextStyle(
                                      fontFamily: 'PressStart2P',
                                      fontSize: 8,
                                      color: ArcadeColors.white,
                                      height: 1.4,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    member.role,
                                    style: TextStyle(
                                      fontFamily: 'PressStart2P',
                                      fontSize: 8,
                                      color: member.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Icon(Icons.sports_esports, color: ArcadeColors.cyan),
                const SizedBox(height: 8),
                const Text(
                  'PROJETO INTEGRADOR VI-A',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 8,
                    color: ArcadeColors.cyan,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'GRUPO 5',
                  style: TextStyle(
                    fontFamily: 'PressStart2P',
                    fontSize: 8,
                    color: ArcadeColors.muted,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
