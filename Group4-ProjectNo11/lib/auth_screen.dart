import 'package:flutter/material.dart';

import 'theme.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key, required this.onAuthenticated});

  final ValueChanged<bool> onAuthenticated;

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _licenseController = TextEditingController();
  final _carNumberController = TextEditingController();
  final _carBrandController = TextEditingController();

  bool _isSignUp = false;
  bool _isDriver = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _licenseController.dispose();
    _carNumberController.dispose();
    _carBrandController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onAuthenticated(_isDriver);
    }
  }

  void _useDemoAccount(bool asDriver) {
    setState(() {
      _isSignUp = false;
      _isDriver = asDriver;
      _emailController.text = asDriver ? 'driver@rideflow.com' : 'user@rideflow.com';
      _passwordController.text = '123456';
      if (asDriver) {
        _licenseController.text = 'MH1420230012345';
        _carNumberController.text = 'MH 43 BK 7821';
        _carBrandController.text = 'Maruti Suzuki Dzire';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 430),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBrand(),
                    const SizedBox(height: 28),
                    Text(
                      _isDriver ? 'Drive smarter' : 'RideFlow',
                      style: const TextStyle(color: ink, fontSize: 32, height: 1.1, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _isDriver ? 'Manage trips across Mumbai and Navi Mumbai.' : 'Book reliable rides across Mumbai and Navi Mumbai.',
                      style: const TextStyle(color: muted, fontSize: 15, height: 1.4),
                    ),
                    const SizedBox(height: 28),
                    _buildModeSelector(),
                    const SizedBox(height: 24),
                    const Text('Choose your experience', style: TextStyle(color: ink, fontSize: 13, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    _buildRoleSelector(),
                    const SizedBox(height: 20),
                    Text(
                      _isSignUp ? (_isDriver ? 'Driver registration' : 'Create your account') : 'Welcome back',
                      style: const TextStyle(color: ink, fontSize: 20, fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _isSignUp ? 'Enter your details to get started.' : 'Sign in to continue to RideFlow.',
                      style: const TextStyle(color: muted, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    if (_isSignUp) ..._buildSignupFields(),
                    _buildFieldLabel('Email address'),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value == null || !value.contains('@') ? 'Enter a valid email address' : null,
                      decoration: _inputDecoration(Icons.mail_outline, 'you@example.com'),
                    ),
                    const SizedBox(height: 16),
                    _buildFieldLabel('Password'),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      validator: (value) => value == null || value.length < 6 ? 'Use at least 6 characters' : null,
                      decoration: _inputDecoration(Icons.lock_outline, 'Your password').copyWith(
                        suffixIcon: IconButton(
                          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                          icon: Icon(_obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                        ),
                      ),
                    ),
                    if (!_isSignUp)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password reset links will be available when a backend is connected.'))),
                          child: const Text('Forgot password?'),
                        ),
                      ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _useDemoAccount(false),
                            icon: const Icon(Icons.person_outline),
                            label: const Text('User demo'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => _useDemoAccount(true),
                            icon: const Icon(Icons.directions_car_outlined),
                            label: const Text('Driver demo'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: FilledButton(
                        onPressed: _submit,
                        child: Text(_isSignUp ? 'Create account' : 'Sign in', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(child: TextButton(onPressed: () => widget.onAuthenticated(_isDriver), child: const Text('Continue with demo account'))),
                    const SizedBox(height: 12),
                    Center(child: Text('By continuing, you agree to RideFlow terms and privacy policy.', textAlign: TextAlign.center, style: TextStyle(color: muted.withValues(alpha: .8), fontSize: 11))),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrand() {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(color: blue, borderRadius: BorderRadius.circular(18)),
      child: const Icon(Icons.near_me, color: Colors.white, size: 30),
    );
  }

  List<Widget> _buildSignupFields() {
    return [
      _buildFieldLabel('Full name'),
      TextFormField(controller: _nameController, textCapitalization: TextCapitalization.words, validator: (value) => value == null || value.trim().isEmpty ? 'Enter your name' : null, decoration: _inputDecoration(Icons.person_outline, 'Alex Morgan')),
      const SizedBox(height: 16),
      if (_isDriver) ...[
        _buildFieldLabel('Driving license number'),
        TextFormField(controller: _licenseController, textCapitalization: TextCapitalization.characters, validator: (value) => value == null || value.trim().length < 6 ? 'Enter a valid license number' : null, decoration: _inputDecoration(Icons.badge_outlined, 'MH1420230012345')),
        const SizedBox(height: 16),
        _buildFieldLabel('Car registration number'),
        TextFormField(controller: _carNumberController, textCapitalization: TextCapitalization.characters, validator: (value) => value == null || value.trim().length < 6 ? 'Enter a valid car number' : null, decoration: _inputDecoration(Icons.confirmation_number_outlined, 'MH 43 BK 7821')),
        const SizedBox(height: 16),
        _buildFieldLabel('Car brand and model'),
        TextFormField(controller: _carBrandController, textCapitalization: TextCapitalization.words, validator: (value) => value == null || value.trim().isEmpty ? 'Enter your car brand and model' : null, decoration: _inputDecoration(Icons.directions_car_outlined, 'Maruti Suzuki Dzire')),
        const SizedBox(height: 16),
      ],
    ];
  }

  Widget _buildModeSelector() {
    return _segmentedControl([_selectorButton('Sign in', !_isSignUp, () => setState(() => _isSignUp = false)), _selectorButton('Create account', _isSignUp, () => setState(() => _isSignUp = true))]);
  }

  Widget _buildRoleSelector() {
    return _segmentedControl([_selectorButton('User', !_isDriver, () => setState(() => _isDriver = false), Icons.person_outline), _selectorButton('Driver', _isDriver, () => setState(() => _isDriver = true), Icons.directions_car_outlined)]);
  }

  Widget _segmentedControl(List<Widget> children) {
    return Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: const Color(0xFFE9ECF2), borderRadius: BorderRadius.circular(14)), child: Row(children: children));
  }

  Widget _selectorButton(String label, bool selected, VoidCallback onTap, [IconData? icon]) {
    return Expanded(child: GestureDetector(onTap: onTap, child: AnimatedContainer(duration: const Duration(milliseconds: 180), padding: const EdgeInsets.symmetric(vertical: 11), decoration: BoxDecoration(color: selected ? Colors.white : Colors.transparent, borderRadius: BorderRadius.circular(11), boxShadow: selected ? const [BoxShadow(color: Color(0x10000000), blurRadius: 7)] : null), child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [if (icon != null) ...[Icon(icon, size: 17, color: selected ? blue : muted), const SizedBox(width: 6)], Text(label, textAlign: TextAlign.center, style: TextStyle(color: selected ? ink : muted, fontWeight: FontWeight.w700, fontSize: 13))]))));
  }

  Widget _buildFieldLabel(String label) => Padding(padding: const EdgeInsets.only(bottom: 8), child: Text(label, style: const TextStyle(color: ink, fontSize: 13, fontWeight: FontWeight.w700)));

  InputDecoration _inputDecoration(IconData icon, String hint) => InputDecoration(prefixIcon: Icon(icon, color: muted), hintText: hint, filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFE1E5EC))), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: Color(0xFFE1E5EC))), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: const BorderSide(color: blue, width: 1.5)));
}
