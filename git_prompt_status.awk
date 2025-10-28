BEGIN {
    FS = " "
    count_mod = 0
    count_untracked = 0
}
$1 == "?" {
    count_untracked += 1
}
$1 == "1" || $1 == "2" || $1 == "3" {
    count_mod += 1
}
END {
    if (count_mod) {
        printf "!%d", count_mod
    }
    if (count_untracked) {
        printf "?%d", count_untracked
    }
}
