
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageDemoScreen extends StatefulWidget {

  const StorageDemoScreen({super.key});

  @override
  State<StorageDemoScreen> createState() => _StorageDemoScreenState();
}

class _StorageDemoScreenState extends State<StorageDemoScreen> {

  final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    saveData();
  }
   Future<void> saveData() async {
    SharedPreferences sPref = await pref;
    List<String> productStr  = List.generate(20, (index) => "Item ${index}");
    sPref.setStringList("products",productStr);
   }

   Future<List<String>> getData() async{
    SharedPreferences sPref = await pref;
    return sPref.getStringList("products") ?? [];
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage Demo"),
        actions: [
          Padding(padding: EdgeInsets.only(right: 100),
          child:  Icon(Icons.add, color: Colors.white,),)
          ],
      ),
      body: Center(
        child: buildProductListWidget,
      ),
    );
  }

  Widget get buildProductListWidget{
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context , AsyncSnapshot<List<String>> snapshot) {

          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData){
              List<String> productItems = snapshot.data ?? [];

              return ListView.builder(
                  itemCount: productItems.length,
                  itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      trailing: Icon(Icons.navigate_next),
                      title: Text("${productItems[index]}"),
                      leading: Icon(Icons.add),
                    ),
                  );
              });
            }else{
              return Text("No Data");
            }
          }else{
            return CircularProgressIndicator();
          }
        }
        );
  }

}
