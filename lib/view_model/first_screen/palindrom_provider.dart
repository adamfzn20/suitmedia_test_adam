import 'package:flutter/material.dart';

class PalindromeProvider with ChangeNotifier {
  String _palindromeResult = '';

  String get palindromeResult => _palindromeResult;

  void checkPalindrome(String sentence) {
    String processedSentence = sentence.toLowerCase().replaceAll(' ', '');
    String reversedSentence =
        String.fromCharCodes(processedSentence.runes.toList().reversed);

    if (processedSentence == reversedSentence) {
      _palindromeResult = 'is palindrome';
    } else {
      _palindromeResult = 'not palindrome';
    }

    notifyListeners();
  }
}
