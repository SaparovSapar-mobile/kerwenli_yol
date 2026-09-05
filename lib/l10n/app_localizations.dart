import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tk.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
    Locale('tk'),
    Locale('tr')
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @pleaseEnterTheInformationCompletelyAndCorrectly.
  ///
  /// In en, this message translates to:
  /// **'Please enter the information completely and correctly.'**
  String get pleaseEnterTheInformationCompletelyAndCorrectly;

  /// No description provided for @iHaveReadTheRules.
  ///
  /// In en, this message translates to:
  /// **'I have read the rules'**
  String get iHaveReadTheRules;

  /// No description provided for @getToKnowTheRules.
  ///
  /// In en, this message translates to:
  /// **'Get to know the rules'**
  String get getToKnowTheRules;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @thisUserAlreadyExists.
  ///
  /// In en, this message translates to:
  /// **'This user already exists'**
  String get thisUserAlreadyExists;

  /// No description provided for @aboutUs.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get aboutUs;

  /// No description provided for @forContact.
  ///
  /// In en, this message translates to:
  /// **'For contact'**
  String get forContact;

  /// No description provided for @socialMedia.
  ///
  /// In en, this message translates to:
  /// **'Social media'**
  String get socialMedia;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @allCategory.
  ///
  /// In en, this message translates to:
  /// **'All category'**
  String get allCategory;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @incoterms.
  ///
  /// In en, this message translates to:
  /// **'Incoterms'**
  String get incoterms;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get news;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @leadingCompanies.
  ///
  /// In en, this message translates to:
  /// **'Leading Companies'**
  String get leadingCompanies;

  /// No description provided for @allView.
  ///
  /// In en, this message translates to:
  /// **'All view'**
  String get allView;

  /// No description provided for @vipCompanies.
  ///
  /// In en, this message translates to:
  /// **'VIP Companies'**
  String get vipCompanies;

  /// No description provided for @newProducts.
  ///
  /// In en, this message translates to:
  /// **'New Products'**
  String get newProducts;

  /// No description provided for @export.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get export;

  /// No description provided for @shortVideos.
  ///
  /// In en, this message translates to:
  /// **'Short Videos'**
  String get shortVideos;

  /// No description provided for @localBrands.
  ///
  /// In en, this message translates to:
  /// **'Local Brands'**
  String get localBrands;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @ourPartners.
  ///
  /// In en, this message translates to:
  /// **'Our Partners'**
  String get ourPartners;

  /// No description provided for @acknowledgements.
  ///
  /// In en, this message translates to:
  /// **'Acknowledgements'**
  String get acknowledgements;

  /// No description provided for @companies.
  ///
  /// In en, this message translates to:
  /// **'Companies'**
  String get companies;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsUse;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @info.
  ///
  /// In en, this message translates to:
  /// **'Info'**
  String get info;

  /// No description provided for @media.
  ///
  /// In en, this message translates to:
  /// **'Media'**
  String get media;

  /// No description provided for @open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get open;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @features.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get features;

  /// No description provided for @socialMediaLinks.
  ///
  /// In en, this message translates to:
  /// **'Social Media Links'**
  String get socialMediaLinks;

  /// No description provided for @copyLocation.
  ///
  /// In en, this message translates to:
  /// **'Copy Location'**
  String get copyLocation;

  /// No description provided for @ourProducts.
  ///
  /// In en, this message translates to:
  /// **'Our Products'**
  String get ourProducts;

  /// No description provided for @tour.
  ///
  /// In en, this message translates to:
  /// **'360° Tour'**
  String get tour;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @ourAwards.
  ///
  /// In en, this message translates to:
  /// **'Our Awards'**
  String get ourAwards;

  /// No description provided for @contactUs.
  ///
  /// In en, this message translates to:
  /// **'Contact Us'**
  String get contactUs;

  /// No description provided for @contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get contacts;

  /// No description provided for @myPage.
  ///
  /// In en, this message translates to:
  /// **'My Page'**
  String get myPage;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully'**
  String get profileUpdated;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @internetConnectionError.
  ///
  /// In en, this message translates to:
  /// **'Internet connection error !'**
  String get internetConnectionError;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password ?'**
  String get forgotPassword;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend Code'**
  String get resendCode;

  /// No description provided for @ourLocationMap.
  ///
  /// In en, this message translates to:
  /// **'Our Location on the Map'**
  String get ourLocationMap;

  /// No description provided for @companyName.
  ///
  /// In en, this message translates to:
  /// **'Company name'**
  String get companyName;

  /// No description provided for @ourBrands.
  ///
  /// In en, this message translates to:
  /// **'Our Brands'**
  String get ourBrands;

  /// No description provided for @videos.
  ///
  /// In en, this message translates to:
  /// **'Videos'**
  String get videos;

  /// No description provided for @noDataAvailable.
  ///
  /// In en, this message translates to:
  /// **'No data available !'**
  String get noDataAvailable;

  /// No description provided for @ot1.
  ///
  /// In en, this message translates to:
  /// **'Find reliable companies'**
  String get ot1;

  /// No description provided for @ot2.
  ///
  /// In en, this message translates to:
  /// **'Expand your business connections'**
  String get ot2;

  /// No description provided for @ot3.
  ///
  /// In en, this message translates to:
  /// **'Everything on one platform'**
  String get ot3;

  /// No description provided for @od1.
  ///
  /// In en, this message translates to:
  /// **'Get the opportunity to work with leading companies all in one place.'**
  String get od1;

  /// No description provided for @od2.
  ///
  /// In en, this message translates to:
  /// **'Find partnership opportunities in an easy and efficient way.'**
  String get od2;

  /// No description provided for @od3.
  ///
  /// In en, this message translates to:
  /// **'Easily find services, products, and categories.'**
  String get od3;

  /// No description provided for @browse.
  ///
  /// In en, this message translates to:
  /// **'Browse'**
  String get browse;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @confirmYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm your password'**
  String get confirmYourPassword;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @enterCodeSentYourPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to your phone number'**
  String get enterCodeSentYourPhoneNumber;

  /// No description provided for @enterCodeSentYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent to your email'**
  String get enterCodeSentYourEmail;

  /// No description provided for @companyInformation.
  ///
  /// In en, this message translates to:
  /// **'Company Information'**
  String get companyInformation;

  /// No description provided for @dateEstablishment.
  ///
  /// In en, this message translates to:
  /// **'Date of establishment'**
  String get dateEstablishment;

  /// No description provided for @registrationAuthority.
  ///
  /// In en, this message translates to:
  /// **'Registration authority'**
  String get registrationAuthority;

  /// No description provided for @registrationNumber.
  ///
  /// In en, this message translates to:
  /// **'Registration number'**
  String get registrationNumber;

  /// No description provided for @legalForm.
  ///
  /// In en, this message translates to:
  /// **'Legal form'**
  String get legalForm;

  /// No description provided for @businessActivity.
  ///
  /// In en, this message translates to:
  /// **'Business activity'**
  String get businessActivity;

  /// No description provided for @ownershipType.
  ///
  /// In en, this message translates to:
  /// **'Ownership type'**
  String get ownershipType;

  /// No description provided for @mainProducts.
  ///
  /// In en, this message translates to:
  /// **'Main products'**
  String get mainProducts;

  /// No description provided for @legalAddress.
  ///
  /// In en, this message translates to:
  /// **'Legal address'**
  String get legalAddress;

  /// No description provided for @additionalInformation.
  ///
  /// In en, this message translates to:
  /// **'Additional information'**
  String get additionalInformation;

  /// No description provided for @workingHours.
  ///
  /// In en, this message translates to:
  /// **'Working hours'**
  String get workingHours;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @photoReport.
  ///
  /// In en, this message translates to:
  /// **'Photo report'**
  String get photoReport;

  /// No description provided for @fCAPrice.
  ///
  /// In en, this message translates to:
  /// **'FCA price'**
  String get fCAPrice;

  /// No description provided for @minimumOrderQuantity.
  ///
  /// In en, this message translates to:
  /// **'Minimum order quantity'**
  String get minimumOrderQuantity;

  /// No description provided for @monthlyProductionCapacity.
  ///
  /// In en, this message translates to:
  /// **'Monthly production capacity'**
  String get monthlyProductionCapacity;

  /// No description provided for @deliveryTerms.
  ///
  /// In en, this message translates to:
  /// **'Delivery terms'**
  String get deliveryTerms;

  /// No description provided for @paymentCurrency.
  ///
  /// In en, this message translates to:
  /// **'Payment currency'**
  String get paymentCurrency;

  /// No description provided for @paymentTerms.
  ///
  /// In en, this message translates to:
  /// **'Payment terms'**
  String get paymentTerms;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @packaging.
  ///
  /// In en, this message translates to:
  /// **'Packaging'**
  String get packaging;

  /// No description provided for @shelfLife.
  ///
  /// In en, this message translates to:
  /// **'Shelf life'**
  String get shelfLife;

  /// No description provided for @volume.
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// No description provided for @sendRequest.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get sendRequest;

  /// No description provided for @addFile.
  ///
  /// In en, this message translates to:
  /// **'Add file'**
  String get addFile;

  /// No description provided for @selectImage.
  ///
  /// In en, this message translates to:
  /// **'Select Image'**
  String get selectImage;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @likes.
  ///
  /// In en, this message translates to:
  /// **'Likes'**
  String get likes;

  /// No description provided for @deleteAllBookmarks.
  ///
  /// In en, this message translates to:
  /// **'Delete all bookmarks'**
  String get deleteAllBookmarks;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @darkTheme.
  ///
  /// In en, this message translates to:
  /// **'Dark Theme'**
  String get darkTheme;

  /// No description provided for @lightTheme.
  ///
  /// In en, this message translates to:
  /// **'Light Theme'**
  String get lightTheme;

  /// No description provided for @systemTheme.
  ///
  /// In en, this message translates to:
  /// **'System Theme'**
  String get systemTheme;

  /// No description provided for @soundNotifications.
  ///
  /// In en, this message translates to:
  /// **'Sound notifications'**
  String get soundNotifications;

  /// No description provided for @pINCode.
  ///
  /// In en, this message translates to:
  /// **'PIN code'**
  String get pINCode;

  /// No description provided for @enterYourPINCodeCorrectly.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN code correctly'**
  String get enterYourPINCodeCorrectly;

  /// No description provided for @enterYourPINCode.
  ///
  /// In en, this message translates to:
  /// **'Enter your PIN code'**
  String get enterYourPINCode;

  /// No description provided for @aboutTheCompany.
  ///
  /// In en, this message translates to:
  /// **'About the company'**
  String get aboutTheCompany;

  /// No description provided for @company.
  ///
  /// In en, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @writeMessage.
  ///
  /// In en, this message translates to:
  /// **'Write a message'**
  String get writeMessage;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete account'**
  String get deleteAccount;

  /// No description provided for @views.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get views;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get sms;

  /// No description provided for @areYouSureYouWantDeleteYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account ?'**
  String get areYouSureYouWantDeleteYourAccount;

  /// No description provided for @areYouSureYouWantLogOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out ?'**
  String get areYouSureYouWantLogOut;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @allYourDataWillAlsoDeleted.
  ///
  /// In en, this message translates to:
  /// **'All your data will also be deleted'**
  String get allYourDataWillAlsoDeleted;

  /// No description provided for @submitComplaint.
  ///
  /// In en, this message translates to:
  /// **'Submit a complaint'**
  String get submitComplaint;

  /// No description provided for @searchHistory.
  ///
  /// In en, this message translates to:
  /// **'Search history'**
  String get searchHistory;

  /// No description provided for @rateCompany.
  ///
  /// In en, this message translates to:
  /// **'Rate the company'**
  String get rateCompany;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ru', 'tk', 'tr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'ru': return AppLocalizationsRu();
    case 'tk': return AppLocalizationsTk();
    case 'tr': return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
