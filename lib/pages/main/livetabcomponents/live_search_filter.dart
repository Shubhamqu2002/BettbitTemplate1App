import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';
import 'live_filter_modal.dart';

class LiveSearchFilter extends StatefulWidget {
  const LiveSearchFilter({super.key});

  @override
  State<LiveSearchFilter> createState() => _LiveSearchFilterState();
}

class _LiveSearchFilterState extends State<LiveSearchFilter> {
  static const Color _purpleIcon = Color(0xFFBD44FF);

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppColors.searchModalBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.cardBorder,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_rounded,
                    color: AppColors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                      ),
                      cursorColor: AppColors.white,
                      decoration: const InputDecoration(
                        hintText: 'Search live games...',
                        hintStyle: TextStyle(
                          color: AppColors.bottomTabInactive,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () {
              LiveFilterModal.show(context);
            },
            child: Container(
              width: 48,
              height: 42,
              decoration: BoxDecoration(
                color: AppColors.searchModalBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.cardBorder,
                  width: 1,
                ),
              ),
              child: const Icon(
                Icons.tune_rounded,
                color: _purpleIcon,
                size: 21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}