#!/usr/bin/env bash

set -u

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
repo_root=$(cd -- "$script_dir/.." && pwd)
template_dir=$repo_root/templates

if [ ! -d "$template_dir" ]; then
    printf 'Error: template directory does not exist: %s\n' "$template_dir" >&2
    exit 1
fi

violations=0
files_found=0

while IFS= read -r -d '' file; do
    files_found=1
    line_number=0
    in_include=0
    include_start=0
    include_tag=
    include_line=

    while IFS= read -r line || [ -n "$line" ]; do
        line_number=$((line_number + 1))

        if [ "$in_include" -eq 0 ]; then
            if printf '%s\n' "$line" | grep -qE '\{%[[:space:]]*include([[:space:]]|$)'; then
                in_include=1
                include_start=$line_number
                include_tag=$line
                include_line=$line
            fi
        else
            include_tag="$include_tag
$line"
        fi

        if [ "$in_include" -eq 1 ] && printf '%s\n' "$line" | grep -q '%}'; then
            if [[ "$include_tag" =~ [[:space:]]with([[:space:]]|\{).*ignore[[:space:]]+missing ]]; then
                printf '%s:%s: %s\n' "$file" "$include_start" "$include_line"
                violations=1
            fi
            in_include=0
            include_start=0
            include_tag=
            include_line=
        fi
    done < "$file"
done < <(find "$template_dir" -type f -name '*.html.twig' -print0)

if [ "$files_found" -eq 0 ]; then
    printf 'Error: no *.html.twig files found under: %s\n' "$template_dir" >&2
    exit 1
fi

if [ "$violations" -ne 0 ]; then
    exit 1
fi

printf 'Twig include argument order check passed.\n'
