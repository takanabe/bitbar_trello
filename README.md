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

### How to get Trello Consumer Key and OAuth Token ?
Procedures to get key and token are described on [Trello Developer page](https://trello.com/app-key).
You can get your board and List IDs as follows:

```
# Get Board ID
curl "https://trello.com/1/members/<username>/boards?key=<Key>&token=<Token>&fields=name"
# Get List ID
curl "https://trello.com/1/boards/<BoardID>/lists?key=<Key>&token=<Token>&fields=name"
```
