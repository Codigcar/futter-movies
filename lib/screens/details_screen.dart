import 'package:flutter/material.dart';
import 'package:peliculas/widgets/index.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final String movie =
    //     ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              const _PosterAndTitle(),
              const _OverView(),
              const _OverView(),
              const _OverView(),
              const CastingCards()
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          color: Colors.black12,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: const Text(
            'movie.title',
            textAlign: TextAlign.center,
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage('https://placekitten.com/500/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage('https://placekitten.com/200/300'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            children: [
              Text('movie.title',
                  style: textTheme.headline5, overflow: TextOverflow.ellipsis),
              Text('movie.originalTitle',
                  style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  Text('movie.voteAverage', style: textTheme.caption)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        'Aliquip adipisicing voluptate esse officia amet in cillum duis tempor. Laborum cupidatat aute incididunt ut culpa duis. Laborum reprehenderit labore ex sit. Sit eu minim nostrud ea adipisicing anim cillum excepteur qui consequat. Et et dolor ad reprehenderit ipsum reprehenderit nisi minim irure. Laboris magna ullamco exercitation nostrud aliquip laborum laborum quis labore tempor consectetur quis. Ullamco eu veniam eu veniam excepteur enim elit.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
