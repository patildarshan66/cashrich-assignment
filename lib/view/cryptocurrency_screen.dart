import 'package:cashrich_assignment/utils/colors.dart';
import 'package:cashrich_assignment/utils/custom_text_styles.dart';
import 'package:cashrich_assignment/utils/enums.dart';
import 'package:cashrich_assignment/view/widget/cryptocurrency_list_item.dart';
import 'package:cashrich_assignment/view/widget/shimmer_loader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../utils/custom_dimensions.dart';
import '../view_model/cryptocurrency_view_model.dart';

class CryptocurrencyScreen extends StatefulWidget {
  const CryptocurrencyScreen({Key? key}) : super(key: key);

  @override
  State<CryptocurrencyScreen> createState() => _CryptocurrencyScreenState();
}

class _CryptocurrencyScreenState extends State<CryptocurrencyScreen> {
  @override
  void initState() {
    Provider.of<CryptocurrencyViewModel>(context, listen: false)
        .getCryptocurrencyList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<CryptocurrencyViewModel>(context, listen: true);
    return Scaffold(
      backgroundColor: greyBGColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: blackColor,
              width: double.infinity,
              height: spacing_xxl_28,
              child: Text(
                'CoinRich',
                style: h2_32ptBold(color: whiteColor),
              ),
            ),
            Expanded(child: _getBody(provider)),
          ],
        ),
      ),
    );
  }

  Widget _getBody(CryptocurrencyViewModel provider) {
    switch (provider.response.status) {
      case Status.COMPLETED:
        return Padding(
          padding: const EdgeInsets.all(spacing_xxl_2),
          child: provider.cryptocurrencyList.isNotEmpty
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.pie_chart,
                                color: yellowColor, size: px_30),
                            const SizedBox(width: px_10),
                            Text(
                              'Show Chart',
                              style: subTitle1_16ptRegular(color: yellowColor),
                            )
                          ],
                        ),
                        Text(
                          'Count: ${provider.cryptocurrencyList.length}',
                          style: subTitle1_16ptRegular(color: greyTextColor),
                        )
                      ],
                    ),
                    const SizedBox(height: spacing_xxl_4),
                    Expanded(
                      child: ListView.builder(
                        itemCount: provider.cryptocurrencyList.length,
                        itemBuilder: (ctx, i) {
                          return CryptocurrencyListItem(
                            cryptocurrency: provider.cryptocurrencyList[i],
                          );
                        },
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Text(
                    'No Data available at this movement',
                    style: h4_20ptMedium(color: whiteColor),
                  ),
                ),
        );
      case Status.ERROR:
      case Status.NOINTERNET:
        return Center(
          child: Text(provider.response.message ?? ''),
        );
      case Status.LOADING:
      default:
        return Column(
          children: [
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: ListView.builder(
                  itemBuilder: (_, __) => const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: ShimmerLoader(),
                  ),
                  itemCount: 6,
                ),
              ),
            ),
          ],
        );
    }
  }
}
