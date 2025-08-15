enum RecurringFrequency { daily, weekly, monthly, yearly, custom }

class RecurringRuleEntity {
  final int? ruleId;
  final String uid;
  final String templateJson;
  final RecurringFrequency freq;
  final int interval;
  final String? byweekday;
  final String? bymonthday;
  final DateTime nextRunOn;
  final bool isPaused;

  const RecurringRuleEntity({
    this.ruleId,
    required this.uid,
    required this.templateJson,
    required this.freq,
    this.interval = 1,
    this.byweekday,
    this.bymonthday,
    required this.nextRunOn,
    this.isPaused = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RecurringRuleEntity &&
        other.ruleId == ruleId &&
        other.uid == uid &&
        other.templateJson == templateJson &&
        other.freq == freq &&
        other.interval == interval &&
        other.byweekday == byweekday &&
        other.bymonthday == bymonthday &&
        other.nextRunOn == nextRunOn &&
        other.isPaused == isPaused;
  }

  @override
  int get hashCode {
    return ruleId.hashCode ^
        uid.hashCode ^
        templateJson.hashCode ^
        freq.hashCode ^
        interval.hashCode ^
        byweekday.hashCode ^
        bymonthday.hashCode ^
        nextRunOn.hashCode ^
        isPaused.hashCode;
  }

  RecurringRuleEntity copyWith({
    int? ruleId,
    String? uid,
    String? templateJson,
    RecurringFrequency? freq,
    int? interval,
    String? byweekday,
    String? bymonthday,
    DateTime? nextRunOn,
    bool? isPaused,
  }) {
    return RecurringRuleEntity(
      ruleId: ruleId ?? this.ruleId,
      uid: uid ?? this.uid,
      templateJson: templateJson ?? this.templateJson,
      freq: freq ?? this.freq,
      interval: interval ?? this.interval,
      byweekday: byweekday ?? this.byweekday,
      bymonthday: bymonthday ?? this.bymonthday,
      nextRunOn: nextRunOn ?? this.nextRunOn,
      isPaused: isPaused ?? this.isPaused,
    );
  }
}
