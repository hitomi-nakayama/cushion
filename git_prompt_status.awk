BEGIN {
    FS = ""  # split by char
    count_mod = 0
    count_untracked = 0
}
{
    if ($1 == "?") {
        count_untracked += 1
    } else {
        count_mod += 1
    }

}
END {
    if (count_mod) {
        printf "!%d", count_mod
    }
    if (count_untracked) {
        printf "?%d", count_untracked
    }
}
