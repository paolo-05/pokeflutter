import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/capitalize.dart';
import 'widgets/tab_bar_children/moves_tab.dart';
import 'widgets/tab_bar_children/about_tab.dart';
import 'widgets/tab_bar_children/evolutions_tab.dart';
import 'widgets/tab_bar_children/stats_tab.dart';
import 'widgets/styled_text.dart';
import 'widgets/vertical_padded_text.dart';
import '../model/pokemon_details.dart';
import '../utils/palette.dart';

class DetailPage extends StatefulWidget {
  static const route = "/detail-page";

  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  /// Widget padre da dove inizia tutta la creazione della schermata stessa di dettaglio, dove al suo interno possono
  /// essere chiamati altri widget
  @override
  Widget build(BuildContext context) {
    /// Ricezione dei parametri del pokemon selezionato passati dalla schermata precendente con la lista di tutti i pokemon
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;
    TextTheme textTheme = Theme.of(context).textTheme;

    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [args.pokemonMainColor, Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.center),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 68.h),

              /// Esempio di richiamo di un widget creato da noi all'interno del widget padre build
              _header(context, args),
              SizedBox(
                height: 260.h,
                width: 260.w,
                child: Image.network(args.pokemon.urlImage),
              ),
              SizedBox(height: 17.h),
              StyledText(
                style: textTheme.titleLarge!
                    .copyWith(color: gray[500], fontSize: 22.r),
                textHeight: 28.h,
                text: args.pokemon.name.capitalize(),
              ),
              StyledText(
                style: textTheme.bodyLarge!
                    .copyWith(color: gray[300], fontSize: 16.r),
                textHeight: 24.h,
                text: "${args.pokemon.typesList[0].capitalize()} Pokémon",
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 360.w,
                child: TabBar(
                  tabs: [
                    Tab(
                      iconMargin: EdgeInsets.all(24.h),
                      child: StyledText(
                        text: "About",
                        style: textTheme.bodyMedium!.copyWith(color: gray[500]),
                        textHeight: 44.h,
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.all(24.h),
                      child: StyledText(
                        text: "Stats",
                        style: textTheme.bodyMedium!.copyWith(color: gray[500]),
                        textHeight: 44.h,
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.all(24.h),
                      child: StyledText(
                        text: "Moves",
                        style: textTheme.bodyMedium!.copyWith(color: gray[500]),
                        textHeight: 44.h,
                      ),
                    ),
                    Tab(
                      iconMargin: EdgeInsets.all(24.h),
                      child: StyledText(
                        text: "Evolutions",
                        style: textTheme.bodyMedium!.copyWith(color: gray[500]),
                        textHeight: 44.h,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    AboutTab(),
                    StatsTab(),
                    MovesTab(),
                    EvolutionsTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Creazione del widget header che rappresenta la barra in cima alla schermata di dettaglio
  Padding _header(BuildContext context, PokemonDetailArgs args) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Icona che permette di tornare indietro alla schermata precedente
          IconButton(
            constraints: BoxConstraints(maxHeight: 24.h, maxWidth: 24.h),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.arrow_back_ios_new),
            iconSize: 24.h,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),

          /// Testo stilizzato contenente l'ID del pokemon all'interno del pokedex
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
