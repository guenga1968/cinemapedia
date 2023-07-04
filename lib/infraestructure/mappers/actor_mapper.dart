

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity(Cast cast) => Actor(
    id: cast.id, 
    name: cast. name, 
    profilePath: cast.profilePath != null 
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}' 
    : 'https://th.bing.com/th?id=OIP.1LRUIB2OXVePxD5hQm4fqwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.3&pid=3.1&rm=2',
    character: cast.character
    );


    
}