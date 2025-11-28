#!/bin/zsh

APP_LOG_FILE="application.log"
SYSTEM_LOG_FILE="system.log"

ERROR_PATTERNS=("CRITICAL" "ERROR" "WARN" "DEBUG" "INFO") 


echo "Analyzing logs from Application..."

echo "\nNumber of Critical found:"
grep -c "$ERROR_PATTERNS[1]" $APP_LOG_FILE
echo "\nNumber of Error found:"
grep -c "$ERROR_PATTERNS[2]" $APP_LOG_FILE
echo "\nNumber of Warn found:"
grep -c "$ERROR_PATTERNS[3]" $APP_LOG_FILE
echo "\nNumber of Debug found:"
grep -c "$ERROR_PATTERNS[4]" $APP_LOG_FILE
echo "\nNumber of Info found:"
grep -c "$ERROR_PATTERNS[5]" $APP_LOG_FILE

echo "\n======================"

echo "\nAnalyzing logs from System..."
echo "\nNumber of Critical found:"
grep -c "$ERROR_PATTERNS[1]" $SYSTEM_LOG_FILE
echo "\nNumber of Error found:"
grep -c "$ERROR_PATTERNS[2]" $SYSTEM_LOG_FILE
echo "\nNumber of Warn found:"
grep -c "$ERROR_PATTERNS[3]" $SYSTEM_LOG_FILE
echo "\nNumber of Debug found:"
grep -c "$ERROR_PATTERNS[4]" $SYSTEM_LOG_FILE
echo "\nNumber of Info found:"
grep -c "$ERROR_PATTERNS[5]" $SYSTEM_LOG_FILE