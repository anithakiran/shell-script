#!/bin/bash

# Function to display usage
usage() {
  echo "Usage: $0 <source_directory> <destination_directory>"
  exit 1
}

# Ensure two arguments are provided
if [ "$#" -ne 2 ]; then
  usage
fi

# Input variables
SOURCE_DIR=$1
DEST_DIR=$2

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Source directory '$SOURCE_DIR' does not exist."
  exit 2
fi

# Check if destination directory exists; create if not
if [ ! -d "$DEST_DIR" ]; then
  echo "Destination directory '$DEST_DIR' does not exist. Creating it..."
  mkdir -p "$DEST_DIR"
fi

# Create timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

# Define archive name
ARCHIVE_NAME="backup_$(basename "$SOURCE_DIR")_$TIMESTAMP.tar.gz"

# Create the backup
tar -czf "$DEST_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup successfully created: $DEST_DIR/$ARCHIVE_NAME"
else
  echo "Error occurred during backup."
  exit 3
fi
