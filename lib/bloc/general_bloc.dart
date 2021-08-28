import 'package:rxdart/rxdart.dart';

class GeneralBloc  {
  BehaviorSubject<bool>  _loading = BehaviorSubject<bool>();

  BehaviorSubject<bool> get loading => _loading;

  setLoading(bool value){
      _loading.sink.add(value);
  }
}

final generalBloc = GeneralBloc();