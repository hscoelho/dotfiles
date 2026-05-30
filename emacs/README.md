This emacs config started with cloning [emacs-kick](https://github.com/LionyxML/emacs-kick), but it has been heavily modified since then.
However, some code of the original repo still remains.

From the original emacs-kick README: 

After cloning, install the configuration by running:

```bash
emacs -nw --eval="(ek/first-install)"
```

Alternatively, you can run the provided script `ek-reinstall.sh`
from inside `~/.emacs.d/`, which will achieve the same result:

```bash
cd ~/.emacs.d/ && ./ek-reinstall.sh
```

Both methods will install all necessary packages and apply the
configuration.

**NOTE**: During the initial setup, you'll be prompted to install Tree-sitter
grammars and download some fonts. This configuration uses **Nerd Fonts** by
default, so installing them now is highly recommended for the best experience.

TODO: 
- [x] Configure folding
- [ ] Configure chinese reading (epub + chinese dictionary)
- [ ] Learn and configure org-mode
