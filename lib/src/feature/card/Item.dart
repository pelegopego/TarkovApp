// ignore_for_file: file_names
import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  const Item({Key? key, required this.item}) : super(key: key);

  final dynamic item;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  String getSourceName(String name) {
    return name[0].toUpperCase() + name.substring(1, name.length);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: SizedBox(
        child: Row(children: [
          Container(
            height: 100,
            width: 100,
            child: CircleAvatar(
              minRadius: 25,
              foregroundImage: NetworkImage(widget.item['iconLink']),
              foregroundColor: Colors.white,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: [
                Expanded(
                    child: Container(
                  child: Text(
                    widget.item['name'],
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                        fontSize: 14),
                  ),
                )),
                Row(children: [
                  Container(
                      color: Colors.blue,
                      margin: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Trader',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Comfortaa',
                          color: Colors.white,
                        ),
                      )),
                ]),
                Row(
                  children: [
                    Row(children: [
                      Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            'Sell: ' +
                                getSourceName(
                                    widget.item['bestOfferSell']['source']),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Colors.blue[400],
                            ),
                          )),
                      Container(
                          child: Text(
                        (widget.item['bestOfferSell']['source'] == 'peacekeeper'
                                ? '\$'
                                : '₽ ') +
                            widget.item['bestOfferSell']['price'].toString(),
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Comfortaa',
                          color: Colors.blue[400],
                        ),
                      )),
                    ]),
                  ],
                ),
                Container(
                  color: Colors.purple,
                ),
                widget.item['bestOfferBuy'] != null
                    ? Row(
                        children: [
                          Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: Text(
                                'Buy: ' +
                                    getSourceName(
                                        widget.item['bestOfferBuy']['source']),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Comfortaa',
                                  color: Colors.blue[400],
                                ),
                              )),
                          Text(
                            (widget.item['bestOfferBuy']['source'] ==
                                        'peacekeeper'
                                    ? '\$'
                                    : '₽ ') +
                                widget.item['bestOfferBuy']['price'].toString(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Colors.blue[400],
                            ),
                          ),
                        ],
                      )
                    : Container(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                ),
                Row(children: [
                  widget.item['fleaMarketSell'] != null ||
                          widget.item['fleaMarketBuy'] != null
                      ? Container(
                          color: Colors.blue,
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            'FleaMarket',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Colors.white,
                            ),
                          ))
                      : Container(),
                ]),
                Row(children: [
                  widget.item['fleaMarketSell'] != null
                      ? Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            'FleaMarket - Sell: ₽ ' +
                                widget.item['fleaMarketSell']['price']
                                    .toString(),
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Comfortaa',
                              color: Colors.blue[400],
                            ),
                          ))
                      : Container(),
                ]),
                Row(children: [
                  widget.item['fleaMarketBuy'] != null
                      ? Text(
                          'Buy ₽ ' +
                              widget.item['fleaMarketBuy']['price'].toString(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Comfortaa',
                            color: Colors.blue[400],
                          ),
                        )
                      : Container(),
                ]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
