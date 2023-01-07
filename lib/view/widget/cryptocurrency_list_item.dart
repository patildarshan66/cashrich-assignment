import 'package:cashrich_assignment/model/cryptocurrency.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/custom_dimensions.dart';
import '../../utils/custom_text_styles.dart';

class CryptocurrencyListItem extends StatelessWidget {
  final Cryptocurrency cryptocurrency;
  const CryptocurrencyListItem({Key? key,required this.cryptocurrency}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
      const EdgeInsets.only(bottom: spacing_xxl_6),
      padding: const EdgeInsets.all(spacing_xxl_2),
      decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(px_10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex:2,
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cryptocurrency.name,
                  style: h4_20ptBold(color: yellowColor),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: spacing_xxl_7),
                Text(
                  'Price   \$ ${cryptocurrency.quote?.usd?.price?.toStringAsFixed(2)}',
                  style: subTitle1_16ptRegular(
                      color: greyTextColor),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_upward_sharp,
                        color: Colors.green),
                    const SizedBox(width: 2),
                    Text(
                      '${cryptocurrency.quote?.usd?.percentChange24H?.toStringAsFixed(2)}%',
                      style: subTitle2_14ptRegular(
                          color: greyTextColor),
                    ),
                  ],
                ),
                const SizedBox(height: spacing_xxl_7),
                Text(
                  'Rank  ${cryptocurrency.cmcRank}',
                  style: subTitle1_16ptRegular(
                      color: greyTextColor),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: px_4,horizontal: px_10),
                  decoration: BoxDecoration(
                      color: greyBGColor,
                      borderRadius: BorderRadius.circular(px_4)
                  ),
                  child: Text(
                    cryptocurrency.symbol,
                    style: subTitle2_14ptRegular(color: greyTextColor),
                  ),
                ),
                const SizedBox(height: spacing_xxl_4),
                Container(
                  width: px_30,
                  height: px_30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: yellowColor,
                      borderRadius:
                      BorderRadius.circular(px_15)),
                  child: const Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
