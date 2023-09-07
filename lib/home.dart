import 'package:expansion_panel/model/items.dart';
import 'package:flutter/material.dart';

class ExpansionPanell extends StatefulWidget {
  const ExpansionPanell({super.key});

  @override
  State<ExpansionPanell> createState() => _ExpansionPanellState();
}

final List<Item> _data = newPanel(10);

//Örnek Veriler Oluştur.
List<Item> newPanel(int numberItems) {
  return List.generate(
    numberItems,
    (index) {
      return Item(headerValue: 'Meslek');
    },
  );
}

class _ExpansionPanellState extends State<ExpansionPanell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panel List Kullanımı'),
      ),
      body: _data.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      _data[panelIndex].isExpanded = !isExpanded;
                    });
                  },
                  children: _data.map((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (context, isExpanded) {
                        return ListTile(
                          title: Text(item.headerValue),
                        );
                      },
                      body: ListTile(
                        title: const Text('Flutter Developer'),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              _data.remove(item);
                            });
                          },
                          child: const Icon(Icons.delete),
                        ),
                      ),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                ),
              ),
            )
          : Center(
              child: Text(
                'Veri Yok',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
    );
  }
}