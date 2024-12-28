#!/bin/bash
src_dir="."
dest_dir="des-dir"

if [ -d "$src_dir" ]; then
    tar -czf "$dest_dir/backup_$(date +%F).tar.gz" "$src_dir"
    echo "Backup created at $dest_dir"
else
    echo "Source directory $src_dir does not exist"
fi

# tar: The command used for archiving files.

# -c: Create a new archive.
# -z: Compress the archive using gzip.
# -f: Specifies the filename of the archive.