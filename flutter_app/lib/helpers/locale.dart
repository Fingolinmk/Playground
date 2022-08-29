import 'dart:ui' as ui;

String locale = ui.window.locale.languageCode;

enum SupportedLanguages { de, en }

SupportedLanguages fromString(String locale) {
  switch (locale) {
    case 'de':
      return SupportedLanguages.de;
    case 'en':
      return SupportedLanguages.en;

    default:
      return SupportedLanguages.en;
  }
}

SupportedLanguages localeClass = fromString(locale);

class Strings {
  static String connecting() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Verbinde...";
      case SupportedLanguages.en:
        return "Connecting...";
    }
  }

  static String empty() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Oh, hier ist nichts";
      case SupportedLanguages.en:
        return "Oh, so empty";
    }
  }

  static String createCommand() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Hier sind noch keine Kommandos, nutzen den Button um neue Kommandos anzulegen und dir dein Dashboard zu bauen!";
      case SupportedLanguages.en:
        return "No commands here, hit the plus button to create commands for your dashboard!";
    }
  }

  static String pleaseEnterText() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Bitte Text eingeben";
      case SupportedLanguages.en:
        return "Please enter some text";
    }
  }

  static String address() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Adresse";
      case SupportedLanguages.en:
        return "Address";
    }
  }

  static String deviceName() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Gerätename";
      case SupportedLanguages.en:
        return "Device name";
    }
  }

  static String port() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Port";
      case SupportedLanguages.en:
        return "Port";
    }
  }

  static payload() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Payload";
      case SupportedLanguages.en:
        return "Payload";
    }
  }

  static String save() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Speichern";
      case SupportedLanguages.en:
        return "Save";
    }
  }

  static topic() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Topic";
      case SupportedLanguages.en:
        return "Topic";
    }
  }

  static String addCardType() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Typ der Karte";
      case SupportedLanguages.en:
        return "Type of card to add";
    }
  }

  static String enterAName() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Bitte gib einen Namen ein.";
      case SupportedLanguages.en:
        return "Please enter a name.";
    }
  }

  static String howToSendRGBVal() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Wie soll der rgb wert übertragen werden?";
      case SupportedLanguages.en:
        return "How should the rgb value be transferred?";
    }
  }

  static String Message() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return "Wie ist der Payload String?";
      case SupportedLanguages.en:
        return "What is the Payload String?";
    }
  }

  static payloadOff() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return 'Nachricht "off"';
      case SupportedLanguages.en:
        return 'Payload "off"';
    }
  }

  static payloadOn() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return 'Nachricht "on"';
      case SupportedLanguages.en:
        return 'Payload "on"';
    }
  }

  static String howToSendVal() {
    switch (localeClass) {
      case SupportedLanguages.de:
        return 'Wie soll die Nachricht übermittelt werden?';
      case SupportedLanguages.en:
        return 'How should the message be transmitted?';
    }
  }
}
