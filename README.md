# Wunderio Tap

## How do I install these formulae?

`brew install wunderio/tap/<formula>`

Or `brew tap wunderio/tap` and then `brew install <formula>`.

## How do I update these formulae?

Clone this git repository to `/usr/local/Homebrew/Library/Taps/wunderio/homebrew-tap`.

Edit the formulae and test the changes by running:
```
cd /usr/local/Homebrew/Library/Taps
HOMEBREW_NO_INSTALL_FROM_API=1 brew reinstall --build-from-source --verbose --debug <formula>
```
