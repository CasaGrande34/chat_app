import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../models/user.dart';

//dependencies

//file addresses

class UsuariosScreen extends StatefulWidget {
  
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  
  RefreshController refreshController = RefreshController(initialRefresh: false);
  
  final users = [
    User( uid: '1', nombre: 'Marisa', email: 'test1@test.com', online: true ),
    User( uid: '2', nombre: 'Leo',    email: 'test2@test.com', online: false ),
    User( uid: '3', nombre: 'Juan',   email: 'test3@test.com', online: true ),
    
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mi nombre', style: TextStyle( color: Colors.black87 ),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app, color: Colors.black87,), 
          onPressed: () {},
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.check_circle, color: Colors.blue,)
          ),
        ],
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: _cargarUser,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check_circle, color: Colors.blue[400]),
          waterDropColor: Colors.blue[400]!,
        ),
        child: _listViewUsers()
      )
   );
  }

  ListView _listViewUsers() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) => _usuarioListTile(users[index])), 
      separatorBuilder: ((context, index) => const Divider()), 
      itemCount: users.length
    );
  }

  ListTile _usuarioListTile(User user) {
    return ListTile(
        title: Text(user.nombre),
        subtitle: Text(user.email),
        leading: CircleAvatar(
          backgroundColor: Colors.blue[100],
          child: Text(user.nombre.substring( 0,2 )),
        ),
        trailing: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: user.online ? Colors.green[300] : Colors.red,
            borderRadius: BorderRadius.circular( 100 )
          ),
        ),
      );
  }
  
  _cargarUser() async{
    
    await Future.delayed(const Duration( milliseconds: 1000) );
    refreshController.refreshCompleted();
  }
}