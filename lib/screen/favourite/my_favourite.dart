import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorial/provider/favourite_provider..dart';
//import 'package:provider_tutorial/screen/favourite/favourite_screen.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    final FavouriteProvider = Provider.of<FavouriteIteamProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Favourite')),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavourite()));
            },
            child: Icon(Icons.favorite),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: FavouriteProvider.selectedtem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteIteamProvider>(
                      builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedtem.contains(index)) {
                          value.removeitem(index);
                        } else {
                          value.additem(index);
                        }
                      },
                      title: Text('item ' + index.toString()),
                      trailing: Icon(value.selectedtem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
