import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/core/network/dio_client.dart';
import 'package:get/get.dart';
class TypesAssistancesProvider {
	final _dioClient = Get.find<DioClient>();

	Future<ResponseTypesAssistancesModel> getTypesAssistances() async {
		final response = await _dioClient.get(
			path: "/api/informationTables/typesMarking",
		);
		return ResponseTypesAssistancesModel.fromJson(response);
	}
}
