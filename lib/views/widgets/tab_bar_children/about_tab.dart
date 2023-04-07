import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeflutter/utils/capitalize.dart';

import '../../../model/pokemon.dart';
import '../styled_text.dart';
import '../../../model/pokemon_details.dart';
import '../../../utils/palette.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({Key? key}) : super(key: key);

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;

    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 312.w,
                height: 50.h,
                child: StyledText(
                  text: args.pokemonDescription,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: gray[500]),
                  textHeight: 24.h,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        greyBackGroundDetails(
          [
            SizedBox(
              height: 28.h,
              child: StyledText(
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: gray[500]),
                textHeight: 24.h,
                text: "${args.pokemon.weight} kg",
              ),
            ),
            SizedBox(
              height: 18.h,
              child: StyledText(
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: gray[400]),
                textHeight: 16.h,
                text: "Weight",
              ),
            ),
            SizedBox(
              height: 28.h,
              child: StyledText(
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: gray[500]),
                textHeight: 24.h,
                text: "${args.pokemon.height} cm",
              ),
            ),
            SizedBox(
              height: 18.h,
              child: StyledText(
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: gray[400]),
                textHeight: 16.h,
                text: "Height",
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        greyBackGroundDetails([
          SizedBox(
              height: 28.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: typesList(args.pokemon),
              )),
          SizedBox(
            height: 18.h,
            child: StyledText(
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: gray[400]),
              textHeight: 16.h,
              text: "Category",
            ),
          ),
          SizedBox(
            height: 56.h,
            child: StyledText(
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: gray[500], fontSize: 16.r),
              textHeight: 24.h,
              text: abilitiesList(args.pokemon),
            ),
          ),
          SizedBox(
            height: 18.h,
            child: StyledText(
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: gray[400]),
              textHeight: 16.h,
              text: "Abilities",
            ),
          ),
        ])
      ],
    );
  }

  Padding greyBackGroundDetails(List<SizedBox> args) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: SizedBox(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: gray[100],
          ),
          width: 312.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: 18.w, right: 24.w, top: 28.h, bottom: 28.h),
                child: SizedBox(
                  width: 116.w,
                  //height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [args[0], args[1]],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: SvgPicture.asset("assets/line.svg", width: 1.w),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: 18.w, right: 21.w, top: 28.h, bottom: 28.h),
                child: SizedBox(
                  width: 111.w,
                  //height: 50.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [args[2], args[3]],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Widget> typesList(Pokemon pokemon) {
  List<Widget> typesList = [];
  for (var i = 0; i < pokemon.typesList.length; i++) {
    if (i >= 1) {
      typesList.add(SizedBox(
        height: 4.h,
      ));
    }
    typesList.add(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 2.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                "assets/types_icons/Pokémon_${pokemon.typesList[i].capitalize()}_Type_Icon.png",
              ),
              height: 24.r,
              width: 24.r,
            ),
          ],
        ),
      ),
    );
  }
  return typesList;
}

String abilitiesList(Pokemon pokemon) {
  String abilitiesList = "";
  for (var i = 0; i < pokemon.abilitiesList.length; i++) {
    abilitiesList += pokemon.abilitiesList[i].capitalize();
    if (i < pokemon.abilitiesList.length - 1) {
      abilitiesList += ", ";
    }
  }
  return abilitiesList;
}
