import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: OorangadiApp()));
}

class OorangadiApp extends StatelessWidget {
  const OorangadiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oorangadi — Minimalistic Sales App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E3A8A), // deep navy/indigo
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          brightness: Brightness.dark,
        ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 880),
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: colorScheme.surface,
                  surfaceTintColor: Colors.transparent,
                  title: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.storefront_rounded,
                          color: colorScheme.primary,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Oorangadi',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Chip(
                        avatar: Icon(
                          Icons.offline_bolt_rounded,
                          size: 16,
                          color: colorScheme.primary,
                        ),
                        label: const Text('Local-First MVP'),
                        side: BorderSide(color: colorScheme.outlineVariant),
                      ),
                    ),
                  ],
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(24),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(height: 16),
                      // Hero Section
                      Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: colorScheme.secondaryContainer
                                    .withValues(alpha: 0.6),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Sprint 0 • Specification & Architecture Spike',
                                style: theme.textTheme.labelMedium?.copyWith(
                                  color: colorScheme.onSecondaryContainer,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Minimalistic Sales App',
                              textAlign: TextAlign.center,
                              style: theme.textTheme.displaySmall?.copyWith(
                                fontWeight: FontWeight.w800,
                                letterSpacing: -1,
                              ),
                            ),
                            const SizedBox(height: 12),
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 580),
                              child: Text(
                                'Lightning-fast, zero-overhead point of sale and order management. '
                                'Built on a 100% local-first architecture — your business data stays on your device, always offline-ready, with zero subscription dependencies.',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Core Pillars
                      Text(
                        'Design Pillars',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 600;
                          final cards = [
                            const _PillarCard(
                              icon: Icons.storage_rounded,
                              title: 'Local-First SQLite & WASM',
                              description:
                                  'Zero cloud lag. All catalog, stock, and sales entries live in an embedded Drift SQLite database running directly in the browser via WebAssembly.',
                            ),
                            const _PillarCard(
                              icon: Icons.bolt_rounded,
                              title: 'Frictionless POS Flow',
                              description:
                                  'Optimized for swift checkout with keyboard shortcuts, quick item search, instant cart tally, and receipt generation.',
                            ),
                            const _PillarCard(
                              icon: Icons.lock_outline_rounded,
                              title: 'Complete Data Sovereignty',
                              description:
                                  'Your sales numbers are yours. No vendor lock-in, zero monthly server fees, with one-click local JSON/CSV export and import.',
                            ),
                          ];

                          if (isWide) {
                            return Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: cards
                                  .map(
                                    (c) => Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 6,
                                        ),
                                        child: c,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          } else {
                            return Column(
                              children: cards
                                  .map(
                                    (c) => Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: c,
                                    ),
                                  )
                                  .toList(),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 36),

                      // Roadmap Preview
                      Text(
                        'MVP Backlog Preview',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: colorScheme.outlineVariant),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _BacklogRow(
                                statusIcon: Icons.radio_button_checked_rounded,
                                iconColor: Colors.blue,
                                title:
                                    'Sprint 0: Specification & Project Foundation',
                                subtitle:
                                    'Local-first architecture, Drift WASM setup, and spec derivation',
                              ),
                              Divider(height: 24),
                              _BacklogRow(
                                statusIcon:
                                    Icons.radio_button_unchecked_rounded,
                                iconColor: Colors.grey,
                                title:
                                    'Sprint 1: Product Catalog & Category Engine',
                                subtitle:
                                    'Item CRUD, pricing, SKU/barcode lookup, in-memory search index',
                              ),
                              Divider(height: 24),
                              _BacklogRow(
                                statusIcon:
                                    Icons.radio_button_unchecked_rounded,
                                iconColor: Colors.grey,
                                title: 'Sprint 2: Sales Counter & Quick Cart',
                                subtitle:
                                    'Speedy item addition, discount handling, bill calculation, and settlement',
                              ),
                              Divider(height: 24),
                              _BacklogRow(
                                statusIcon:
                                    Icons.radio_button_unchecked_rounded,
                                iconColor: Colors.grey,
                                title:
                                    'Sprint 3: Receipts, Order History & Local Backup',
                                subtitle:
                                    'Printable receipts, past orders viewer, CSV/JSON export & restore',
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 48),
                      // Footer
                      Center(
                        child: Text(
                          'Oorangadi • Built with Flutter Web • Follows Blueprint Min Tier',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PillarCard extends StatelessWidget {
  const _PillarCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 0,
      color: colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: colorScheme.primary, size: 24),
            ),
            const SizedBox(height: 14),
            Text(
              title,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BacklogRow extends StatelessWidget {
  const _BacklogRow({
    required this.statusIcon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  final IconData statusIcon;
  final Color iconColor;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(statusIcon, size: 20, color: iconColor),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
