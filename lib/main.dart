import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:minga_demo/theme.dart';
import 'package:minga_demo/home/home_screen.dart';
import 'home/home_screen.dart';
import 'home/navigation_cubit.dart';
import 'l10n/messages_all.dart';

class MingaLocalizations {
  MingaLocalizations(this.localeName);

  String get info => Intl.message("Info", name: 'info', locale: localeName);

  String get terms_and_privacy =>
      Intl.message('Please accept privacy and terms!',
          name: 'terms_and_privacy', locale: localeName);

  String get fill_in =>
      Intl.message('Please filll in', name: 'fill_in', locale: localeName);

  String get enter_password => Intl.message('Please enter your password',
      locale: localeName, name: 'enter_password');

  String get verify_code =>
      Intl.message('Verify code', locale: localeName, name: 'verify_code');

  String get enter_code =>
      Intl.message('Enter code', locale: localeName, name: 'enter_code');

  String get auth_method => Intl.message('Your account authentication method',
      name: 'auth_method', locale: localeName);

  String get complete_profile => Intl.message('Complete profile',
      name: 'complete_profile', locale: localeName);

  String get new_shift =>
      Intl.message('New shift', name: 'new_shift', locale: localeName);

  String get new_donation =>
      Intl.message('New donation', name: 'new_donation', locale: localeName);

  String get label => Intl.message('Label', name: 'label', locale: localeName);

  String get moderate_sub => Intl.message('For Minga staff only',
      name: 'moderate_sub', locale: localeName);

  String get previous_work =>
      Intl.message('Previous work', name: 'previous_work', locale: localeName);

  get served_food =>
      Intl.message('Served food', name: 'served_food', locale: localeName);

  static Future<MingaLocalizations> load(Locale locale) {
    final String name = locale.countryCode?.isEmpty ?? false
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return MingaLocalizations(localeName);
    });
  }

  static MingaLocalizations of(BuildContext context) {
    return Localizations.of<MingaLocalizations>(context, MingaLocalizations) ??
        MingaLocalizations('es');
  }

  final String localeName;

  String get title {
    return Intl.message(
      'Hello World',
      name: 'title',
      desc: 'Title for the Demo application',
      locale: localeName,
    );
  }

  String get error => Intl.message("Error", name: 'error', locale: localeName);
  String get food_climate =>
      Intl.message("Food & Climate", name: 'food_climate', locale: localeName);
  String get email => Intl.message("Email", name: 'email', locale: localeName);
  String get phone => Intl.message("Phone", name: 'phone', locale: localeName);
  String get password =>
      Intl.message("Password", name: 'password', locale: localeName);
  String get sign_in =>
      Intl.message("Sign in", name: 'sign_in', locale: localeName);
  String get new_here =>
      Intl.message("You are new here?", name: 'new_here', locale: localeName);
  String get learn_more => Intl.message("Learn  more and sign up",
      name: 'learn_more', locale: localeName);
  String get welcome =>
      Intl.message("Welcome to Minga", name: 'welcome', locale: localeName);
  String get create_account => Intl.message("Create an account to...",
      name: 'create_account', locale: localeName);
  String get help => Intl.message("Help", name: 'help', locale: localeName);
  String get benefit =>
      Intl.message("Benefit", name: 'benefit', locale: localeName);
  String get donate =>
      Intl.message("Donate", name: 'donate', locale: localeName);
  String get your_email =>
      Intl.message("Your email adress", name: 'your_email', locale: localeName);
  String get min_chars =>
      Intl.message("min. characters", name: 'min_chars', locale: localeName);
  String get non_alpha_numeric => Intl.message("Use non alpha-numeric chars",
      name: 'non_alpha_numeric', locale: localeName);
  String get terms => Intl.message("Please accept our Terms of Service",
      name: 'terms', locale: localeName);
  String get privacy => Intl.message("Please accept our Privacy policy",
      name: 'privacy', locale: localeName);
  String get register =>
      Intl.message("Register", name: 'register', locale: localeName);
  String get your_phone =>
      Intl.message("Your phone number", name: 'your_phone', locale: localeName);
  String get phone_disclaimer => Intl.message(
      "You should be able to receive text messages for this phone number, so we can send you an authentication code.",
      name: 'phone_disclaimer',
      locale: localeName);
  String get phone_note => Intl.message(
      "You will receive a verification text message on your phone.",
      name: 'phone_note',
      locale: localeName);
  String get your_name =>
      Intl.message("Your name", name: 'your_name', locale: localeName);
  String get show_email => Intl.message("Show email address",
      name: 'show_email', locale: localeName);
  String get show_emai_sub => Intl.message(
      "Other users can see your email associated with your profile.",
      name: 'show_emai_sub',
      locale: localeName);
  String get show_phone =>
      Intl.message("Show phone number", name: 'show_phone', locale: localeName);
  String get show_phone_sub => Intl.message(
      "Other users can see your phone number associated with your profile.",
      name: 'show_phone_sub',
      locale: localeName);
  String get anon_donations => Intl.message("Anonymize my donations",
      name: 'anon_donations', locale: localeName);
  String get anon_donations_sub =>
      Intl.message("When donating, the recipient can't see your profile.",
          name: 'anon_donations_sub', locale: localeName);
  String get anon_chats => Intl.message("Anonymize my chats",
      name: 'anon_chats', locale: localeName);
  String get anon_chats_sub => Intl.message(
      "Hide your identity while chatting in the general chat. This does not effect the chats associated with donations or voluntary work.",
      name: 'anon_chats_sub',
      locale: localeName);
  String get show_impact =>
      Intl.message("Show my impact", name: 'show_impact', locale: localeName);
  String get show_impact_sub => Intl.message(
      "Other users can see your total impact assoociated with your profile.",
      name: 'show',
      locale: localeName);
  String get residence => Intl.message("Your place of residence",
      name: 'residence', locale: localeName);
  String get location =>
      Intl.message("Select Location ", name: 'location', locale: localeName);
  String get save_profile =>
      Intl.message("Save profile", name: 'save_profile', locale: localeName);
  String get benefit_sub => Intl.message("Discover food offerrings nearby",
      name: 'benefit_sub', locale: localeName);
  String get help_sub => Intl.message("Povide help delivering or cooking food",
      name: 'help_sub', locale: localeName);
  String get donate_sub => Intl.message("Donate food or other goods",
      name: 'donate_sub', locale: localeName);
  String get admin => Intl.message("Admin", name: 'admin', locale: localeName);
  String get admin_sub => Intl.message("Manage distribution centers",
      name: 'admin_sub', locale: localeName);
  String get moderate => Intl.message("For Minga staff only",
      name: 'moderate', locale: localeName);
  String get logged_in =>
      Intl.message("Logged in", name: 'logged_in', locale: localeName);
  String get log_out =>
      Intl.message("Log out", name: 'log_out', locale: localeName);
  String get manage_account => Intl.message("Manage account",
      name: 'manage_account', locale: localeName);
  String get manage_account_sub => Intl.message("Edit profile, export data",
      name: 'manage_account_sub', locale: localeName);
  String get export_data => Intl.message("Export all user data",
      name: 'export_data', locale: localeName);
  String get export_data_sub => Intl.message(
      "The european GDPR requires an option to download all user-specific data",
      name: 'export_data_sub',
      locale: localeName);
  String get delete_account => Intl.message("Delete account",
      name: 'delete_account', locale: localeName);
  String get delete_account_sub =>
      Intl.message("This causes permanent data loss and can't be undone",
          name: 'delete_account_sub', locale: localeName);
  String get cancel =>
      Intl.message("Cancel", name: 'cancel', locale: localeName);
  String get update =>
      Intl.message("Update", name: 'update', locale: localeName);
  String get save => Intl.message("Save", name: 'save', locale: localeName);
  String get proceed =>
      Intl.message("Proceed", name: 'proceed', locale: localeName);
  String get done => Intl.message("Done", name: 'done', locale: localeName);
  String get account =>
      Intl.message("	Account", name: 'account', locale: localeName);
  String get impact =>
      Intl.message("Impact", name: 'impact', locale: localeName);
  String get community =>
      Intl.message("Community", name: 'community', locale: localeName);
  String get menu => Intl.message("Menu", name: 'menu', locale: localeName);
  String get b_food => Intl.message("food", name: 'b_food', locale: localeName);
  String get b_non_food =>
      Intl.message("non-food", name: 'b_non_food', locale: localeName);
  String get b_centers =>
      Intl.message("centers", name: 'b_centers', locale: localeName);
  String get deliver =>
      Intl.message("Deliver", name: 'deliver', locale: localeName);
  String get piece => Intl.message("piece", name: 'piece', locale: localeName);
  String get pieces =>
      Intl.message("pieces", name: 'pieces', locale: localeName);
  String get point => Intl.message("Point", name: 'point', locale: localeName);
  String get points =>
      Intl.message("Points", name: 'points', locale: localeName);
  String get can_be_picked_up => Intl.message("Can be picked up after...",
      name: 'can_be_picked_up', locale: localeName);
  String get picked_up =>
      Intl.message("Picked up", name: 'picked_up', locale: localeName);
  String get must_be_delivered => Intl.message("Must be delivered within...",
      name: 'must_be_delivered', locale: localeName);
  String get hour => Intl.message("hour", name: 'hour', locale: localeName);
  String get hours => Intl.message("hours", name: 'hours', locale: localeName);
  String get delivered =>
      Intl.message("Delivered", name: 'delivered', locale: localeName);
  String get of_ => Intl.message("of", name: 'of_', locale: localeName);
  String get h_my_shifts =>
      Intl.message("my_shifts", name: 'h_my_shifts', locale: localeName);
  String get h_apply =>
      Intl.message("apply", name: 'h_apply', locale: localeName);
  String get not_interested => Intl.message("Not interested",
      name: 'not_interested', locale: localeName);
  String get apply => Intl.message("Apply", name: 'apply', locale: localeName);
  String get donate_food => Intl.message("Donate food or goods",
      name: 'donate_food', locale: localeName);
  String get donate_food_sub => Intl.message("<KLEINER ERKLÄRTEXT>",
      name: 'donate_food_sub', locale: localeName);
  String get food => Intl.message("Food", name: 'food', locale: localeName);
  String get non_food =>
      Intl.message("Non-food", name: 'non_food', locale: localeName);
  String get select_image =>
      Intl.message("Select an image", name: 'select_image', locale: localeName);
  String get select_image_sub => Intl.message("Displayed in the app",
      name: 'select_image_sub', locale: localeName);
  String get choose_type =>
      Intl.message("Choose type", name: 'choose_type', locale: localeName);
  String get choose_type_sub =>
      Intl.message("Label", name: 'choose_type_sub', locale: localeName);
  String get quantity =>
      Intl.message("Quantity", name: 'quantity', locale: localeName);
  String get unit => Intl.message("Unit", name: 'unit', locale: localeName);
  String get select_center =>
      Intl.message("Selecting nearest distribution center",
          name: 'select_center', locale: localeName);
  String get self_deliver =>
      Intl.message("Do you want to deliver the donation on your own?",
          name: 'self_deliver', locale: localeName);
  String get today => Intl.message("Today", name: 'today', locale: localeName);
  String get yesterday =>
      Intl.message("Yesterday", name: 'yesterday', locale: localeName);
  String get a_deliveries =>
      Intl.message("deliveries", name: 'a_deliveries', locale: localeName);
  String get a_inventory =>
      Intl.message("inventory", name: 'a_inventory', locale: localeName);
  String get a_helpers =>
      Intl.message("helpers", name: 'a_helpers', locale: localeName);
  String get a_settings =>
      Intl.message("settings", name: 'a_settings', locale: localeName);
  String get eta => Intl.message("Ajustes", name: 'eta', locale: localeName);
  String get donated =>
      Intl.message("Donated", name: 'donated', locale: localeName);
  String get shift => Intl.message("Shift", name: 'shift', locale: localeName);
  String get delivery =>
      Intl.message("Delivery & errands", name: 'delivery', locale: localeName);
  String get prep_food =>
      Intl.message("Preparing food", name: 'prep_food', locale: localeName);
  String get serve_food =>
      Intl.message("Serving food", name: 'serve_food', locale: localeName);
  String get cleaning =>
      Intl.message("Cleaning", name: 'cleaning', locale: localeName);
  String get repair =>
      Intl.message("Repairs & craftwork", name: 'repair', locale: localeName);
  String get garden =>
      Intl.message("Gardening", name: 'garden', locale: localeName);
  String get coord =>
      Intl.message("Coordinate", name: 'coord', locale: localeName);
  String get health =>
      Intl.message("Healthcare", name: 'health', locale: localeName);
  String get teach =>
      Intl.message("Teaching", name: 'teach', locale: localeName);
  String get alt_cat =>
      Intl.message("Alternative Category", name: 'alt_cat', locale: localeName);
  String get at_least_5 => Intl.message("Please enter at least 5 characters...",
      name: 'at_least_5', locale: localeName);
  String get category =>
      Intl.message("Category", name: 'category', locale: localeName);
  String get summary =>
      Intl.message("Summary", name: 'summary', locale: localeName);
  String get desc =>
      Intl.message("Description", name: 'desc', locale: localeName);
  String get impact_points =>
      Intl.message("Impact Points", name: 'impact_points', locale: localeName);
  String get date => Intl.message("Date", name: 'date', locale: localeName);
  String get invite_user =>
      Intl.message("Invite User", name: 'invite_user', locale: localeName);
  String get admins =>
      Intl.message("Admins", name: 'admins', locale: localeName);
  String get m_categories =>
      Intl.message("categories", name: 'm_categories', locale: localeName);
  String get m_centers =>
      Intl.message("centers", name: 'm_centers', locale: localeName);
  String get m_pickup =>
      Intl.message("for pickup", name: 'm_pickup', locale: localeName);
  String get create_prod_cat => Intl.message("Create a product category",
      name: 'create_prod_cat', locale: localeName);
  String get product_class => Intl.message("Product classification",
      name: 'product_class', locale: localeName);
  String get super_cat => Intl.message("Is this a super category?",
      name: 'super_cat', locale: localeName);
  String get super_cat_sub =>
      Intl.message("e.g.: vegetables, toys, sanitary products",
          name: 'super_cat_sub', locale: localeName);
  String get benefit_points => Intl.message("Benefit points",
      name: 'benefit_points', locale: localeName);
  String get select_super_cat => Intl.message("Select super category",
      name: 'select_super_cat', locale: localeName);
  String get none => Intl.message("<None>", name: 'none', locale: localeName);
  String get average_peso => Intl.message("ø price in Chilean peso",
      name: 'average_peso', locale: localeName);
  String get price => Intl.message("Price", name: "price");
  String get size_templates => Intl.message("Sizes", name: "size_templates");
  String get small => Intl.message("small", name: "small");
  String get medium => Intl.message("medium", name: "medium");
  String get large => Intl.message("large", name: "large");
  String get conditions =>
      Intl.message("Possible product conditions", name: "conditions");
  String get add_cond => Intl.message("Add condition", name: "add_cond");
  String get max_delay =>
      Intl.message("Max. delay for pickup", name: "max_delay");
  String get manage_donations =>
      Intl.message("Donations for pickup", name: "manage_donations");
  String get manage_donations_sub => Intl.message(
      "Management of donations that are over their maximum pickup delay and need to be assigned to a collector.",
      name: "manage_donations_sub");
  String get center => Intl.message("Center", name: "center");
  String get manage_centers =>
      Intl.message("Distribution Centers", name: "manage_centers");
  String get manage_centers_sub =>
      Intl.message("Management of distribution centers. Create new centers.",
          name: "manage_centers_sub");
  String get claim => Intl.message("Claim", name: "claim");
  String get all_cats => Intl.message("All categories", name: "all_cats");
  String get meals => Intl.message("Meals", name: "meals");
  String get groceries => Intl.message("Groceries", name: "groceries");
  String get sanitary => Intl.message("Sanitary products", name: "sanitary");
  String get send => Intl.message("Send", name: "send");
  String get new_question => Intl.message("Question", name: "new_question");
  String get reply => Intl.message("Reply", name: "reply");
}

class MingaLocalizationsDelegate
    extends LocalizationsDelegate<MingaLocalizations> {
  const MingaLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<MingaLocalizations> load(Locale locale) =>
      MingaLocalizations.load(locale);

  @override
  bool shouldReload(MingaLocalizationsDelegate old) => false;
}

void main() {
  runApp(MingaApp());
}

class MingaApp extends StatelessWidget {
  _buildTheme() => ThemeData(
        appBarTheme: AppBarTheme(elevation: 0),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: primary200,
            selectedItemColor: Colors.black),
        bottomAppBarTheme: BottomAppBarTheme(elevation: 0),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: primary,
          foregroundColor: Colors.white,
          hoverElevation: 1,
          focusElevation: 1,
          highlightElevation: 1,
        ),
        scaffoldBackgroundColor: Colors.grey[100],
        primaryColor: primary,
        accentColor: primary200,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.montserratTextTheme(),
        buttonTheme: ButtonThemeData(
          buttonColor: primary200,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        cardTheme: CardTheme(
          elevation: .5,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      );
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<NavigationCubit>(create: (_) => NavigationCubit()),
        ],
        child: MaterialApp(
          title: 'Minga App',
          theme: _buildTheme(),
          routes: {
            '/': (_) => HomeScreen(),
          },
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
          onGenerateTitle: (BuildContext context) =>
              MingaLocalizations.of(context).title,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            MingaLocalizationsDelegate(),
          ],
          supportedLocales: [
            const Locale('en', ''),
            const Locale('es', ''),
          ],
        ),
      );
}
