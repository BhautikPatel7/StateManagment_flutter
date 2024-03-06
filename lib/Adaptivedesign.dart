import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widget_pratice/src/People.dart';

class AdaptiveDesign extends StatefulWidget {
  const AdaptiveDesign({super.key});

  @override
  State<AdaptiveDesign> createState() => _AdaptiveDesign();
}

class _AdaptiveDesign extends State<AdaptiveDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adaptive Design"),
        backgroundColor: Colors.amberAccent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 500) {
            return const WideLayout();
          } else {
            return const NarrowLayout();
          }
        },
      ),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout({super.key});

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Person? _person;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
               width: 250,
            child: PeopleList(
              onPersonTap: (person) {
                setState(() {
                  _person = person;
                });
              },
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: _person == null
              ? const ToShowBlankPageHolder()
              : PersonDetail(personofstateless: _person),
        ),
      ],
    );  
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return PeopleList(
      onPersonTap: (Person) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.amberAccent,
                    ),
                    body: PersonDetail(
                      personofstateless: Person,
                    ))));
      },
    );
  }
}

class PersonDetail extends StatelessWidget {
  final Person? personofstateless;

  const PersonDetail({super.key, required this.personofstateless});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(personofstateless!.picture),
          Text(personofstateless!.greeting),
          Text(" My Name Is${personofstateless!.name}"),
          Text(" My Self Is${personofstateless!.about}"),
          Text(" My age Is${personofstateless!.age}"),
          Text(" My Email Is${personofstateless!.email}"),
          Text(" My Eyecolor Is${personofstateless!.eyeColor}"),
          Text(" My Compny Is${personofstateless!.company}"),
          Text(" My Balance Is${personofstateless!.balance}"),
          Text(" My FavoriteFruit Is${personofstateless!.favoriteFruit}"),
          Text(" My Address Is${personofstateless!.address}"),
          Text(" My Phone Is${personofstateless!.phone}"),

        ],
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  final void Function(Person) onPersonTap;

  const PeopleList({super.key, required this.onPersonTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        for (var person in peopleList)
          Card(
            child: ListTile(
              leading: Image.network(person.picture),
              title: Text(person.name),
              onTap: () =>
                  onPersonTap(person), // Call onPersonTap with the person object
            ),
          ),
      ],
    );
  }
}

class ToShowBlankPageHolder extends StatelessWidget {
  const ToShowBlankPageHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset('assets/images/Nature.com.png'),
        ),
        const Text(
          'Opps! Plese Select A Chat',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey),
        ),
      ]),
    );
  }
}
