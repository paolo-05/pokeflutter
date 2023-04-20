import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/pokemon.dart';
import '../../../model/pokemon_details.dart';
import '../../../utils/palette.dart';
import '../styled_text.dart';

class StatsTab extends StatefulWidget {
  const StatsTab({Key? key}) : super(key: key);

  @override
  State<StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends State<StatsTab> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _statsList(args.pokemon),
    );
  }

  List<Widget> _statsList(Pokemon pokemon) {
    List<int> statsMax = [150, 110, 110, 110, 100, 110];
    List<Widget> statsList = [];
    List<String> statsName = [
      "HP",
      "Attack",
      "Defense",
      "Sp. Atk",
      "Sp. Def",
      "Speed",
    ];

    for (var i = 0; i < 6; i++) {
      statsList.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 64.w,
                child: StyledText(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: gray[400]),
                  text: statsName[i],
                  textHeight: 24.h,
                ),
              ),
              SizedBox(
                width: 40.w,
                child: StyledText(
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: gray[500]),
                  text: "${pokemon.statsList[i]}",
                  textHeight: 24.h,
                ),
              ),
              _statsBar(pokemon.statsList[i], statsMax[i])
            ],
          ),
        ),
      );
    }
    return statsList;
  }

  SizedBox _statsBar(int value, int max) {
    double percentageOn15 = value * 15 / max;
    percentageOn15.round();
    List<Widget> statsBar = [];
    for (int i = 0; i < 15; i++) {
      if (i <= percentageOn15.toInt()) {
        statsBar.add(
          SvgPicture.asset(
            "assets/stats_icons/filled.svg",
          ),
        );
      } else {
        statsBar.add(
          SvgPicture.asset(
            "assets/stats_icons/blank.svg",
          ),
        );
      }
      if (i < 14) {
        statsBar.add(SizedBox(
          width: 3.w,
        ));
      }
    }
    return SizedBox(
      width: 208.w,
      child: Row(
        children: statsBar,
      ),
    );
  }
}
