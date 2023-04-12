import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokeflutter/utils/capitalize.dart';
import 'package:pokeflutter/views/widgets/styled_text.dart';
import '../../../model/pokemon.dart';
import '../../../model/pokemon_details.dart';
import '../../../utils/palette.dart';

class EvolutionsTab extends StatefulWidget {
  const EvolutionsTab({Key? key}) : super(key: key);

  @override
  State<EvolutionsTab> createState() => _EvolutionsTabState();
}

class _EvolutionsTabState extends State<EvolutionsTab> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: args.pokemonEvolutions.length,
      itemBuilder: (BuildContext context, int index) {
        final textTheme = Theme.of(context).textTheme;
        final evolution = args.pokemonEvolutions[index]['pokemon'] as Pokemon;
        final name = evolution.name;
        final id = evolution.id;
        final level = args.pokemonEvolutions[index]['level'];

        return Column(
          children: [
            level != 0
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 115.w,
                        ),
                        SvgPicture.asset(
                          "assets/line.svg",
                          width: 1.w,
                          height: 48.h,
                        ),
                        SizedBox(width: 16.w),
                        StyledText(
                          style:
                              textTheme.bodySmall!.copyWith(color: gray[300]),
                          text: "Level $level",
                          textHeight: 16.h,
                        )
                      ],
                    ),
                  )
                //Text('Level $level'),

                : const SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 140.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: gray[100],
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
                      child: Image.network(
                        evolution.urlImage,
                        width: 80.w,
                        height: 80.h,
                      ),
                    ),
                  ),
                  SizedBox(width: 24.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledText(
                        style: textTheme.bodyLarge!.copyWith(color: gray[300]),
                        text: "#${id.toString().padLeft(3, "0")}",
                        textHeight: 24.h,
                      ),
                      SizedBox(
                        height: 32.h,
                        child: StyledText(
                          style:
                              textTheme.titleLarge!.copyWith(color: gray[500]),
                          text: name.capitalize(),
                          textHeight: 28.h,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: typesList(evolution),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  List<Widget> typesList(Pokemon pokemon) {
    List<Widget> typesList = [];
    for (var i = 0; i < pokemon.typesList.length; i++) {
      if (i >= 1) {
        typesList.add(SizedBox(
          height: 8.h,
        ));
      }
      typesList.add(
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: gray[200]!, width: 2.w),
          ),
          padding:
              EdgeInsets.only(left: 2.w, top: 2.h, bottom: 2.h, right: 8.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(
                  "assets/types_icons/Pokémon_${pokemon.typesList[i].capitalize()}_Type_Icon.png",
                ),
                height: 15.r,
                width: 15.r,
              ),
              SizedBox(
                width: 4.w,
              ),
              StyledText(
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: gray[500]),
                textHeight: 20.h,
                text: pokemon.typesList[i].capitalize(),
              )
            ],
          ),
        ),
      );
    }
    return typesList;
  }
}
