find /path/to/directory -print | awk '{
    split($0, parts, "/");
    level = length(parts);
    if (level > maxLevel) {
        if (count) {
            print first; 
            print last; 
        }
        first = last = $0;
        count = 1;
        maxLevel = level;
    } else if (level == maxLevel) {
        if (!count) {
            first = $0;
            count++;
        }
        last = $0;
    }
} END {
    if (count) {
        print first;
        print last;
    }
}'
