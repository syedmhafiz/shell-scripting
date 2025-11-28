#!/bin/zsh

# Configuration
ERROR_PATTERNS=("CRITICAL" "ERROR" "WARN" "DEBUG" "INFO")
REPORT_FILE="$PWD/logs-report.txt"

# Find and display recently updated log files
echo "\nList of log files updated in the last 24 hours:\n" > $REPORT_FILE
LOG_FILES=$(find . -name "*.log" -mtime -1)
echo "$LOG_FILES" >> $REPORT_FILE

# Analyze each found log file
for LOG_FILE in ${(f)LOG_FILES}; do
    echo "\nAnalyzing logs from $LOG_FILE...\n" >> $REPORT_FILE
    
    for i in {1..5}; do
        echo "Number of ${(L)ERROR_PATTERNS[$i]} found:" >> $REPORT_FILE
        ISSUE_COUNT=$(grep -c "$ERROR_PATTERNS[$i]" "$LOG_FILE")
        echo "$ISSUE_COUNT" >> $REPORT_FILE

        if [[ "$ERROR_PATTERNS[$i]" == "CRITICAL" && $ISSUE_COUNT -gt 50 ]]; then
            echo "\nToo many Critical issues found in $LOG_FILE, Attention required immediately\n"
        fi

        if [[ "$ERROR_PATTERNS[$i]" == "ERROR" && $ISSUE_COUNT -gt 75 ]]; then
            echo "\nToo many Error issues found in $LOG_FILE, Attention required immediately\n"
        fi

        if [[ "$ERROR_PATTERNS[$i]" == "WARN" && $ISSUE_COUNT -gt 100 ]]; then
            echo "\nToo many Warning issues found in $LOG_FILE, Attention required immediately\n"
        fi
    done
    
    echo "\n======================" >> $REPORT_FILE
done

echo "\nLog analysis completed. Report saved to $REPORT_FILE"