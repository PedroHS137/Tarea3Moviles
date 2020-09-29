import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc _homeBlocs;
  @override
  void dispose() {
    _homeBlocs.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users list"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("Ordenar pares"),
              onTap: () {
                //BlocProvider.of<HomeBloc>(context)
                //.add(FilterUsersEvent(filterEven: true));
                _homeBlocs.add(FilterUsersEvent(filterEven: true));
              },
            ),
            ListTile(
              title: Text("Ordenar impares"),
              onTap: () {
                _homeBlocs.add(FilterUsersEvent(filterEven: false));
              },
            )
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) {
          _homeBlocs = HomeBloc()..add(GetAllUsersEvent());
          return _homeBlocs;
        },
        child: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            // para mostrar dialogos o snackbars
            if (state is ErrorState) {
              Scaffold.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text("Error: ${state.error}")),
                );
            }
          },
          builder: (context, state) {
            if (state is ShowUsersState) {
              return RefreshIndicator(
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.black),
                    itemCount: state.usersList.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(state.usersList[index].name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.usersList[index].company.name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.usersList[index].address.street),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.usersList[index].phone),
                                ],
                              )
                            ],
                          ),
                        )),
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context).add(GetAllUsersEvent());
                },
              );
            } else if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FilterUsersPState) {
              return RefreshIndicator(
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.black),
                    itemCount: state.userListP.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(state.userListP[index].name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.userListP[index].company.name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.userListP[index].address.street),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.userListP[index].phone),
                                ],
                              )
                            ],
                          ),
                        )),
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context)
                      .add((FilterUsersEvent(filterEven: true)));
                },
              );
            } else if (state is FilterUsersIState) {
              return RefreshIndicator(
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Divider(color: Colors.black),
                    itemCount: state.userListI.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text(state.userListI[index].name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.userListI[index].company.name),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.userListI[index].address.street),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(state.userListI[index].phone),
                                ],
                              )
                            ],
                          ),
                        )),
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context)
                      .add((FilterUsersEvent(filterEven: false)));
                },
              );
            }

            return Center(
              child: MaterialButton(
                onPressed: () {
                  BlocProvider.of<HomeBloc>(context).add(GetAllUsersEvent());
                },
                child: Text("Cargar de nuevo"),
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
 ListView.separated(
                  itemCount: state.usersList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(state.usersList[index].name),
                    );
                  },
                ),*/
