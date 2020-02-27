import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fnamer/product_list_tab.dart';
import 'package:fnamer/search_tab.dart';
import 'package:fnamer/shopping_cart_tab.dart';
import 'package:provider/provider.dart';

import 'model/app_state_model.dart';

// cupertino_store
// https://codelabs.developers.google.com/codelabs/flutter-cupertino/#0
// https://github.com/googlecodelabs/flutter-cupertino-store
void main() {
  // This app is designed only to work vertically, so we limit orientations to portrait up and down.
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    ChangeNotifierProvider<AppStateModel>(
      builder: (context) => AppStateModel()..loadProducts(),
//      model: model,
      child: MyApp(),
    ),
  );
}

// CupertinoStoreApp
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      home: new CupertinoStoreHomePage(),
    );
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text("Products"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            title: Text("Search"),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text("Cart"),
          )
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView returnValue;
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ProductListTab(),
                );
              },
            );
          case 1:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: SearchTab(),
                );
              },
            );
          case 2:
            return CupertinoTabView(
              builder: (context) {
                return CupertinoPageScaffold(
                  child: ShoppingCartTab(),
                );
              },
            );
        }
        return returnValue;
      },
    );
  }
}
