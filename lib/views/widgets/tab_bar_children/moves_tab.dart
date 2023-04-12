import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeflutter/utils/capitalize.dart';
import 'package:pokeflutter/views/widgets/styled_text.dart';
import '../../../model/pokemon_details.dart';
import '../../../utils/palette.dart';

class MovesTab extends StatefulWidget {
  const MovesTab({Key? key}) : super(key: key);

  @override
  State<MovesTab> createState() => _MovesTabState();
}

class _MovesTabState extends State<MovesTab> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.r, color: gray[200]!))),
                  height: 40.h,
                  child: StyledText(
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: gray[500]),
                    text: args.pokemon.movesList[index].capitalize(),
                    textHeight: 24.h,
                  ),
                ),
              );
            },
            childCount: args.pokemon.movesList.length,
          ),
        )
      ],
    );
  }
}
