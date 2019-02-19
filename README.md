# Dotfiles
If you want to use my dotfiles, first fork this repo, take a look at the code, then edit the files or remove the stuff that you won't be using. This repository is a collection of dotfiles that cater to my needs.

## How to install

- read and run parts of ```setup-machine.sh```
- read and run ```symlink-setup.sh```

### Install Oh My ZSH

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### Symlink vscode to settings.js:

```
ln -sf ~/path/to/vscode.json /Users/home/Library/Application\ Support/Code/User/settings.json
```

## Feedback
Any suggestions are [welcome](https://github.com/edson-junior/dotfiles/issues)!

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Contributing
Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests.

## Thanks to...
- Paul Irish's **[dotfiles](https://github.com/paulirish/dotfiles)**
- Mathias Bynens' **[dotfiles](https://github.com/mathiasbynens/dotfiles)**
- Wes Bos' **[dotfiles](https://github.com/wesbos/dotfiles)**
- And many others 😃
