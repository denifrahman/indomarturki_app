import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:indomarturki_app/bloc/general_bloc.dart';
import 'package:indomarturki_app/model/home_produk_slide/home_produk_slide_model.dart';
import 'package:indomarturki_app/repository/home_repository.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {

  HomeRepository _homeRepository = HomeRepository();

  BehaviorSubject<HomeProdukSlideModel> _homeProdukSlde = BehaviorSubject<HomeProdukSlideModel>();

  BehaviorSubject<HomeProdukSlideModel> get homeProdukSlde => _homeProdukSlde;

  findProdukSlide()async{
    EasyLoading.show(status: 'Loading', dismissOnTap: true);
    generalBloc.setLoading(true);
    HomeProdukSlideModel response = await _homeRepository.findProdukSlide();
    _homeProdukSlde.sink.add(response);
    generalBloc.setLoading(false);
    EasyLoading.dismiss();
  }
}
final homeBloc = HomeBloc();
