import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:provider/provider.dart';
import '../utils/colors.dart';
import '../utils/custom_dimensions.dart';
import '../utils/custom_text_styles.dart';
import '../view_model/cryptocurrency_view_model.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
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

  _getBody(CryptocurrencyViewModel provider) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.list, color: yellowColor, size: px_30),
                const SizedBox(width: px_10),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Show List',
                    style: subTitle1_16ptRegular(color: yellowColor),
                  ),
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
      ],
    );
  }
}
