class Quote {
  Quote({
    required this.usd,
  });

  final PriceVolume? usd;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    usd: PriceVolume.fromJson(json["USD"]),
  );

  Map<String, dynamic> toJson() => {
    "USD": usd!.toJson(),
  };
}

class PriceVolume {
  PriceVolume({
    required this.price,
    required this.volume24H,
    required this.volumeChange24H,
    required this.percentChange1H,
    required this.percentChange24H,
    required this.percentChange7D,
    required this.percentChange30D,
    required this.percentChange60D,
    required this.percentChange90D,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.tvl,
    required this.lastUpdated,
  });

  final double? price;
  final double? volume24H;
  final double? volumeChange24H;
  final double? percentChange1H;
  final double? percentChange24H;
  final double? percentChange7D;
  final double? percentChange30D;
  final double? percentChange60D;
  final double? percentChange90D;
  final double? marketCap;
  final double? marketCapDominance;
  final double? fullyDilutedMarketCap;
  final dynamic tvl;
  final DateTime? lastUpdated;

  factory PriceVolume.fromJson(Map<String, dynamic> json) => PriceVolume(
    price: json["price"].toDouble(),
    volume24H: json["volume_24h"].toDouble(),
    volumeChange24H: json["volume_change_24h"].toDouble(),
    percentChange1H: json["percent_change_1h"].toDouble(),
    percentChange24H: json["percent_change_24h"].toDouble(),
    percentChange7D: json["percent_change_7d"].toDouble(),
    percentChange30D: json["percent_change_30d"].toDouble(),
    percentChange60D: json["percent_change_60d"].toDouble(),
    percentChange90D: json["percent_change_90d"].toDouble(),
    marketCap: json["market_cap"].toDouble(),
    marketCapDominance: json["market_cap_dominance"].toDouble(),
    fullyDilutedMarketCap: json["fully_diluted_market_cap"].toDouble(),
    tvl: json["tvl"],
    lastUpdated: DateTime.parse(json["last_updated"]),
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "volume_24h": volume24H,
    "volume_change_24h": volumeChange24H,
    "percent_change_1h": percentChange1H,
    "percent_change_24h": percentChange24H,
    "percent_change_7d": percentChange7D,
    "percent_change_30d": percentChange30D,
    "percent_change_60d": percentChange60D,
    "percent_change_90d": percentChange90D,
    "market_cap": marketCap,
    "market_cap_dominance": marketCapDominance,
    "fully_diluted_market_cap": fullyDilutedMarketCap,
    "tvl": tvl,
    "last_updated": lastUpdated?.toIso8601String(),
  };
}
