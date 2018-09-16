#!/bin/zsh
# Reinitialization is needed to prevent "jenv: no such command `enable-plugin'"
eval "$(jenv init -)"
jenv enable-plugin maven
jenv enable-plugin export
jenv enable-plugin springboot
