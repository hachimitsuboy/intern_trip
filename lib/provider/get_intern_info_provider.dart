import 'package:intern_trip/data_models/intern_data.dart';
import 'package:intern_trip/models/database_manager.dart';
import 'package:intern_trip/provider/user_trip_data_provider.dart';
import 'package:riverpod/riverpod.dart';

final getInternInfoProvider = FutureProvider<List<Intern>>((ref) async {
  final userTripData = ref.watch(userTripDataProvider);
  final databaseManager = DatabaseManager();
  return databaseManager.getInternInfo(
    userTripData.goal,
    userTripData.departureDate,
    userTripData.industry,
    userTripData.occupation,
  );
});
