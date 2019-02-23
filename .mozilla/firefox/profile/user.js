// https://github.com/mozilla/gecko-dev/blob/master/browser/app/profile/firefox.js
user_pref("browser.bookmarks.editDialog.firstEditField", "tagsField");
user_pref("browser.bookmarks.openInTabClosesMenu", false);
user_pref("browser.bookmarks.restore_default_bookmarks", false);
user_pref("browser.bookmarks.showMobileBookmarks", false);
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.ctrlTab.migrated", true);
user_pref("browser.ctrlTab.recentlyUsedOrder", false);
user_pref("browser.formfill.enable", false);
user_pref("browser.fullscreen.autohide", false);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.search.context.loadInBackground", true);
user_pref("browser.search.countryCode", "CZ");
user_pref("browser.search.hiddenOneOffs", "Google,Bing,Amazon.com,DuckDuckGo,Twitter,Wikipedia (en)");
user_pref("browser.search.region", "CZ");
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.startup.page", 3);
user_pref("browser.tabs.closeWindowWithLastTab", true);
user_pref("browser.tabs.extraDragSpace", true);
user_pref("browser.tabs.insertAfterCurrent", true);
user_pref("browser.tabs.loadBookmarksInBackground", true);
user_pref("browser.uidensity", 1);
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.history", true);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.warnOnQuit", false);
user_pref("devtools.theme", "dark");
user_pref("extensions.pocket.enabled", false);
user_pref("general.warnOnAboutConfig", false);
user_pref("geo.enabled", false);
user_pref("layout.spellcheckDefault", 0);
user_pref("layout.word_select.eat_space_to_next_word", true);
user_pref("lightweightThemes.selectedThemeID", "firefox-compact-dark@mozilla.org");
user_pref("media.eme.enabled", true);
user_pref("network.http.throttle.enable ", false);
user_pref("reader.parse-on-load.enabled", false);
user_pref("signon.remembersignons", false);
user_pref("signon.rememberSignons", false);
user_pref("widget.chrome.allow-gtk-dark-theme", true);
user_pref("widget.content.allow-gtk-dark-theme", true);

// Fonts
user_pref("font.default.x-western", "sans-serif");
user_pref("font.name.serif.x-western", "serif");
user_pref("font.name.sans-serif.x-western", "sans-serif");
user_pref("font.name.monospace.x-western", "monospace");

// Scaling
user_pref("devPixelsPerPx", "1.0");

// Potential problems
user_pref("dom.event.clipboardevents.enabled", false);
user_pref("findbar.highlightAll", true);
user_pref("network.IDN_show_punycode", true);
user_pref("toolkit.cosmeticAnimations.enabled", false);
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");

// Allow non-signed extensions in dev-edition
user_pref("xpinstall.signatures.required", false);
