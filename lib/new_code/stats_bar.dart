import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saim_portfolio/new_code/app_constants.dart';
import 'package:saim_portfolio/new_code/portfolio_data.dart';

class StatsBar extends StatelessWidget {
  const StatsBar({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = PortfolioData.stats;
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Container(
      color: AppColors.surface,
      child: isMobile
          ? GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                stats.length,
                (i) => _StatItem(stat: stats[i], index: i),
              ),
            )
          : Row(
              children: List.generate(
                stats.length,
                (i) => Expanded(
                  child: _StatItem(
                    stat: stats[i],
                    index: i,
                    showBorder: i < stats.length - 1,
                  ),
                ),
              ),
            ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final Map<String, String> stat;
  final int index;
  final bool showBorder;
  const _StatItem({
    required this.stat,
    required this.index,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        border: Border(
          right: showBorder
              ? const BorderSide(color: AppColors.border, width: 0.5)
              : BorderSide.none,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            stat['number']!,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ).animate(delay: (index * 100).ms).fadeIn().slideY(begin: 0.3),
          const SizedBox(height: 4),
          Text(
            stat['label']!,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.textSecondary,
              letterSpacing: 0.5,
            ),
          ).animate(delay: (index * 100 + 100).ms).fadeIn(),
        ],
      ),
    );
  }
}
