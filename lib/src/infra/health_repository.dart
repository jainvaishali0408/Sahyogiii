import 'package:sahyogii/src/models/vital.dart';
import 'package:health/health.dart';

class HealthRepository {
  final health = HealthFactory(useHealthConnectIfAvailable: false);
  var types = [
    HealthDataType.HEART_RATE,
    HealthDataType.HEART_RATE_VARIABILITY_SDNN,
    HealthDataType.RESTING_HEART_RATE,
    HealthDataType.HEART_RATE_RANGE,
    HealthDataType.HIGH_HEART_RATE_EVENT,
    HealthDataType.SPO2,
    HealthDataType.VO2_MAX,
    HealthDataType.BREATHING_RATE,
    HealthDataType.SKIN_TEMPERATURE,
    HealthDataType.CALORIES,
    HealthDataType.STEPS,
    HealthDataType.DISTANCE,
    HealthDataType.SLEEP_AWAKE,
    HealthDataType.SLEEP_IN_BED,
    HealthDataType.SLEEP_ASLEEP,
  ];
  Future<List<Vital>> getVital() async {
    bool requested = await health.requestAuthorization(types);

    var now = DateTime.now();
    if (requested) {
      List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
          DateTime.now().subtract(const Duration(days: 7)),
          DateTime.now(),
          types);
      var permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();
      await health.requestAuthorization(types, permissions: permissions);

      bool success = await health.writeHealthData(
          10, HealthDataType.BLOOD_OXYGEN, now, now);
      success =
          await health.writeHealthData(3.1, HealthDataType.types, now, now);

      return healthData.map((e) {
        var b = e;
        print(b.value.toJson()['numericValue']);
        return Vital(
          double.parse(b.value.toJson()['numericValue']) as int,
          b.unitString,
          b.dateFrom as String,
        );
      }).toList();
    }
    return [];
  }
}
