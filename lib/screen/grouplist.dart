import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

class GroupListScreen extends StatefulWidget {
  const GroupListScreen({super.key});

  @override
  State<GroupListScreen> createState() => _GroupListScreenState();
}

class _GroupListScreenState extends State<GroupListScreen> {
  final List _elements = [
    {'name': 'Aa', 'group': 'Group 1'},
    {'name': 'Bb', 'group': 'Group 2'},
    {'name': 'Cc', 'group': 'Group 1'},
    {'name': 'Dd', 'group': 'Group 2'},
    {'name': 'Ee', 'group': 'Group 3'},
    {'name': 'Ff', 'group': 'Group 3'},
    {'name': 'Gg', 'group': 'Group 1'},
    {'name': 'Hh', 'group': 'Group 2'},
    {'name': 'Ia', 'group': 'Group 1'},
    {'name': 'Ac', 'group': 'Group 3'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grouplist Screen'),
        centerTitle: true,
      ),
      body: GroupedListView<dynamic, String>(
        elements: _elements,
        groupBy: (element) => element['group'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['name'].compareTo(item2['name']),
        order: GroupedListOrder.DESC,
        useStickyGroupSeparators: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        itemBuilder: (c, element) {
          return Card(
            elevation: 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: const ImageIcon(NetworkImage(
                  'http://www.pngall.com/wp-content/uploads/2017/04/IPL-Logo-2017-PNG.png')),
              title: Text(element['name']),
            ),
          );
        },
      ),
    );
  }
}
