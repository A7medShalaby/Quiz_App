// ignore_for_file: unused_field, non_constant_identifier_names, avoid_types_as_parameter_names, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/local/question_list.dart';
import 'package:quiz_app/presentation/constants/app_colors.dart';
import 'package:quiz_app/presentation/screens/result_screen.dart';

import '../widgets/of_home_screen/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color btnColor = AppColors.secondColor;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: PageView.builder(
          controller: _controller,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (Page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Question: (${index + 1} / ${questions.length})",
                    style: GoogleFonts.openSans(
                      color: AppColors.secondColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(
                  color: AppColors.mainColor,
                  height: 10,
                  thickness: 2,
                ),
                Text(
                  questions[index].question,
                  style: GoogleFonts.openSans(
                    color: AppColors.blackColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                for (var i = 0; i < questions[index].answer.length; i++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 18),
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      color: isPressed
                          ? questions[index].answer.entries.toList()[i].value
                              ? AppColors.trueAnswerColor
                              : AppColors.falseAnswerColor
                          : AppColors.mainColor,
                      onPressed: isPressed
                          ? () {}
                          : () {
                              setState(() {
                                isPressed = true;
                              });
                              if (questions[index]
                                  .answer
                                  .entries
                                  .toList()[i]
                                  .value) {
                                score += 10;
                                print(score);
                              }
                            },
                      child: Text(
                        questions[index].answer.keys.toList()[i],
                        style: GoogleFonts.openSans(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      color: AppColors.blackColor,
                      onPressed: isPressed
                          ? index + 1 == questions.length
                              ? () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ResultScreen(score),
                                    ),
                                  );
                                }
                              : () {
                                  _controller?.nextPage(
                                    duration: const Duration(microseconds: 300),
                                    curve: Curves.linear,
                                  );
                                  setState(() {
                                    isPressed = false;
                                  });
                                }
                          : null,
                      child: Text(
                        index + 1 == questions.length ? "Result" : "Next",
                        style: GoogleFonts.openSans(
                          color: AppColors.whiteColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
