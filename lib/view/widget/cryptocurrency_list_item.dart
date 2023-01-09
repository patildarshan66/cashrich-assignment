import 'package:cashrich_assignment/model/cryptocurrency.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/custom_dimensions.dart';
import '../../utils/custom_text_styles.dart';
import '../../utils/utils.dart';

class CryptocurrencyListItem extends StatelessWidget {
  final Cryptocurrency cryptocurrency;
  const CryptocurrencyListItem({Key? key, required this.cryptocurrency})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: spacing_xxl_6),
      padding: const EdgeInsets.all(spacing_xxl_2),
      decoration: BoxDecoration(
          color: blackColor, borderRadius: BorderRadius.circular(px_10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  style: subTitle1_16ptRegular(color: greyTextColor),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.arrow_upward_sharp, color: Colors.green),
                    const SizedBox(width: 2),
                    Text(
                      '${cryptocurrency.quote?.usd?.percentChange24H?.toStringAsFixed(2)}%',
                      style: subTitle2_14ptRegular(color: greyTextColor),
                    ),
                  ],
                ),
                const SizedBox(height: spacing_xxl_7),
                Text(
                  'Rank  ${cryptocurrency.cmcRank}',
                  style: subTitle1_16ptRegular(color: greyTextColor),
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
                  padding: const EdgeInsets.symmetric(
                      vertical: px_4, horizontal: px_10),
                  decoration: BoxDecoration(
                      color: greyBGColor,
                      borderRadius: BorderRadius.circular(px_4)),
                  child: Text(
                    cryptocurrency.symbol,
                    style: subTitle2_14ptRegular(color: greyTextColor),
                  ),
                ),
                const SizedBox(height: spacing_xxl_4),
                InkWell(
                  onTap: () {
                    _showBottomSheet(context);
                  },
                  child: Container(
                    width: px_30,
                    height: px_30,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: yellowColor,
                        borderRadius: BorderRadius.circular(px_15)),
                    child: const Icon(Icons.arrow_forward),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      builder: (ctx) => Container(
        padding: EdgeInsets.all(spacing_xxl_2),
        margin: const EdgeInsets.all(spacing_xxl_2),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(px_8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                cryptocurrency.name,
                style: h4_20ptMedium(),
              ),
            ),
            const SizedBox(height: px_30),
            Text(
              'Tags',
              style: subTitle1_16ptRegular(),
            ),
            const SizedBox(height: spacing_m),
            SizedBox(
              height: px_30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cryptocurrency.tags.length,
                itemBuilder: (ctx, i) => Container(
                  height: px_30,
                  margin: const EdgeInsets.only(right: px_12),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(px_4),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(px_4)),
                  child: Text(cryptocurrency.tags[i]),
                ),
              ),
            ),
            const SizedBox(height: spacing_xxl_10),
            Text(
              'Price Last Updated',
              style: subTitle1_16ptRegular(),
            ),
            const SizedBox(height: spacing_xl),
            Text(
              dateFormatToString(cryptocurrency.lastUpdated),
              style: subTitle1_16ptMedium(color: Colors.green),
            ),
            const SizedBox(height: spacing_xxl_10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: yellowColor,
                minimumSize: const Size(double.infinity, px_50),
              ),
              onPressed: () {
               Navigator.of(context).pop();
              },
              child: Text('CLOSE', style: h4_20ptBold()),
            ),
          ],
        ),
      ),
    );
  }
}
