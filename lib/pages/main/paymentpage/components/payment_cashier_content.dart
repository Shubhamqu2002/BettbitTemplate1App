import 'package:flutter/material.dart';
import '../../../../components/auth_button.dart';
import '../../../../components/auth_tab_toggle.dart';
import '../../../../config/colors/app_colors.dart';
import 'payment_amount_selection_card.dart';
import 'payment_method_selection_card.dart';
import 'payment_details_card.dart';

class PaymentCashierContent extends StatefulWidget {
  const PaymentCashierContent({super.key});

  @override
  State<PaymentCashierContent> createState() => _PaymentCashierContentState();
}

class _PaymentCashierContentState extends State<PaymentCashierContent> {
  int selectedTab = 0;
  int selectedAmount = 500;
  int currentStep = 0;
  int? selectedPaymentMethodIndex;

  final List<int> amounts = [500, 1000, 2000, 5000, 10000];

  bool get isDeposit => selectedTab == 0;

  List<PaymentMethodModel> get currentMethods =>
      PaymentMethodSelectionCard.getMethods(isDeposit);

  PaymentMethodModel? get selectedMethod {
    if (selectedPaymentMethodIndex == null) return null;
    return currentMethods[selectedPaymentMethodIndex!];
  }

  void _onTabChanged(int index) {
    setState(() {
      selectedTab = index;
      selectedAmount = index == 0 ? 500 : 1000;
      currentStep = 0;
      selectedPaymentMethodIndex = null;
    });
  }

  void _onContinue() {
    if (currentStep == 0) {
      setState(() => currentStep = 1);
      return;
    }

    if (currentStep == 1) {
      if (selectedPaymentMethodIndex == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select a payment method')),
        );
        return;
      }

      setState(() => currentStep = 2);
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isDeposit
              ? 'Deposit details submitted successfully'
              : 'Withdrawal details submitted successfully',
        ),
      ),
    );
  }

  void _onBackStep() {
    if (currentStep == 0) return;

    setState(() {
      currentStep--;
    });
  }

  String get buttonTitle {
    if (currentStep == 0) return 'Continue';
    if (currentStep == 1) return 'Next';
    return 'Submit';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 18, 16, 24),
            physics: const BouncingScrollPhysics(),
            children: [
              Row(
                children: [
                  if (currentStep > 0)
                    GestureDetector(
                      onTap: _onBackStep,
                      child: Container(
                        width: 34,
                        height: 34,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xFF101B26),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.inputBorder),
                        ),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: AppColors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  const Expanded(
                    child: Text(
                      'Secure Cashier',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'Manage your deposits and withdrawals securely',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 26),

              AuthTabToggle(
                selectedIndex: selectedTab,
                leftTitle: 'Deposit',
                rightTitle: 'Withdrawals',
                onChanged: _onTabChanged,
              ),

              const SizedBox(height: 38),

              if (currentStep == 0) ...[
                _WalletIcon(isDeposit: isDeposit),
                const SizedBox(height: 30),
                PaymentAmountSelectionCard(
                  title: isDeposit ? 'Deposit Amount' : 'Withdrawal Amount',
                  selectedAmount: selectedAmount,
                  amounts: amounts,
                  onAmountChanged: (value) {
                    setState(() => selectedAmount = value);
                  },
                ),
              ] else if (currentStep == 1)
                PaymentMethodSelectionCard(
                  isDeposit: isDeposit,
                  selectedAmount: selectedAmount,
                  selectedIndex: selectedPaymentMethodIndex,
                  onSelected: (index) {
                    setState(() => selectedPaymentMethodIndex = index);
                  },
                )
              else
                PaymentDetailsCard(
                  isDeposit: isDeposit,
                  amount: selectedAmount,
                  method: selectedMethod!,
                ),

              const SizedBox(height: 76),
              const _PaymentInfoRow(),
            ],
          ),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
          decoration: const BoxDecoration(
            color: AppColors.background,
            border: Border(
              top: BorderSide(color: AppColors.divider, width: 1),
            ),
          ),
          child: AuthButton(
            title: buttonTitle,
            onTap: _onContinue,
            height: 56,
            borderRadius: 14,
            prefix: currentStep == 2
                ? null
                : const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.white,
                    size: 22,
                  ),
          ),
        ),
      ],
    );
  }
}

class _WalletIcon extends StatelessWidget {
  final bool isDeposit;

  const _WalletIcon({required this.isDeposit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 76,
        height: 76,
        decoration: BoxDecoration(
          color: AppColors.primaryGradientStart.withOpacity(0.18),
          borderRadius: BorderRadius.circular(26),
          border: Border.all(
            color: AppColors.primaryGradientEnd.withOpacity(0.35),
            width: 1,
          ),
        ),
        child: Icon(
          isDeposit
              ? Icons.account_balance_wallet_rounded
              : Icons.payments_rounded,
          color: AppColors.white,
          size: 36,
        ),
      ),
    );
  }
}

class _PaymentInfoRow extends StatelessWidget {
  const _PaymentInfoRow();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _InfoItem(
          icon: Icons.verified_user_outlined,
          text: 'Secure',
          color: Colors.greenAccent,
        ),
        SizedBox(width: 28),
        _InfoItem(
          icon: Icons.flash_on_rounded,
          text: 'Instant',
          color: Colors.amber,
        ),
        SizedBox(width: 28),
        _InfoItem(
          icon: Icons.trending_up_rounded,
          text: 'No fees',
          color: Colors.greenAccent,
        ),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  const _InfoItem({
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color, size: 15),
        const SizedBox(width: 7),
        Text(
          text,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}