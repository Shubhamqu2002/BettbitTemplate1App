import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../config/colors/app_colors.dart';

class OtpInputRow extends StatefulWidget {
  final int length;
  final String resendText;
  final VoidCallback? onResendTap;
  final ValueChanged<String>? onCompleted;

  const OtpInputRow({
    super.key,
    this.length = 4,
    this.resendText = 'Resend',
    this.onResendTap,
    this.onCompleted,
  });

  @override
  State<OtpInputRow> createState() => _OtpInputRowState();
}

class _OtpInputRowState extends State<OtpInputRow> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1) {
      if (index < widget.length - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
        final otp = _controllers.map((c) => c.text).join();
        widget.onCompleted?.call(otp);
      }
    } else if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.inputFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.inputBorder,
          width: 1.1,
        ),
      ),
      child: Row(
        children: [
          // OTP digit slots: digit | sep | digit | sep | digit | sep | digit | sep
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(widget.length * 2, (i) {
                // Even indices → digit input, odd indices → separator
                if (i.isOdd) {
                  return Container(
                    width: 1.2,
                    height: 24,
                    color: AppColors.textSecondary.withOpacity(0.35),
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                  );
                }

                final digitIndex = i ~/ 2;
                return SizedBox(
                  width: 28,
                  child: Center(
                    child: TextField(
                      controller: _controllers[digitIndex],
                      focusNode: _focusNodes[digitIndex],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                      decoration: const InputDecoration(
                        counterText: '',
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (val) => _onChanged(val, digitIndex),
                    ),
                  ),
                );
              }),
            ),
          ),

          // Resend button
          GestureDetector(
            onTap: widget.onResendTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.primaryGradientEnd.withOpacity(0.8),
                ),
              ),
              child: Text(
                widget.resendText,
                style: const TextStyle(
                  color: AppColors.primaryGradientEnd,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}