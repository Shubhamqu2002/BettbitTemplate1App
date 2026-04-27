import 'package:flutter/material.dart';
import '../../../config/colors/app_colors.dart';

class TransactionHistoryCard extends StatefulWidget {
  const TransactionHistoryCard({super.key});

  @override
  State<TransactionHistoryCard> createState() => _TransactionHistoryCardState();
}

class _TransactionHistoryCardState extends State<TransactionHistoryCard> {
  int expandedIndex = -1;
  int currentPage = 1;

  final List<_TransactionData> transactions = const [
    _TransactionData(
      id: 'TXN001',
      date: '2024-10-08',
      type: 'Deposit',
      amount: '\$1,000',
      status: 'Completed',
    ),
    _TransactionData(
      id: 'TXN002',
      date: '2024-10-08',
      type: 'Withdrawal',
      amount: '\$500',
      status: 'Completed',
    ),
    _TransactionData(
      id: 'TXN003',
      date: '2024-10-08',
      type: 'Deposit',
      amount: '\$750',
      status: 'Completed',
    ),
    _TransactionData(
      id: 'TXN004',
      date: '2024-10-08',
      type: 'Deposit',
      amount: '\$1,250',
      status: 'Pending',
    ),
    _TransactionData(
      id: 'TXN005',
      date: '2024-10-08',
      type: 'Withdrawal',
      amount: '\$300',
      status: 'Completed',
    ),
    _TransactionData(
      id: 'TXN006',
      date: '2024-10-08',
      type: 'Deposit',
      amount: '\$2,000',
      status: 'Completed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
      decoration: BoxDecoration(
        color: AppColors.walletCardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.walletCardBorder,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Transaction History',
                  style: TextStyle(
                    color: AppColors.yellowButton,
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              _ExportButton(onTap: () {}),
            ],
          ),
          const SizedBox(height: 20),

          const _TableHeader(),
          const SizedBox(height: 10),

          ListView.separated(
            itemCount: transactions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.transactionDivider,
            ),
            itemBuilder: (context, index) {
              final item = transactions[index];
              final isExpanded = expandedIndex == index;

              return _TransactionRow(
                data: item,
                isExpanded: isExpanded,
                onTap: () {
                  setState(() {
                    expandedIndex = isExpanded ? -1 : index;
                  });
                },
              );
            },
          ),

          const SizedBox(height: 18),
          _Pagination(
            currentPage: currentPage,
            onPrevious: () {
              if (currentPage > 1) {
                setState(() => currentPage--);
              }
            },
            onNext: () {
              if (currentPage < 3) {
                setState(() => currentPage++);
              }
            },
            onPageTap: (page) {
              setState(() => currentPage = page);
            },
          ),
        ],
      ),
    );
  }
}

class _ExportButton extends StatelessWidget {
  final VoidCallback onTap;

  const _ExportButton({
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.exportButtonBg,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.exportButtonBorder,
              width: 1,
            ),
          ),
          child: const Row(
            children: [
              Text(
                'Export',
                style: TextStyle(
                  color: AppColors.primaryGradientEnd,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 6),
              Icon(
                Icons.file_download_outlined,
                color: AppColors.primaryGradientEnd,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TableHeader extends StatelessWidget {
  const _TableHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          flex: 4,
          child: Text(
            'Transaction ID',
            style: TextStyle(
              color: AppColors.bottomTabInactive,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Text(
            'Date',
            style: TextStyle(
              color: AppColors.bottomTabInactive,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            'Type',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.bottomTabInactive,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _TransactionRow extends StatelessWidget {
  final _TransactionData data;
  final bool isExpanded;
  final VoidCallback onTap;

  const _TransactionRow({
    required this.data,
    required this.isExpanded,
    required this.onTap,
  });

  bool get isDeposit => data.type == 'Deposit';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    data.id,
                    style: const TextStyle(
                      color: AppColors.bottomTabInactive,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Text(
                    data.date,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: _TypeBadge(
                      type: data.type,
                      isDeposit: isDeposit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        AnimatedCrossFade(
          firstChild: const SizedBox.shrink(),
          secondChild: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppColors.walletCardBorder,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  _ExpandedInfoRow(
                    label: 'Amount',
                    value: data.amount,
                    valueColor:
                        isDeposit ? AppColors.withdrawButtonBackground : AppColors.yellowButton,
                  ),
                  const SizedBox(height: 10),
                  _ExpandedInfoRow(
                    label: 'Status',
                    value: data.status,
                    valueColor: data.status == 'Completed'
                        ? AppColors.withdrawButtonBackground
                        : AppColors.yellowButton,
                  ),
                ],
              ),
            ),
          ),
          crossFadeState:
              isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: 220),
        ),
      ],
    );
  }
}

class _TypeBadge extends StatelessWidget {
  final String type;
  final bool isDeposit;

  const _TypeBadge({
    required this.type,
    required this.isDeposit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 11),
      decoration: BoxDecoration(
        color: isDeposit ? AppColors.depositBadgeBg : AppColors.withdrawalBadgeBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDeposit
              ? AppColors.depositBadgeBorder
              : AppColors.withdrawalBadgeBorder,
          width: 1,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        type,
        style: TextStyle(
          color: isDeposit
              ? AppColors.withdrawButtonBackground
              : AppColors.yellowButton,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ExpandedInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;

  const _ExpandedInfoRow({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: AppColors.bottomTabInactive,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            color: valueColor,
            fontSize: 14,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _Pagination extends StatelessWidget {
  final int currentPage;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ValueChanged<int> onPageTap;

  const _Pagination({
    required this.currentPage,
    required this.onPrevious,
    required this.onNext,
    required this.onPageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _PaginationButton(
          icon: Icons.keyboard_arrow_left,
          onTap: onPrevious,
          isActive: false,
        ),
        const SizedBox(width: 8),
        _PageNumber(
          page: 1,
          isSelected: currentPage == 1,
          onTap: () => onPageTap(1),
        ),
        const SizedBox(width: 8),
        _PageNumber(
          page: 2,
          isSelected: currentPage == 2,
          onTap: () => onPageTap(2),
        ),
        const SizedBox(width: 8),
        _PageNumber(
          page: 3,
          isSelected: currentPage == 3,
          onTap: () => onPageTap(3),
        ),
        const SizedBox(width: 8),
        _PaginationButton(
          icon: Icons.keyboard_arrow_right,
          onTap: onNext,
          isActive: false,
        ),
      ],
    );
  }
}

class _PaginationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  const _PaginationButton({
    required this.icon,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.paginationBg,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 34,
          height: 34,
          child: Icon(
            icon,
            color: AppColors.bottomTabInactive,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class _PageNumber extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onTap;

  const _PageNumber({
    required this.page,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.paginationActiveBg : AppColors.paginationBg,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 34,
          height: 34,
          child: Center(
            child: Text(
              '$page',
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.bottomTabInactive,
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TransactionData {
  final String id;
  final String date;
  final String type;
  final String amount;
  final String status;

  const _TransactionData({
    required this.id,
    required this.date,
    required this.type,
    required this.amount,
    required this.status,
  });
}