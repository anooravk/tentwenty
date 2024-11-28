import 'package:flutter/material.dart';
import 'package:tentwenty/res/routes/routes_name.dart';
import 'package:tentwenty/view/widgets/bottom_navigation_widget.dart';

import '../../view/views.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.moviesView:
        return MaterialPageRoute(
          builder: (BuildContext context) => MoviesView(),
        );
      case RouteName.navView:
        return MaterialPageRoute(
          builder: (BuildContext context) => Bottomnavigationwidget(),
        );

      case RouteName.ticketView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (BuildContext context) => Ticket(
            movies: args['movies'],
          ),
        );

      case RouteName.seatView:
        final args = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (BuildContext context) => Seat(
            movies: args['movies'],
          ),
        );

      case RouteName.detailView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => DetailView(
            movies: args['movies'],
          ),
        );

      case RouteName.videoView:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) => MovieVideosScreen(
            videoUrl: args['videoUrl'],
            thumbnailUrl: args['thumbnailUrl'],
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'No route defined',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        );
    }
  }
}
