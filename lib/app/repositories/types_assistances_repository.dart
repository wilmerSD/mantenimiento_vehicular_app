import 'package:app_valtx_asistencia/app/models/response/response_types_assistances_model.dart';
import 'package:app_valtx_asistencia/app/providers/types_assistances_provider.dart';
import 'package:get/get.dart';

class TypesAssistancesUserRepository {
	final _apiProvider = Get.find<TypesAssistancesProvider>();

	Future<ResponseTypesAssistancesModel> getTypesAssistances(
	) =>
		_apiProvider.getTypesAssistances();

}
