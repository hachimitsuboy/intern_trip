import 'package:intern_trip/data_models/user_trip_data.dart';
import 'package:riverpod/riverpod.dart';

final userTripDataProvider = StateProvider<UserTripData>((ref) => UserTripData(
      goal: '',
      departureDate: DateTime.now(),
      industry: '',
      occupation: '',
    ));
