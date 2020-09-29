import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:form_get_users_bloc/models/user.dart';
import 'package:http/http.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final _link = "https://jsonplaceholder.typicode.com/users";
  List<User> _userList;
  List<User> _userListP = List();
  List<User> _userListI = List();

  HomeBloc() : super(HomeInitial());

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is GetAllUsersEvent) {
      yield LoadingState();
      await _getAllUsers();
      if (_userList.length > 0)
        yield ShowUsersState(usersList: _userList);
      else
        yield ErrorState(error: "No hay elementos por mostrar");
    } else if (event is FilterUsersEvent) {
      // TODO hacer despues
      yield LoadingState();
      if (event.filterEven == true) {
        await _getUserP();
        yield FilterUsersPState(userListP: _userListP);
      } else {
        await _getUserI();
        yield FilterUsersIState(userListI: _userListI);
      }
    }
  }

  Future _getAllUsers() async {
    try {
      Response response = await get(_link);
      if (response.statusCode == 200) {
        _userList = List();
        List<dynamic> data = jsonDecode(response.body);
        _userList = data.map((element) => User.fromJson(element)).toList();
      }
    } catch (error) {
      print(error.toString());
      _userList = List();
    }
  }

  Future _getUserP() async {
    for (var i = 0; i < _userList.length; i++) {
      if (_userList[i].id % 2 == 0) {
        _userListP.add(_userList[i]);
      }
    }
  }

  Future _getUserI() async {
    for (var i = 0; i < _userList.length; i++) {
      if (_userList[i].id % 2 != 0) {
        _userListI.add(_userList[i]);
      }
    }
  }
}
