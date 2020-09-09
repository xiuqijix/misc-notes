# Installation
```
$ pip install sphinx
$ pip install recommonmark
```

# Project Tree
```
project_name
- docs
- src
```

```
$ cd project_name/docs
$ sphinx-quickstart
```

# source/conf.py
```
import os
import sys

sys.path.insert(0, os.path.abspath('../../src'))
sys.path.append(os.path.abspath('../../'))

extensions = [
    'sphinx.ext.autodoc',
    'sphinx.ext.doctest',
    'sphinx.ext.intersphinx',
    'sphinx.ext.todo',
    'sphinx.ext.coverage',
    'sphinx.ext.mathjax',
    'recommonmark',
]

...

html_theme = 'sphinx_rtd_theme'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".

import sphinx_rtd_theme

html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]


# from recommonmark.parser import CommonMarkParser

source_parsers = {'.md':  'recommonmark.parser.CommonMarkParser'}
source_suffix = {
    '.rst': 'restructuredtext',
    '.txt': 'restructuredtext',
    '.md': 'markdown',
}
```

```
$ sphinx-apidoc -o source ../src/
$ make html
```

Open project_name/docs/build/html/index.html

Link https://blog.csdn.net/sinat_29957455/article/details/83657029

Link https://sphinx-rtd-tutorial.readthedocs.io/en/latest/index.html
