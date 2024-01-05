import 'package:flutter/material.dart';
import 'package:notes_app/db_handler.dart';
import 'package:notes_app/notes.dart';
import 'package:path_provider/path_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // initialize dbhelper class
   DBHelper? dbHelper ;
   late Future<List<NotesModel>> notesList ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    dbHelper = DBHelper();
    loadData();
  }

  loadData()async{
    notesList = dbHelper!.getNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes Sql'),
        centerTitle: true,
      ),

      body: Column(
        children: [

          Expanded(
            child: FutureBuilder(future: notesList, builder: (context,AsyncSnapshot<List<NotesModel>> snapshot){

              if(snapshot.hasData){

              }else{
                  return CircularProgressIndicator() ;
              }
              
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  reverse: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return InkWell(
                      onTap: (){
                        dbHelper!.update(
                          NotesModel(id: snapshot.data![index].id!,title: 'Flutter note', age: 20, description: 'Description box', email: 'madhav@gmail.com')
                        );
                        setState(() {
                          notesList = dbHelper!.getNotesList();
                        });
                      },
                      child: Dismissible(
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete_forever),
                        ),
                        onDismissed: (DismissDirection direction){
                          setState(() {
                              dbHelper!.delete(snapshot.data![index].id!);
                              notesList = dbHelper!.getNotesList();

                              snapshot.data!.remove(snapshot.data![index]);
                          });
                        },
                        key: ValueKey<int>(snapshot.data![index].id!),
                        child: Card(
                          child: ListTile(
                            
                            title: Text(snapshot.data![index].title.toString()),
                            subtitle: Text(snapshot.data![index].description.toString()),
                            trailing: Text(snapshot.data![index].age.toString()),
                          ),
                        ),
                      ),
                    );
              });
            }),
          )


        ],
      ),
      floatingActionButton:  FloatingActionButton(
        onPressed: (){
          dbHelper?.insert(
            NotesModel(
              title: 'First Note',
              age: 22,
              description: 'This is m first sql app',
              email: 'hi@gmail.com'
            )
          ).then((value){
            print('data added');

            setState(() {
              notesList = dbHelper!.getNotesList();
            });
          }).onError((error, stackTrace){
            print(error.toString());
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
