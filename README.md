A simple [pre-commit](http://pre-commit.com/) hook which will run [Google's java style guide](https://github.com/google/google-java-format) formatter for your java code!

*Note*: I've confirmed that this file is supported up to JDK 17

Usage:

```
repos:
- repo: https://github.com/shirohoo/google-style-precommit-hook
  rev: v1.0.0 # latest version
  hooks:
  - id: google-style-java
```
