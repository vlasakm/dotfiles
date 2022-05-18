// https://github.com/mozilla/gecko-dev/blob/master/browser/app/profile/firefox.js
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.bookmarks.editDialog.firstEditField", "tagsField");
user_pref("browser.bookmarks.openInTabClosesMenu", false);
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.ctrlTab.migrated", true);
user_pref("browser.ctrlTab.recentlyUsedOrder", false);
user_pref("browser.formfill.enable", false);
user_pref("browser.fullscreen.autohide", false);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.search.context.loadInBackground", true);
user_pref("browser.search.countryCode", "CZ");
user_pref("browser.search.hiddenOneOffs", "Google,Bing,Amazon.com,DuckDuckGo,Twitter,eBay,Wikipedia (en)");
user_pref("browser.search.region", "CZ");
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.sessionstore.max_tabs_undo", 30);
user_pref("browser.sessionstore.max_windows_undo", 15);
user_pref("browser.startup.homepage", "about:blank");
user_pref("browser.startup.page", 3);
user_pref("browser.tabs.closeWindowWithLastTab", true);
user_pref("browser.tabs.extraDragSpace", true);
user_pref("browser.tabs.insertAfterCurrent", true);
user_pref("browser.tabs.loadBookmarksInBackground", true);
user_pref("browser.toolbars.bookmarks.showOtherBookmarks", false);
user_pref("browser.uidensity", 1);
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.history", true);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.warnOnQuit", false);
user_pref("devtools.theme", "dark");
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.webextensions.restrictedDomains", "");
user_pref("full-screen-api.transition-duration.enter", "0 0");
user_pref("full-screen-api.transition-duration.leave", "0 0");
user_pref("full-screen-api.warning.timeout", 0);
user_pref("geo.enabled", false);
user_pref("layout.css.prefers-color-scheme.content-override", 0); // https://www.reddit.com/r/firefox/comments/razjjv/firefox_950_see_all_new_features_updates_and_fixes/hnlnqpd/
user_pref("layout.spellcheckDefault", 0);
user_pref("layout.word_select.eat_space_to_next_word", true);
user_pref("lightweightThemes.selectedThemeID", "firefox-compact-dark@mozilla.org");
user_pref("media.eme.enabled", true);
user_pref("media.hardwaremediakeys.enabled", false);
user_pref("media.peerconnection.enabled", false);
user_pref("media.videocontrols.picture-in-picture.video-toggle.enabled", false);
user_pref("mousewheel.system_scroll_override.enabled", false);
user_pref("network.http.throttle.enable ", false);
user_pref("privacy.donottrackheader.enabled", true);
user_pref("signon.rememberSignons", false);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
//user_pref("widget.chrome.allow-gtk-dark-theme", false);
//user_pref("widget.content.allow-gtk-dark-theme", true);

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

// Lepton (https://github.com/black7375/Firefox-UI-Fix/blob/master/user.js)
user_pref("browser.proton.enabled", false);
user_pref("svg.context-properties.content.enabled", true);
user_pref("layout.css.backdrop-filter.enabled", true);
user_pref("browser.compactmode.show", true);

// Allow non-signed extensions in dev-edition
user_pref("xpinstall.signatures.required", false);
