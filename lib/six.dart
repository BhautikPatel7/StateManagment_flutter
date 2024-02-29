import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Product {
  const Product({required this.name});

  final String name;
}

typedef CartChangedCallback = Function(Product product, bool inCart);
typedef RemoveCallback = Function();

class ShoppingListItem extends StatefulWidget {
  ShoppingListItem({
    required this.product,
    required this.inCart,
    required this.onIteamRemove,

  }) : super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final  RemoveCallback  onIteamRemove;

  @override
  State<ShoppingListItem> createState() => _ShoppingListItemState();
}

class _ShoppingListItemState extends State<ShoppingListItem> {
  int count = 1;
  void incriment() {
    setState(() {
      if (count >= 20) {
        count = 20;
      }else{
count++;
      }
    });
  }
  void decriment() {
    setState(() {
      if (count <= 0) {
        count = 0;
      }else{
count--;
      }
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(

      child: ListTile(
        leading: CircleAvatar(
          child: Text(widget.product.name[0]),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.product.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    child: const Text(
                      '+',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    onTap: () => incriment(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '$count',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                InkWell(
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  onTap: () => decriment(),
                ),
              ],
            ),
            IconButton(
              onPressed: widget.onIteamRemove,
              icon: Icon(Icons.remove_shopping_cart_outlined,color: Colors.redAccent[400],),
            ),
          ],
        ),
      ),
    );
  }
}
class ShoppingList extends StatefulWidget {
 ShoppingList({required this.products, super.key});

   List<Product> products;
  @override
  State<ShoppingList> createState() => _ShoppingListState();
}
class _ShoppingListState extends State<ShoppingList> {
  final _shoppingCart = <Product>{};

  var myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  void addItemToList(String name) {
    setState(() {
      widget.products.add(Product(name: name));
    });
  }
    void removeItemToList(Product p) {
    setState(() {
      widget.products.remove(p);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
                onTap: () {
                  _showcontent();
                },
                child: const Icon(
                  Icons.add_shopping_cart_sharp,
                  color: Colors.blueGrey,
                  size: 22,
                )),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
             onIteamRemove: () => removeItemToList(product),
          );
        }).toList(),
      ),
      
    );
    
  }
  // Dilog Design
  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text('Add A New Iteam'),
           content:  SingleChildScrollView(
            child: ListBody(
              children: [
                TextField(
                   controller: myController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Enter Iteam',
                  ),
                ),
              
              ],
            ),
          ),
          actions: [
            FloatingActionButton(
              child: const Text('Ok'),
              onPressed: () {
                 if (myController.text.isNotEmpty) {
                   addItemToList(myController.text.toString());
                   myController.clear();
                 }
                Navigator.of(context).pop();
              },
            ),
            FloatingActionButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                myController.clear();
              },
            ),
          ],
        );
      },
    );
  }
}
void main() {
  runApp( MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: [
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate'),
      ],
    ),
  ));
}
