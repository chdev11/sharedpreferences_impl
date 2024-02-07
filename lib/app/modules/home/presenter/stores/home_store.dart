import 'package:mobx/mobx.dart';
import 'package:sample_project/app/modules/home/domain/entities/cloth.dart';
import 'package:sample_project/app/modules/home/presenter/states/cloth_state.dart';
import 'package:sample_project/app/services/local_storage/local_storage.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final ILocalStorage localStorage;

  HomeStoreBase(this.localStorage) {
    localStorage.loadDefault();
  }

  @observable
  IClothState state = ClothReady();

  @observable
  var clothList = ObservableList<Cloth>.of([]);

  @action
  Future<void> loadClothList() async {
    state = ClothLoading();

    final result = await localStorage.read();

    if (result != null) {
      clothList.clear();
      clothList.addAll(result as List<Cloth>);

      state = ClothSuccess();
    } else {
      state = ClothError(Exception('Falha ao carregar lista'));
    }
  }
}
