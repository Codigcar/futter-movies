import 'package:flutter/material.dart';
import 'package:peliculas/models/index.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, int index) => const _CastCard(),
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard();
  // final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://placekitten.com/300/400'),
              fit: BoxFit.cover,
              height: 140,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'actor.name asdasd asd as d',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
