import 'package:get/get.dart';
import 'package:world_time/service/checklist.service.dart';

class AlbumController extends GetxController {
  // List<dynamic> albums = [];

  final test = 0.obs;
  final isLoading = true.obs;
  final albums = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var data = await ChecklistService().getTest();
      if (data != null) {
        albums.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}
