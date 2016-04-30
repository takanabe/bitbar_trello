## bitbar trello
[BitBar](https://github.com/matryer/bitbar) plugin for display Trello contents on your Mac OS X Menu Bar.

### Fetatures
* Display current `Doing` list cards
* Display current `Done` list cards
* Move a card from `Doing` list to `Done` list
* Jump to Web page to click card titles

### Usage
#### Installation
```
git clone https://github.com/takanabe/bitbar_trello.git
cd /path/to/bitbar_trello
```

Please, install bundler and some gems in you system ruby. If you use rbenv to manage ruby environment, like follows:

```
rbenv local system
sudo gem install bundler
bundle
```

#### Edit dotenv file
Prepare dotenv file with your Trello Consumer Key, Secret, and OAuth Token

```
cp dotenv .env
vim .env
```

