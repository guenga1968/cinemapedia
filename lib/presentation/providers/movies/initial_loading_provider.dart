


import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final intialLoadingProvider = Provider<bool>((ref) {

  final step1 = ref.watch(nowPlayingMoviesProviders).isEmpty;
  final step2 = ref.watch(popularMoviesProvider).isEmpty;
  final step3 = ref.watch(topRatedMoviesProvider).isEmpty;
  final step4 = ref.watch(upcomingMoviesPorvider).isEmpty;

if(step1 || step2 || step3 || step4) return true;
return false;
});