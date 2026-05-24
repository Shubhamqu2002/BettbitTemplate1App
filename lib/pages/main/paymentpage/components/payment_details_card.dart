import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import 'payment_method_selection_card.dart';

class PaymentDetailsCard extends StatelessWidget {
  final bool isDeposit;
  final int amount;
  final PaymentMethodModel method;

  const PaymentDetailsCard({
    super.key,
    required this.isDeposit,
    required this.amount,
    required this.method,
  });

  @override
  Widget build(BuildContext context) {
    final fields = _getFields();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 20),
      decoration: BoxDecoration(
        color: const Color(0xFF080B12),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.inputBorder, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(method: method, amount: amount, isDeposit: isDeposit),
          const SizedBox(height: 22),

          ...fields.map((field) {
            if (field.type == PaymentFieldType.dropdown) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _DropdownInput(
                  label: field.label,
                  hint: field.hint,
                  items: field.dropdownItems,
                ),
              );
            }

            if (field.type == PaymentFieldType.upload) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _UploadBox(label: field.label),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TextInput(
                label: field.label,
                hint: field.hint,
                icon: field.icon,
                obscureText: field.obscureText,
                keyboardType: field.keyboardType,
              ),
            );
          }),
        ],
      ),
    );
  }

  List<PaymentFieldModel> _getFields() {
    switch (method.keyName) {
      case 'upi':
        return const [
          PaymentFieldModel(
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'UPI ID',
            hint: 'example@upi',
            icon: Icons.account_balance_wallet_outlined,
          ),
        ];

      case 'card':
        return const [
          PaymentFieldModel(
            label: 'Card Holder Name',
            hint: 'Enter card holder name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Card Number',
            hint: '0000 0000 0000 0000',
            icon: Icons.credit_card_rounded,
            keyboardType: TextInputType.number,
          ),
          PaymentFieldModel(
            label: 'Expiry Date',
            hint: 'MM/YY',
            icon: Icons.calendar_month_outlined,
            keyboardType: TextInputType.datetime,
          ),
          PaymentFieldModel(
            label: 'CVV',
            hint: '***',
            icon: Icons.lock_outline_rounded,
            obscureText: true,
            keyboardType: TextInputType.number,
          ),
        ];

      case 'net_banking':
        return const [
          PaymentFieldModel(
            label: 'Select Bank',
            hint: 'Choose your bank',
            type: PaymentFieldType.dropdown,
            dropdownItems: [
              'State Bank of India',
              'HDFC Bank',
              'ICICI Bank',
              'Axis Bank',
              'Punjab National Bank',
              'Kotak Mahindra Bank',
            ],
          ),
          PaymentFieldModel(
            label: 'User Name',
            hint: 'Enter net banking user name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Password',
            hint: 'Enter password',
            icon: Icons.lock_outline_rounded,
            obscureText: true,
          ),
        ];

      case 'razorpay':
        return const [
          PaymentFieldModel(
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Email ID',
            hint: 'Enter email address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          PaymentFieldModel(
            label: 'Phone Number',
            hint: 'Enter phone number',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
        ];

      case 'cash':
        return const [
          PaymentFieldModel(
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Phone Number',
            hint: 'Enter phone number',
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          PaymentFieldModel(
            label: 'Transaction ID',
            hint: 'Enter transaction/reference ID',
            icon: Icons.receipt_long_outlined,
          ),
          PaymentFieldModel(
            label: 'Upload Payment Screenshot',
            hint: '',
            type: PaymentFieldType.upload,
          ),
        ];

      case 'stripe':
        return const [
          PaymentFieldModel(
            label: 'Full Name',
            hint: 'Enter full name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Email ID',
            hint: 'Enter email address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          PaymentFieldModel(
            label: 'Card Number',
            hint: '0000 0000 0000 0000',
            icon: Icons.credit_card_rounded,
            keyboardType: TextInputType.number,
          ),
          PaymentFieldModel(
            label: 'Expiry Date',
            hint: 'MM/YY',
            icon: Icons.calendar_month_outlined,
          ),
          PaymentFieldModel(
            label: 'CVV',
            hint: '***',
            icon: Icons.lock_outline_rounded,
            obscureText: true,
            keyboardType: TextInputType.number,
          ),
        ];

      case 'bank_transfer':
        return const [
          PaymentFieldModel(
            label: 'Account Holder Name',
            hint: 'Enter account holder name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Email ID',
            hint: 'Enter email address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          PaymentFieldModel(
            label: 'Account Number',
            hint: 'Enter account number',
            icon: Icons.numbers_rounded,
            keyboardType: TextInputType.number,
          ),
          PaymentFieldModel(
            label: 'Bank Code / IFSC',
            hint: 'Enter bank code or IFSC',
            icon: Icons.account_balance_rounded,
          ),
          PaymentFieldModel(
            label: 'Transaction Password',
            hint: 'Enter transaction password',
            icon: Icons.lock_outline_rounded,
            obscureText: true,
          ),
        ];

      case 'upi_withdraw':
        return const [
          PaymentFieldModel(
            label: 'Full Name',
            hint: 'Enter your full name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'UPI ID',
            hint: 'example@upi',
            icon: Icons.account_balance_wallet_outlined,
          ),
        ];

      case 'paypal_withdraw':
        return const [
          PaymentFieldModel(
            label: 'PayPal Account Name',
            hint: 'Enter PayPal account name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'PayPal Email ID',
            hint: 'Enter PayPal email address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          PaymentFieldModel(
            label: 'Transaction Password',
            hint: 'Enter transaction password',
            icon: Icons.lock_outline_rounded,
            obscureText: true,
          ),
        ];

      case 'stripe_withdraw':
        return const [
          PaymentFieldModel(
            label: 'Full Name',
            hint: 'Enter full name',
            icon: Icons.person_outline_rounded,
          ),
          PaymentFieldModel(
            label: 'Stripe Email ID',
            hint: 'Enter Stripe email address',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
          ),
          PaymentFieldModel(
            label: 'Stripe Account ID',
            hint: 'acct_xxxxxxxxx',
            icon: Icons.badge_outlined,
          ),
          PaymentFieldModel(
            label: 'Transaction Password',
            hint: 'Enter transaction password',
            icon: Icons.lock_outline_rounded,
            obscureText: true,
          ),
        ];

      default:
        return const [];
    }
  }
}

class _Header extends StatelessWidget {
  final PaymentMethodModel method;
  final int amount;
  final bool isDeposit;

  const _Header({
    required this.method,
    required this.amount,
    required this.isDeposit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: method.iconColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: method.iconText != null
                ? Text(
                    method.iconText!,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                    ),
                  )
                : Icon(method.icon, color: AppColors.white, size: 23),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${method.title} Details',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '${isDeposit ? 'Deposit' : 'Withdraw'} Amount: ₹$amount',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TextInput extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;

  const _TextInput({
    required this.label,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label: label),
        const SizedBox(height: 9),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          cursorColor: AppColors.primaryGradientEnd,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
            prefixIcon: icon == null
                ? null
                : Icon(
                    icon,
                    color: AppColors.textSecondary,
                    size: 20,
                  ),
            filled: true,
            fillColor: const Color(0xFF02070C),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.primaryGradientEnd.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DropdownInput extends StatefulWidget {
  final String label;
  final String hint;
  final List<String> items;

  const _DropdownInput({
    required this.label,
    required this.hint,
    required this.items,
  });

  @override
  State<_DropdownInput> createState() => _DropdownInputState();
}

class _DropdownInputState extends State<_DropdownInput> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label: widget.label),
        const SizedBox(height: 9),
        DropdownButtonFormField<String>(
          value: selectedValue,
          dropdownColor: const Color(0xFF080B12),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.textSecondary,
          ),
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFF02070C),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: AppColors.inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: AppColors.primaryGradientEnd.withOpacity(0.8),
              ),
            ),
          ),
          hint: Text(
            widget.hint,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          items: widget.items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() => selectedValue = value);
          },
        ),
      ],
    );
  }
}

class _UploadBox extends StatelessWidget {
  final String label;

  const _UploadBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Label(label: label),
        const SizedBox(height: 9),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF02070C),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.inputBorder,
              width: 1,
            ),
          ),
          child: Column(
            children: const [
              Icon(
                Icons.cloud_upload_outlined,
                color: AppColors.textSecondary,
                size: 34,
              ),
              SizedBox(height: 10),
              Text(
                'Upload transaction screenshot',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'PNG, JPG or JPEG supported',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Label extends StatelessWidget {
  final String label;

  const _Label({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 13,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

enum PaymentFieldType {
  text,
  dropdown,
  upload,
}

class PaymentFieldModel {
  final String label;
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final PaymentFieldType type;
  final List<String> dropdownItems;

  const PaymentFieldModel({
    required this.label,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.keyboardType,
    this.type = PaymentFieldType.text,
    this.dropdownItems = const [],
  });
}