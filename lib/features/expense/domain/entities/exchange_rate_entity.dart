class ExchangeRateEntity {
  final DateTime rateDate;
  final String base;
  final String quote;
  final double rate;

  const ExchangeRateEntity({
    required this.rateDate,
    required this.base,
    required this.quote,
    required this.rate,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExchangeRateEntity &&
        other.rateDate == rateDate &&
        other.base == base &&
        other.quote == quote &&
        other.rate == rate;
  }

  @override
  int get hashCode {
    return rateDate.hashCode ^
        base.hashCode ^
        quote.hashCode ^
        rate.hashCode;
  }

  ExchangeRateEntity copyWith({
    DateTime? rateDate,
    String? base,
    String? quote,
    double? rate,
  }) {
    return ExchangeRateEntity(
      rateDate: rateDate ?? this.rateDate,
      base: base ?? this.base,
      quote: quote ?? this.quote,
      rate: rate ?? this.rate,
    );
  }
}
