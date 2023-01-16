import 'package:flutter/material.dart';
import 'package:peliculas/models/index.dart';
import 'package:peliculas/widgets/index.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _OverView(movie),
              _OverView(movie),
              _OverView(movie),
              CastingCards(movie: movie)
            ]),
          )
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar(this.movie);
  final Movie movie;

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
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(movie.fullPosterImg),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              children: [
                Text(
                  movie.title,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outline,
                        size: 15, color: Colors.grey),
                    Text('${movie.voteAverage}', style: textTheme.caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView(this.movie);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
