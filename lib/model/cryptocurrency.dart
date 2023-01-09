import 'package:cashrich_assignment/model/quote.dart';

class Cryptocurrency {
  Cryptocurrency({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.isActive,
    required this.platform,
    required this.cmcRank,
    required this.isFiat,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedMarketCap,
    required this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });

  final int? id;
  final String name;
  final String symbol;
  final String? slug;
  final int? numMarketPairs;
  final DateTime? dateAdded;
  final List<String> tags;
  final int? maxSupply;
  final dynamic circulatingSupply;
  final dynamic totalSupply;
  final int? isActive;
  final dynamic platform;
  final int? cmcRank;
  final int? isFiat;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final dynamic tvlRatio;
  final DateTime? lastUpdated;
  final Quote? quote;

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) => Cryptocurrency(
    id: json["id"],
    name: json["name"] ?? '',
    symbol: json["symbol"] ?? '',
    slug: json["slug"],
    numMarketPairs: json["num_market_pairs"],
    dateAdded: DateTime.parse(json["date_added"]),
    tags: json["tags"] == null
        ? []
        : List<String>.from(json["tags"].map((x) => x)),
    maxSupply: json["max_supply"],
    circulatingSupply: json["circulating_supply"],
    totalSupply: json["total_supply"],
    isActive: json["is_active"],
    platform: json["platform"],
    cmcRank: json["cmc_rank"],
    isFiat: json["is_fiat"],
    selfReportedCirculatingSupply: json["self_reported_circulating_supply"],
    selfReportedMarketCap: json["self_reported_market_cap"],
    tvlRatio: json["tvl_ratio"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    quote: Quote.fromJson(json["quote"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "symbol": symbol,
    "slug": slug,
    "num_market_pairs": numMarketPairs,
    "date_added": dateAdded?.toIso8601String(),
    "tags": tags == null ? [] : List<dynamic>.from(tags.map((x) => x)),
    "max_supply": maxSupply,
    "circulating_supply": circulatingSupply,
    "total_supply": totalSupply,
    "is_active": isActive,
    "platform": platform,
    "cmc_rank": cmcRank,
    "is_fiat": isFiat,
    "self_reported_circulating_supply": selfReportedCirculatingSupply,
    "self_reported_market_cap": selfReportedMarketCap,
    "tvl_ratio": tvlRatio,
    "last_updated": lastUpdated?.toIso8601String(),
    "quote": quote!.toJson(),
  };
}