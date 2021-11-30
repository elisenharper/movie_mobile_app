import 'package:first_flutter_app/model/movie.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I Am Legend",
    "300",
    "The Wolf of Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings",
    "The Burbs"
  ];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
                children:<Widget>[

                  movieCard(movieList[index], context),
                  Positioned(
                      top: 10.0,
                      child: movieImage(movieList[index].images[0])),

                ]);
            //     return Card(
            //       elevation: 4.5,
            //       color: Colors.white,
            //       child: ListTile(
            //         leading: CircleAvatar(
            //           child: Container(
            //             width: 200,
            //             height: 200,
            //             decoration: BoxDecoration(
            //               image: DecorationImage(
            //                 image: NetworkImage(movieList[index].images[0]),
            //                 fit: BoxFit.cover
            //               ),
            //               borderRadius: BorderRadius.circular(13.9),
            //             ),
            //             child: null,
            //           ),
            //         ),
            //         trailing: Text("..."),
            //         title: Text(movieList[index].title),
            //         subtitle: Text("${movieList[0].title}"),
            //         onTap: () {
            //           Navigator.push(context, MaterialPageRoute(
            //               builder: (context) => MovieListViewDetails(movieName: movieList.elementAt(index).title,
            //               movie: movieList[index])));
            //         },
            //         // onTap: () => debugPrint("Movie name: ${movies.elementAt(index)}"),
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
                bottom: 8.0,
                left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(movie.title, style:
                          TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                              color: Colors.white
                          ),),
                        ),
                        Text("Rating: ${movie.imdbRating} / 10",
                          style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.grey
                          ),)
                      ]
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("Released: ${movie.released}", style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle()),
                    ],
                  )

                ],
              ),
            ),
          ),

        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MovieListViewDetails(movieName: movie.title,
                movie: movie)))
      },
    );
  }
  TextStyle mainTextStyle() {
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey
    );

  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover)
      ),
    );
  }


}

//New Route (screen or page)
class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key? key, required this.movieName, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie),
          HorizontalLine(),
          MovieDetailsExtraPosters(posters: movie.images)
        ],
      ),
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go back ${this.movie.director}"),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       }),
      //   ),
      // ),
    );
  }
}


class MovieDetailsThumbnail extends StatelessWidget {
  final String thumbnail;

  const MovieDetailsThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 170,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(thumbnail),
                      fit: BoxFit.cover)
              ),
            ),
            Icon(Icons.play_circle_outline, size: 100,
                color: Colors.white)
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5), Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)
          ),
          height: 80,
        )


      ],
    );
  }
}

class MovieDetailsHeaderWithPoster extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          MoviePoster(poster: movie.images[0].toString()),
          SizedBox(width: 16,),
          Expanded(
              child: MovieDetailsHeader(movie: movie))

        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {
  final String poster;

  const MoviePoster({Key? key, required this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.all(Radius.circular(10));
    return Card(
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: 160,
          child:
          Image(image: AssetImage(poster)),   //Image(image: AssetImage(product.image));

        ),
      ),
    );
  }
}

class MovieDetailsHeader extends StatelessWidget {
  final Movie movie;

  const MovieDetailsHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("${movie.year} . ${movie.genre}".toUpperCase(),
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.cyan
          ),),
        Text(movie.title, style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 32
        ),),
        Text.rich(TextSpan(style: TextStyle(
          fontSize: 13, fontWeight: FontWeight.w300,
        ), children: <TextSpan> [
          TextSpan(
              text:movie.plot
          ),
          TextSpan(
              text: "More...",
              style: TextStyle(
                  color: Colors.indigoAccent
              )
          ),
        ]))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {
  final Movie movie;

  const MovieDetailsCast({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          MovieField(field: "Cast", value: movie.actors),
          MovieField(field: "Directors", value: movie.director),
          MovieField(field: "Awards", value: movie.awards)
        ],
      ),
    );
  }
}

class MovieField extends StatelessWidget {
  final String field;
  final String value;

  const MovieField({Key? key, required this.field, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("$field : ", style: TextStyle(
              color: Colors.black38,
              fontSize: 12, fontWeight: FontWeight.w300
          ),),
          Expanded(
            child: Text(value, style: TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w300
            )),
          )
        ]
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {
  final List<String> posters;

  const MovieDetailsExtraPosters({Key? key, required this.posters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text("More Movie Posters".toUpperCase(),
            style: TextStyle(
                fontSize: 14,
                color: Colors.black26
            ),),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.symmetric(vertical: 16),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 8,),
              itemCount: posters.length,
              itemBuilder: (context, index) => ClipRect(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: 160,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage(posters[index]),
                          fit: BoxFit.cover)
                  ),
                ),

              ) ),
        )
      ],
    );
  }
}