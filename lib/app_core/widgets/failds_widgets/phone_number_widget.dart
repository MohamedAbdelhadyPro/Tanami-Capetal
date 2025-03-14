import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:provider/provider.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/style/colors/colors.dart';
import 'package:tanami_capital_task/features/initializer_feature/presentation/provider/initializer_provider.dart';

import '../../../features/initializer_feature/data/respone_models/country_model.dart';

class PhoneNumberWidget extends StatefulWidget {
  final ValueSetter<String> finalPhoneNumber;
  final ValueSetter<String>? basicPhoneNumber;
  final ValueSetter<CountryModel>? selectedCountry;
  final ValueSetter<bool> isPhoneOK;
  final double fontSize;
  final double labelFontSize;
  final double height;
  final String? label;
  final String? init;
  final int? countryCode;
  final bool readOnly;
  final bool showContactsList;
  final bool isPhoneOKValue;
  final BoxDecoration? decoration;

  const PhoneNumberWidget(
      {Key? key,
      required this.finalPhoneNumber,
      this.basicPhoneNumber,
      this.selectedCountry,
      this.decoration,
      this.fontSize = 14,
      this.labelFontSize = 14,
      this.height = 55,
      this.label,
      this.init,
      this.countryCode,
      this.readOnly = false,
      this.showContactsList = false,
      required this.isPhoneOK,
      this.isPhoneOKValue = false})
      : super(key: key);

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  late final TextEditingController phoneNoController;
  CountryModel? selectedCountry;
  bool isPhoneValidationOK = false;
  bool isFocus = false;
  String isoName = "EG";

  String _extractCountryCode(String phoneNumber) {
    final match = RegExp(r'^\+(\d+)').firstMatch(phoneNumber);
    return match != null ? match.group(1) ?? '' : '';
  }

  @override
  void initState() {
    if (widget.countryCode == null) {
      selectedCountry = context
          .read<InitializerProvider>()
          .state
          .countryList
          ?.firstWhere((e) => e.isoName == "BH");
    } else if (widget.countryCode != null) {
      selectedCountry = context
          .read<InitializerProvider>()
          .state
          .countryList
          ?.firstWhere((e) =>
              e.iso!.replaceAll("+", "") == widget.countryCode.toString());
      isPhoneValidationOK = widget.isPhoneOKValue;
    }
    String initialValue = '';
    if (widget.init != null && selectedCountry != null) {
      initialValue =
          widget.init!.replaceAll(selectedCountry!.iso.toString(), '');
    }
    phoneNoController = TextEditingController(text: initialValue);
    super.initState();
  }

  @override
  void dispose() {
    phoneNoController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InitializerProvider>(builder: (ctx, provider, child) {
      return Container(
          height: widget.height,
          decoration: widget.decoration ??
              BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300, width: 1)),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: <Widget>[
                IgnorePointer(
                  ignoring: widget.readOnly,
                  child: PopupMenuButton<CountryModel>(
                    itemBuilder: (context) => provider.state.countryList!
                        .map((e) => PopupMenuItem<CountryModel>(
                              value: e,
                              child: countryItemWidget(
                                  code: e.name.toString(),
                                  flag: e.flag.toString()),
                            ))
                        .toList(),
                    padding: EdgeInsets.zero,
                    onSelected: (v) {
                      // if (provider.state.isoName != v.isoName) {
                      if (widget.selectedCountry != null &&
                          selectedCountry?.iso != v.iso) {
                        widget.selectedCountry!(v);
                      }
                      setState(() {
                        selectedCountry = v;
                        isoName = v.isoName!;
                        isPhoneValidationOK = false;
                        phoneNoController.clear();
                      });
                      // }
                    },
                    onCanceled: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                      ),
                      height: 60,
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 0,
                      ),
                      child: Row(
                        textDirection: TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            selectedCountry!.flag.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            selectedCountry?.iso.toString() ??
                                context.tr.select_country,
                            style:
                                TextStyle(fontSize: 12, color: AppColors.black),
                            textDirection: TextDirection.ltr,
                          ),
                          const SizedBox(width: 2),
                          const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Focus(
                      onFocusChange: (hasFocus) {
                        if (hasFocus) {
                          isFocus = true;
                        } else {
                          isFocus = false;
                        }
                        setState(() {});
                      },
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        textDirection: TextDirection.ltr,
                        readOnly: widget.readOnly,
                        controller: phoneNoController,
                        onChanged: (text) async {
                          if (text.trim().isEmpty) {
                            widget.finalPhoneNumber("");
                            return;
                          }
                          IsoCode? isoLate = IsoCode.values.firstWhere(
                              (element) =>
                                  element.name == selectedCountry?.isoName);
                          PhoneNumber phone = PhoneNumber.parse(text,
                              callerCountry: isoLate,
                              destinationCountry: isoLate);
                          if (widget.basicPhoneNumber != null) {
                            widget.basicPhoneNumber!(text);
                          }
                          if (phone.international.length > 1) {
                            bool? validate =
                                phone.isValid(type: PhoneNumberType.mobile);

                            setState(() {
                              isPhoneValidationOK = validate;
                            });
                            widget.finalPhoneNumber(phone.international);
                            if (validate == true) {
                              widget.isPhoneOK(true);
                            } else {
                              widget.isPhoneOK(false);
                              //  widget.finalPhoneNumber("");
                            }
                          }
                        },
                        style: TextStyle(
                          fontSize: widget.fontSize,
                          height: 20 / 15,
                        ),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(
                            labelText: widget.label ?? context.tr.phone_number,
                            border: InputBorder.none,
                            labelStyle: TextStyle(
                              fontSize: widget.labelFontSize,
                              height: 20 / 15,
                              color: AppColors.black,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14,
                              height: 20 / 15,
                              color: AppColors.black,
                            )),
                      )),
                ),
                SizedBox(
                  width: 1.5.w,
                ),
                widget.readOnly
                    ? Icon(
                        Icons.done,
                        color: Colors.green[700],
                      )
                    : (phoneNoController.text.trim().isNotEmpty &&
                            isPhoneValidationOK != true)
                        ? InkWell(
                            borderRadius: BorderRadius.circular(50),
                            onTap: () {
                              setState(() {
                                phoneNoController.clear();
                                isPhoneValidationOK = false;
                                widget.isPhoneOK(false);
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                            ))
                        : (phoneNoController.text.trim().isNotEmpty &&
                                isPhoneValidationOK == true)
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.done,
                                  color: Colors.green[700],
                                ),
                              )
                            : Container(
                                width: 0,
                              ),
                SizedBox(
                  width: 5.w,
                ),
              ]));
    });
  }

  countryItemWidget({required String code, required String flag}) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: Row(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            code,
            style: TextStyle(fontSize: 15, color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
