import 'package:flutter/material.dart';

// Class That Define Name Of Products In List
class Product {
  const Product({required this.name});
  final String name;
}

// Call Back function from ListView Widget
typedef CartChangedCallback = Function(Product product, bool inCart);
typedef RemoveCallback = Function();


// For An Single Iteam 
class ShoppingListItem extends StatefulWidget {

  // Requried Parameter For Makeing List Tile
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

// State For managing For Counter Value
class _ShoppingListItemState extends State<ShoppingListItem> {
  int count = 1;

  // Pressing Green + Value Should Increase function That Add Max Quentity To 20
  void incriment() {
    setState(() {
      if (count >= 20) {
        count = 20;
      }else{
count++;
      }
    });
  }

  // For Decrease Counter Value but Cant be negative
  void decriment() {
    setState(() {
      if (count <= 0) {
        count = 0;
      }else{
count--;
      }
      
    });
  }

  // Build Method Starts Here
  @override
  Widget build(BuildContext context) {
    return Card(

      // Taking Name First Character that getting string As Value
      child: ListTile(
        leading: CircleAvatar(
          child: Text(widget.product.name[0]),
        ),

        // For Remaining List Customizitatin
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.product.name,
                overflow: TextOverflow.ellipsis,    // Text Not Overflow By Width Of Display
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
                    onTap: () => incriment(),     // calling Incriment Function on Tap on + icon
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    '$count',     // Displaying Value Of Counter
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                InkWell(
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                  onTap: () => decriment(),   // calling decriment Function on Tap on - icon
                ),
              ],
            ),

            // For Clicking On Delete Its call Ontiteam Remove Function
            // Its Call Removeiteam Because Its Callback for This function
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

// The Class That's Show whole List Page in Main List
// ignore: must_be_immutable
class ShoppingList extends StatefulWidget {
 ShoppingList({required this.products, super.key});

// List That Display One By One All Element On Line
   List<Product> products;
  @override
  State<ShoppingList> createState() => _ShoppingListState();
}


class _ShoppingListState extends State<ShoppingList> {

  // Created Set That Shows That Is Product Is In cart Or Not
  final _shoppingCart = <Product>{};

// Value That Come From Textfiled Here Its NAme Of Products
  var myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  // Function That add New Iteam to List
  void addItemToList(String name) {
    setState(() {
      widget.products.add(Product(name: name));
    });
  }

  // Function That Remove From List
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
                  _showcontent();  //On Tap on cart Button Its Open Pop Up And This Pop Up is in this Method
                },
                child: const Icon(
                  Icons.add_shopping_cart_sharp,
                  color: Colors.blueGrey,
                  size: 22,
                )),
          )
        ],
      ),

      // Here Each Itreation Of List start
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),

        // Loop That For Each Iteam IN List 
        children: widget.products.map((product) {
          return ShoppingListItem(
            product: product,   //The Whole List Display With Name, Avtar, Quentity, And Deletebutton 
            inCart: _shoppingCart.contains(product),  // For Cheking Is Product Is in cart Or NOt
             onIteamRemove: () => removeItemToList(product), // Calling Function On Iteam remove And Pass The Logical Function For remove Fiteam
          );
        }).toList(),
      ),
      
    );
    
  }
  // Dilog Design Thats Open On Cliccking Add cart Icon  
  void _showcontent() {
    showDialog(
      // context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title:  const Text('Add A New Iteam'),
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

                // Only Adds On When Where Value Of text Is not Empty Else Close The Popup
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
      }, context: context,
    );
  }
}
void main() {
  runApp( MaterialApp(
    title: 'Shopping App',
    debugShowCheckedModeBanner: false,
    // Run The Main Class Thats Dispaly All LIST Iteams 
    home: ShoppingList(
      products:  [
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate'),
      ],
    ),
  ));
}
