import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../services/language_service.dart';   // ✅ Added

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = '';

  final List<Map<String, dynamic>> languages = [
    {
      'name': 'हिन्दी (Hindi)',
      'code': 'hi',
      'native': 'Hindi',
      'icon': Icons.translate,
    },
    {
      'name': 'English',
      'code': 'en',
      'native': 'English',
      'icon': Icons.language,
    },
    {
      'name': 'తెలుగు (Telugu)',
      'code': 'te',
      'native': 'Telugu',
      'icon': Icons.translate,
    },
    {
      'name': 'ಕನ್ನಡ (Kannada)',
      'code': 'kn',
      'native': 'Kannada',
      'icon': Icons.translate,
    },
    {
      'name': 'தமிழ் (Tamil)',
      'code': 'ta',
      'native': 'Tamil',
      'icon': Icons.translate,
    },
    {
      'name': 'मराठी (Marathi)',
      'code': 'mr',
      'native': 'Marathi',
      'icon': Icons.translate,
    },
    {
      'name': 'ગુજરાતી (Gujarati)',
      'code': 'gu',
      'native': 'Gujarati',
      'icon': Icons.translate,
    },
    {
      'name': 'ଓଡ଼ିଆ (Odia)',
      'code': 'or',
      'native': 'Odia',
      'icon': Icons.translate,
    },
    {
      'name': 'ਪੰਜਾਬੀ (Punjabi)',
      'code': 'pa',
      'native': 'Punjabi',
      'icon': Icons.translate,
    },
    {
      'name': 'বাংলা (Bengali)',
      'code': 'bn',
      'native': 'Bengali',
      'icon': Icons.translate,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language / भाषा चुनें'),
        backgroundColor: FarmColors.leafGreen,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              FarmColors.lightGreen,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  final isSelected = _selectedLanguage == language['code'];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: isSelected ? 4 : 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: isSelected
                          ? BorderSide(color: FarmColors.leafGreen, width: 2)
                          : BorderSide.none,
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isSelected
                            ? FarmColors.leafGreen
                            : FarmColors.lightGreen,
                        child: Icon(
                          language['icon'],
                          color: isSelected ? Colors.white : FarmColors.darkGreen,
                        ),
                      ),
                      title: Text(
                        language['name'],
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? FarmColors.darkGreen : Colors.black87,
                        ),
                      ),
                      subtitle: Text(language['native']),
                      trailing: isSelected
                          ? Icon(Icons.check_circle, color: FarmColors.leafGreen)
                          : null,
                      onTap: () async {      // ✅ Added async
                        setState(() {
                          _selectedLanguage = language['code'];
                        });

                        /// ✅ Load selected language JSON
                        await LanguageService.loadLanguage(language['code']);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${language['name']} selected'),
                            backgroundColor: FarmColors.leafGreen,
                            duration: const Duration(seconds: 1),
                          ),
                        );

                        Future.delayed(const Duration(milliseconds: 800), () {
                          Navigator.pushReplacementNamed(context, '/home');
                        });
                      },
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _selectedLanguage.isNotEmpty
                      ? () async {

                          /// ✅ Load selected language
                          await LanguageService.loadLanguage(_selectedLanguage);

                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FarmColors.leafGreen,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Continue / जारी रखें',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}