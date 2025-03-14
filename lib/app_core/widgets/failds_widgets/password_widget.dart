import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tanami_capital_task/app_core/extensions/translate_extension.dart';
import 'package:tanami_capital_task/app_core/widgets/image_widget.dart';

import '../../enums/password_validation.dart';
import '../../style/colors/colors.dart';
import '../../style/images/assets.gen.dart';

class PasswordWidget extends StatefulWidget {
  final TextEditingController? passwordNoController;
  final ValueSetter<bool> isPasswordValid;
  final String label;
  final bool autofocus;
  final bool shouldValidatePassword;

  const PasswordWidget({
    Key? key,
    this.passwordNoController,
    required this.isPasswordValid,
    required this.label,
    this.autofocus = false,
    this.shouldValidatePassword = true,
  }) : super(key: key);

  @override
  _PasswordCardState createState() => _PasswordCardState();
}

class _PasswordCardState extends State<PasswordWidget> {
  bool showPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            color: AppColors.white,
          ),
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.ltr,
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                child: InkWell(
                  onTap: () {
                    if (mounted) {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    }
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Icon(
                    showPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: AppColors.black,
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  controller: widget.passwordNoController,
                  textAlign: TextAlign.start,
                  obscureText: showPassword,
                  obscuringCharacter: '*',
                  autofocus: widget.autofocus,
                  onChanged: (text) async {
                    widget.isPasswordValid(!widget.shouldValidatePassword ||
                        validatePassword(
                                widget.passwordNoController?.text ?? '') ==
                            PasswordValidation.VALID);
                  },
                  style: TextStyle(
                      fontSize: 15, height: 20 / 15, color: AppColors.black),
                  decoration: InputDecoration(
                      labelText: widget.label,
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 15,
                        height: 20 / 15,
                        color: AppColors.grey,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 15,
                        height: 20 / 15,
                        color: AppColors.black,
                      )),
                ),
              ),
              SizedBox(
                width: 3.w,
              ),
              Container(
                width: 1,
                height: 29,
                color: AppColors.grey,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: ImageWidget(Assets.svg.unlock.path),
              ),
            ],
          ),
        ),
        if (widget.shouldValidatePassword &&
            validatePassword(widget.passwordNoController?.text ?? '') ==
                PasswordValidation.INVALID) ...[
          SizedBox(height: 4),
          Text(
            context.tr.password_validation_message,
            style: TextStyle(color: AppColors.red, fontSize: 12),
          )
        ]
      ],
    );
  }
}

PasswordValidation validatePassword(String value) {
  if (value.isEmpty) return PasswordValidation.EMPTY;
  if (value.length >= 8 &&
      RegExp(r'[A-Z]').hasMatch(value) &&
      RegExp(r'[a-z]').hasMatch(value) &&
      RegExp(r'[0-9]').hasMatch(value) &&
      RegExp(r'[^A-Za-z0-9]').hasMatch(value)) return PasswordValidation.VALID;

  return PasswordValidation.INVALID;
}
