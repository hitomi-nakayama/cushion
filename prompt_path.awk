BEGIN {
    FS = "\n"    # one field per line
    OFS = "/"
    before_ellipsis = 2
    after_ellipsis = 2
}
{
    path = $0

    if (index(path, HOME) == 1) {
        # replace home path with ~
        path = "~" substr(path, length(HOME) + 1)
    }

    num_parts = split(path, path_parts, "/")

    first = 1
    for (i = 1; i <= num_parts; i++) {
        if (first) {
            first = 0
        } else {
            printf "%s", OFS
        }

        if (i > before_ellipsis && i < num_parts - after_ellipsis + 1) {
            # replace truncated section with ellipses
            i = num_parts - after_ellipsis
            printf "…"
            continue
        }

        printf "%s", path_parts[i]
    }
    printf "\n"
}
