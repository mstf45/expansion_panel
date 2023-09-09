import 'package:expansion_panel/model/items.dart';
import 'package:flutter/material.dart';

class ExpansionPanell extends StatefulWidget {
  const ExpansionPanell({super.key});

  @override
  State<ExpansionPanell> createState() => _ExpansionPanellState();
}

final List<Item> _data = newPanel(_sorular.length);
final List<String> _sorular = [
  'Ad Soyad',
  'Meslek',
  'Doğum Tarihi',
  'E-mail',
  'Cep Telefonu',
  'Cinsiyet',
];
List<Item> newPanel(int numberItem) {
  return List.generate(numberItem, (index) {
    return Item(headerValue: '${_sorular[index]}');
  });
}

class _ExpansionPanellState extends State<ExpansionPanell> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion Panel List Kullanımı'),
      ),
      body: _data.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                child: ExpansionPanelList(
                  expansionCallback: (panelIndex, isExpanded) {
                    setState(() {
                      _data[panelIndex].isExapanded = !isExpanded;
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
                        title: Text('Flutter Developer'),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              _data.remove(item);
                            });
                          },
                          child: Icon(Icons.delete),
                        ),
                      ),
                      isExpanded: item.isExapanded,
                    );
                  }).toList(),
                ),
              ),
            )
          : Center(
              child: Text(
                'Veri Yok',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
    );
  }
}
