import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/presentation/constants/app_colors.dart';

PreferredSizeWidget homeScreenAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(55),
    child: AppBar(
      elevation: 1,
      backgroundColor: AppColors.mainColor,
      centerTitle: true,
      title: Text(
        "Quiz App",
        style: GoogleFonts.quicksand(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
    ),
  );
}
