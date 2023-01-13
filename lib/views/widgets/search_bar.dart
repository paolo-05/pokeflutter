import 'package:flutter/material.dart';
import 'package:pokeflutter/utils/palette.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searchBar(context),
          filterButton(),
        ],
      ),
    );
  }

  Container filterButton() => Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: gray[200],
        ),
        alignment: Alignment.center,
        child: Icon(
          Icons.filter_alt_outlined,
          size: 24,
        ),
      );

  Container searchBar(BuildContext context) => Container(
        height: 48,
        width: 256,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: gray[200]!),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.search,
              size: 24,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "Search a pokémon",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: gray[300]),
            ),
          ],
        ),
      );
}
