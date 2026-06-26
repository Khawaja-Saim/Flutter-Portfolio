import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saim_portfolio/new_code/app_constants.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  const SectionHeader({super.key, required this.label, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 11,
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.5,
          ),
        ).animate().fadeIn(duration: 500.ms),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ).animate().fadeIn(duration: 500.ms, delay: 100.ms),
        const SizedBox(height: 8),
        Container(
          width: 48,
          height: 3,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(2),
          ),
        ).animate().scaleX(
          duration: 400.ms,
          delay: 200.ms,
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}
