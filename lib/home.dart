import 'package:expansion_panel/model/items.dart';
import 'package:flutter/material.dart';

class ExpansionePanel extends StatefulWidget {
  const ExpansionePanel({super.key});

  @override
  _ExpansionePanelState createState() => _ExpansionePanelState();
}

class _ExpansionePanelState extends State<ExpansionePanel> {
  final List<Item> _data = generateItems(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Panel List Kullanımı'),
      ),
      body: _data.isNotEmpty
          ? SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: ExpansionPanelList(
                  elevation: 1,
                  expandedHeaderPadding: const EdgeInsets.all(0),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      _data[index].isExpanded = !isExpanded;
                    });
                  },
                  children: _data.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.headerValue),
                        );
                      },
                      body: ListTile(
                        title: Text(item.expandedValue),
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              _data.remove(item);
                            });
                          },
                          icon: const Icon(Icons.delete),
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
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
    );
  }
}

// Örnek verileri oluştur
List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(
    numberOfItems,
    (int index) {
      return Item(
        headerValue: 'Başlık ${index + 1}',
        expandedValue: 'Bu öğenin ayrıntıları ${index + 1}',
      );
    },
  );
}