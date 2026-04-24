import 'dart:ui';
import 'package:flutter/material.dart';
import '../../components/auth_background.dart';
import '../../components/auth_button.dart';
import '../../components/auth_input_field.dart';
import '../../components/auth_social_button.dart';
import '../../components/auth_tab_toggle.dart';
import '../../components/otp_input_row.dart';
import '../../components/section_divider.dart';
import '../../config/colors/app_colors.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  int selectedTab = 0;
  int signupLoginMode = 1; // 0 = Mail, 1 = Phone

  bool agreeTermsLogin = true;
  bool agreeTermsSignup = true;

  final TextEditingController loginController = TextEditingController();

  final TextEditingController signupFullNameController = TextEditingController();
  final TextEditingController signupEmailController = TextEditingController();
  final TextEditingController signupPhoneController = TextEditingController();
  final TextEditingController signupDobController = TextEditingController();

  @override
  void dispose() {
    loginController.dispose();
    signupFullNameController.dispose();
    signupEmailController.dispose();
    signupPhoneController.dispose();
    signupDobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      child: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Column(
                children: [
                  const SizedBox(height: 46),
                  _buildTopBrand(),
                  const SizedBox(height: 22),
                  _buildAuthCard(),
                  const SizedBox(height: 18),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    child: Text(
                      "By continuing, you agree to our terms and confirm you're 18+ years old. Please gamble responsibly.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopBrand() {
    return Column(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFF7A18),
                Color(0xFFD926FF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryGradientEnd.withOpacity(0.22),
                blurRadius: 22,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.casino_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          "Welcome to MyCasino",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "Your ultimate destination for online casino gaming",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildAuthCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 16),
          decoration: BoxDecoration(
            color: const Color(0x0DB026FF),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.white.withOpacity(0.06),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.28),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            children: [
              AuthTabToggle(
                selectedIndex: selectedTab,
                leftTitle: 'Login',
                rightTitle: 'Sign Up',
                onChanged: (index) {
                  if (selectedTab == index) return;
                  setState(() {
                    selectedTab = index;
                  });
                },
              ),
              const SizedBox(height: 18),
              AnimatedSize(
                duration: const Duration(milliseconds: 280),
                curve: Curves.easeInOutCubic,
                alignment: Alignment.topCenter,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 280),
                  reverseDuration: const Duration(milliseconds: 220),
                  switchInCurve: Curves.easeOutCubic,
                  switchOutCurve: Curves.easeInCubic,
                  layoutBuilder: (currentChild, previousChildren) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        ...previousChildren,
                        if (currentChild != null) currentChild,
                      ],
                    );
                  },
                  transitionBuilder: (child, animation) {
                    final bool isLogin =
                        (child.key as ValueKey<String>).value == 'login';

                    final offsetAnimation = Tween<Offset>(
                      begin: Offset(isLogin ? -0.06 : 0.06, 0),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOutCubic,
                      ),
                    );

                    final fadeAnimation = CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeOut,
                    );

                    return FadeTransition(
                      opacity: fadeAnimation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: selectedTab == 0
                      ? _buildLoginSection(key: const ValueKey('login'))
                      : _buildSignupSection(key: const ValueKey('signup')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSection({Key? key}) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthInputField(
          label: 'Email/phone no.',
          hintText: 'Enter your Email or phone no.',
          controller: loginController,
        ),
        const SizedBox(height: 14),
        const Text(
          'OTP',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 8),
        OtpInputRow(onResendTap: () {}),
        const SizedBox(height: 14),
        _buildTermsRow(
          value: agreeTermsLogin,
          onChanged: (value) {
            setState(() {
              agreeTermsLogin = value;
            });
          },
        ),
        const SizedBox(height: 14),
        AuthButton(title: 'Login', onTap: () {}),
        const SizedBox(height: 16),
        const SectionDivider(text: 'Or continue with'),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: AuthSocialButton(
                title: 'Google',
                iconText: 'G',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AuthSocialButton(
                title: 'Apple',
                iconText: '',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSignupSection({Key? key}) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AuthInputField(
          label: 'Full Name',
          hintText: 'Enter your full name',
          controller: signupFullNameController,
          prefixIcon: _buildFieldIcon(Icons.person_outline_rounded),
        ),
        const SizedBox(height: 14),
        AuthInputField(
          label: 'Email',
          hintText: 'Enter your email',
          controller: signupEmailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: _buildFieldIcon(Icons.mail_outline_rounded),
        ),
        const SizedBox(height: 14),
        AuthInputField(
          label: 'Phone no.',
          hintText: 'Enter your phone number',
          controller: signupPhoneController,
          keyboardType: TextInputType.phone,
          prefixIcon: _buildFieldIcon(Icons.call_outlined),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 12),
            child: _buildVerifyButton(),
          ),
          suffixIconConstraints: const BoxConstraints(
            minWidth: 86,
            maxWidth: 86,
            minHeight: 44,
          ),
          contentPadding: const EdgeInsets.only(
            left: 16,
            right: 88,
            top: 18,
            bottom: 18,
          ),
        ),
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AuthInputField(
                label: 'Date of Birth',
                hintText: 'DD / MM / YYYY',
                controller: signupDobController,
                readOnly: true,
                onTap: _pickDateOfBirth,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildLoginModeField(),
            ),
          ],
        ),
        const SizedBox(height: 14),
        _buildTermsRow(
          value: agreeTermsSignup,
          onChanged: (value) {
            setState(() {
              agreeTermsSignup = value;
            });
          },
        ),
        const SizedBox(height: 16),
        AuthButton(title: 'Create Account', onTap: () {}),
        const SizedBox(height: 16),
        const SectionDivider(text: 'Or sign up with'),
        const SizedBox(height: 14),
        Row(
          children: [
            Expanded(
              child: AuthSocialButton(
                title: 'Google',
                iconText: 'G',
                onTap: () {},
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AuthSocialButton(
                title: 'Apple',
                iconText: '',
                onTap: () {},
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFieldIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, right: 8),
      child: Icon(
        icon,
        color: AppColors.textSecondary,
        size: 20,
      ),
    );
  }

  Widget _buildVerifyButton() {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(11),
        onTap: () {},
        child: Ink(
          height: 30,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF7F00FF),
                Color(0xFFD226FF),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD226FF).withOpacity(0.18),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Center(
            child: Text(
              'VERIFY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.8,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginModeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Login mode',
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 58,
          padding: const EdgeInsets.all(4),
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
              Expanded(
                child: _buildModeButton(
                  title: 'Mail',
                  selected: signupLoginMode == 0,
                  onTap: () {
                    setState(() {
                      signupLoginMode = 0;
                    });
                  },
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: _buildModeButton(
                  title: 'Phone',
                  selected: signupLoginMode == 1,
                  onTap: () {
                    setState(() {
                      signupLoginMode = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildModeButton({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: selected ? AppColors.primaryGradient : null,
        color: selected ? null : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: AppColors.primaryGradientEnd.withOpacity(0.20),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: selected ? AppColors.white : AppColors.textSecondary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTermsRow({
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value ? const Color(0xFF161122) : Colors.transparent,
              border: Border.all(
                color:
                    value ? const Color(0xFF5E5A6B) : AppColors.inputBorder,
                width: 1.2,
              ),
            ),
            child: value
                ? const Icon(
                    Icons.check,
                    size: 14,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 1),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 13.5,
                  height: 1.45,
                ),
                children: [
                  TextSpan(text: 'I agree to the '),
                  TextSpan(
                    text: 'Terms of Service',
                    style: TextStyle(
                      color: Color(0xFFD226FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(text: ' and '),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: TextStyle(
                      color: Color(0xFFD226FF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final initialDate = DateTime(2001, 5, 31);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(now.year - 18, now.month, now.day),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFFD226FF),
              onPrimary: Colors.white,
              surface: Color(0xFF120B1F),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color(0xFF120B1F),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final day = picked.day.toString().padLeft(2, '0');
      final month = picked.month.toString().padLeft(2, '0');
      final year = picked.year.toString();
      signupDobController.text = '$day / $month / $year';
      setState(() {});
    }
  }
}