// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'card/Item.dart' as Card;
import 'package:graphql_flutter/graphql_flutter.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    super.key,
    required this.searchText,
  });

  final String searchText;

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  String getQuery() {
    return """
      query { itemsByName(name: "${widget.searchText}") {
              name
              types
              avg24hPrice
              basePrice
              width
              height
              changeLast48hPercent
              iconLink
              link
              sellFor {
                price
                source
              }
              buyFor {
                price
                source
              }
            }
          }
    """;
  }

  @override
  Widget build(BuildContext context) {
    num convertPrice(dynamic item) {
      if (item['source'] == 'peacekeeper') {
        return item['price'] * 110;
      } else {
        return item['price'];
      }
    }

    return Query(
        options: QueryOptions(
          document: gql(getQuery()),
        ),
        builder: (QueryResult result,
            {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.isLoading) {
            return const Text('Loading', style: TextStyle(color: Colors.white));
          }
          List? items = result.data?['itemsByName'];

          if (items == null || items.isEmpty) {
            return const Text('No items found',
                style: TextStyle(color: Colors.white));
          }

          for (var item in items) {
            for (var i = 0; i < item['sellFor'].length; i++) {
              if (item['sellFor'][i]['source'] == 'fleaMarket') {
                item['fleaMarketSell'] = item['sellFor'][i];
              } else if (item['bestOfferSell'] == null ||
                  item['bestOfferSell']['price'] <
                      (convertPrice(item['sellFor'][i]))) {
                item['bestOfferSell'] = item['sellFor'][i];
              }
            }

            for (var i = 0; i < item['buyFor'].length; i++) {
              if (item['buyFor'][i]['source'] == 'fleaMarket') {
                item['fleaMarketBuy'] = item['buyFor'][i];
              } else if (item['bestOfferBuy'] == null ||
                  item['bestOfferBuy']['price'] <
                      (convertPrice(item['buyFor'][i]))) {
                item['bestOfferBuy'] = item['buyFor'][i];
              }
            }
          }

          return Expanded(
              // wrap in Expanded
              child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return item != null ? Card.Item(item: item) : Container();
            },
          ));
        });
  }
}
