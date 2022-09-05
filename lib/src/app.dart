import 'package:flutter/material.dart';
import 'feature/Home.dart';
import 'feature/itemDetail.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;
  const MyApp({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          onGenerateTitle: (BuildContext context) => 'Tarkov',
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case ItemDetailsView.routeName:
                    return const ItemDetailsView();
                  case Home.routeName:
                  default:
                    return const Home();
                }
              },
            );
          },
        ));
  }
}
