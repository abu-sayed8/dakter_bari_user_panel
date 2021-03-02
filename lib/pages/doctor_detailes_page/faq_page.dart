import 'package:flutter/material.dart';
import 'package:users_panel/shared/static_variable_page.dart';

class FAQPage extends StatefulWidget {
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //backgroundColor: Color(0xffF4F7F5),
      //appBar: customAppBarDesign(context, "FAQ"),
      body: ListView.builder(
        itemCount: faqDataList().length,
        itemBuilder: (context, index) => EntryItemTile(
          faqDataList()[index],
        ),
      ),

     );
  }
}

///Create the widget for the row...
class EntryItemTile extends StatelessWidget {
  final Entry entry;

  const EntryItemTile(this.entry);

  Widget _buildTiles(Entry root) {
    if (root.children.isEmpty) {
      return ListTile(
        title: Text(root.title,style: TextStyle(color: Colors.grey[800]),),
      );
    }
    return ExpansionTile(
      key: PageStorageKey<Entry>(root),
      title: Text(root.title,style: TextStyle(fontWeight: FontWeight.w500),),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
