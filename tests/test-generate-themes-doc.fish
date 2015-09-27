#!/usr/bin/env fish

set -l project_dir (status -f|xargs dirname|xargs dirname)
set -l theme_output (mktemp /tmp/fish.test.Themes.XXXXX.md)
set -l theme_doc $project_dir/docs/Themes.md

fish $project_dir/tools/generate-themes-doc.fish $theme_output

if cmp -s $theme_doc $theme_output
  echo "OK: $theme_doc is up-to-date"
  exit 0
else
  diff $theme_doc $theme_output
  echo "WARN: $theme_doc is not up-to-date"
  exit 1
end
