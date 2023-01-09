import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/colors.dart';
import '../utils/custom_dimensions.dart';
import '../utils/custom_text_styles.dart';
import '../view_model/cryptocurrency_view_model.dart';
import 'cryptocurrency_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController  _editingController = TextEditingController();

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            Expanded(child: _getBody()),
          ],
        ),
      ),
    );
  }

  _getBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(spacing_xxl_2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(px_8),
              color: Colors.black,
            ),
            child: TextFormField(
              controller: _editingController,
              validator: (str){
                if(str == null && (str ?? '').isEmpty){
                  return 'Please enter valid symbol';
                }
                return null;
              },
              style: subTitle2_14ptRegular(color: greyTextColor),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: greyTextColor),
                  hintText: 'Enter Coin Symbols',
                  hintStyle: subTitle2_14ptRegular(color: greyTextColor),
                  border: const OutlineInputBorder(),
                  contentPadding: EdgeInsets.zero),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: spacing_xxl_2),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: yellowColor,
              minimumSize: const Size(double.infinity, px_50),
            ),
            onPressed: () {
              if(! (_formKey.currentState?.validate() ??  false)){
                return;
              }
              Provider.of<CryptocurrencyViewModel>(context, listen: false).getCryptocurrencyList(_editingController.text,context,onApiResponse: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const CryptocurrencyScreen()));
              });
            },
            label: const Icon(
              Icons.arrow_forward,
              color: blackColor,
            ),
            icon: Text('SEARCH', style: h4_20ptBold()),
          ),
        )
      ],
    );
  }
}
