import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokeflutter/views/widgets/vertical_padded_text.dart';

import '../model/pokemon_details.dart';
import '../utils/palette.dart';

class DetailPage extends StatefulWidget {
  static const route = "/detail-page";

  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 68.h),
          _header(context, args),
          SizedBox(
            height: 260.h,
            width: 260.w,
            child: Image.network(args.pokemon.urlImage),
          )
        ],
      ),
    );
  }

  Padding _header(BuildContext context, PokemonDetailArgs args) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            constraints: BoxConstraints(maxHeight: 24.h, maxWidth: 24.h),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: 24.h,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          VerticalPaddedText(
            content: "#${args.pokemonIndex.toString().padLeft(3, "0")}",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: gray[500]),
            textSize: 22,
            textSizewithPadding: 28,
          ),
          Icon(
            Icons.favorite_border,
            size: 24.r,
          ),
        ],
      ),
    );
  }
}
