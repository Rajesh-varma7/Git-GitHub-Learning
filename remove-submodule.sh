#!/bin/bash
# Script to remove the broken Merging submodule

# Remove the submodule from git
git rm --cached Merging

# Remove submodule section from .gitmodules if it exists
git config --file=.gitmodules --remove-section submodule.Merging 2>/dev/null || true

# If .gitmodules is now empty, remove it
if [ ! -s .gitmodules ]; then
  git rm .gitmodules 2>/dev/null || true
fi

# Clean up submodule directory if it exists
rm -rf .git/modules/Merging 2>/dev/null || true

git add .gitmodules 2>/dev/null || true
git commit -m "Remove broken Merging submodule"
git push
