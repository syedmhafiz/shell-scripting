#!/bin/zsh

# Configuration
APP_LOG_FILE="application.log"
SYSTEM_LOG_FILE="system.log"
ERROR_PATTERNS=("CRITICAL" "ERROR" "WARN" "DEBUG" "INFO")

# Find and display recently updated log files
echo "\nList of log files updated in the last 24 hours:\n"
LOG_FILES=$(find . -name "*.log" -mtime -1)
echo "$LOG_FILES"

# Analyze each found log file
for LOG_FILE in ${(f)LOG_FILES}; do
    echo "\nAnalyzing logs from $LOG_FILE..."
    
    for i in {1..5}; do
        echo "\nNumber of ${(L)ERROR_PATTERNS[$i]} found:"
        grep -c "$ERROR_PATTERNS[$i]" "$LOG_FILE"
    done
    
    echo "\n======================"
done