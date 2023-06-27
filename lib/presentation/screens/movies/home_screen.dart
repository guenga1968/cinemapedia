import 'package:cinemapedia/config/constants/enviroment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

static const String name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(Enviroment.theMovieDbKey),
      ),
    );
  }
}