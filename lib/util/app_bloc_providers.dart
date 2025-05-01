import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/headlines_bloc/headlines_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider(create: (_) => HeadlinesBloc())
];