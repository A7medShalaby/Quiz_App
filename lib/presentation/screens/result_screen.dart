import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import 'home_screen.dart';

class ResultScreen extends StatefulWidget {
  final int score;
  const ResultScreen(this.score, {Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Congratulations!',
            style: GoogleFonts.openSans(
              color: AppColors.mainColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: AppColors.mainColor,
            height: 10,
            thickness: 2,
          ),
          Text(
            'Your Score: ${widget.score}',
            style: GoogleFonts.openSans(
              color: AppColors.secondColor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
            color: AppColors.mainColor,
            textColor: AppColors.blackColor,
            child: Text(
              'Restart Quiz',
              style: GoogleFonts.openSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
