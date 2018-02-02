#!/bin/sh

case "$fn" in
    # rkhunter : update and execute
    "rkhunter:crontask")
        rkhunter --update --report-warnings-only --skip-keypress
 ;;
esac

case "$fn" in
    # rkhunter : cronjob
    "rkhunter:cronjob")
        OUTPUT=`rkhunter --update --cronjob --report-warnings-only --nocolors --skip-keypress`

        if [ "$OUTPUT" != "" ]
        then
            echo $OUTPUT | mail -s "[rkhunter] Warnings found for $(hostname)" ${user_email}
        fi
 ;;
esac
