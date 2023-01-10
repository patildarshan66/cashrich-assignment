import 'package:chart_components/bar_chart_component.dart';
import 'package:flutter/material.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<CryptocurrencyViewModel>(context, listen: false).loadChartData();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<CryptocurrencyViewModel>(context, listen: true);
    provider.cryptocurrencyList;
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(spacing_xxl_2),
          child: Row(
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
        ),
        const SizedBox(height: spacing_xxl_4),
        Padding(
          padding: const EdgeInsets.all(px_40),
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: BarChart(
                data: provider.prices,
                labels: provider.names,
                labelStyle: subTitle1_16ptMedium(color: greyTextColor),
                valueStyle: subTitle1_16ptMedium(color: greyTextColor),
                displayValue: false,
                reverse: false,
                getColor: (value) => _getBarColor(value),
                barWidth: 50,
                barSeparation: 12,
                animationDuration: const Duration(milliseconds: 1000),
                animationCurve: Curves.easeInOutSine,
                itemRadius: 10,
                iconHeight: 24,
                footerHeight: 24,
                headerValueHeight: 16,
                roundValuesOnText: false,
                // lineGridColor: Colors.lightBlue,
              ),
            ),
          ),
        ),
      ],
    );
  }

  _getBarColor(int index){
   if(index == 0){
     return lightRedColor;
   }else if( index == 1){
     return darkBlueColor;
   }else if( index == 2){
     return pinkColor;
   }else if (index == 3){
     return skyBlueColor;
   }
   else if (index == 4){
     return yellowGreenColor;
   }else{
     return Colors.orange;
   }
  }

}
