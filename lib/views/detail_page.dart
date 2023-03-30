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
  /// Widget padre da dove inizia tutta la creazione della schermata stessa di dettaglio, dove al suo interno possono
  /// essere chiamati altri widget
  @override
  Widget build(BuildContext context) {
    /// Ricezione dei parametri del pokemon selezionato passati dalla schermata precendente con la lista di tutti i pokemon
    final args =
        ModalRoute.of(context)!.settings.arguments as PokemonDetailArgs;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
          Text(
            args.pokemon.name,
            style: const TextStyle(fontSize: 22),
          ),
          Text(
            args.pokemon.typesList[0],
            style: const TextStyle(fontSize: 16),
          ),
        ],
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
