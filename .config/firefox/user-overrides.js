// Disable the Twitter/R*ddit/Faceberg ads in the URL bar:
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.suggest.topsites", false); // [FF78+]
user_pref("browser.urlbar.suggest.trending", false);
// Disable all other 
user_pref("browser.urlbar.suggest.weather", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", false);
user_pref("browser.urlbar.suggest.bestmatch", false);
user_pref("browser.urlbar.suggest.addons", false);
user_pref("browser.urlbar.suggest.pocket", false);

// Disable Firefox Ads
user_pref("identity.fxaccounts.enabled", false);
user_pref("browser.urlbar.groupLabels.enabled", false);

// Let the user enable compact mode (More tools --> Customize Toolbar --> Density)
user_pref("browser.compactmode.show", true);

// Set to 'false' to let private tabs mingle with normal tabs
user_pref("browser.privateWindowSeparation.enabled", true);

// Disable letterboxing (Border around webpage)
user_pref("privacy.resistFingerprinting.letterboxing", false);

// Keep sessions
user_pref("privacy.clearOnShutdown.sessions", false);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.offlineApps", false);
