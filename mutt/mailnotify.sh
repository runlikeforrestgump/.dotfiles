#!/usr/bin/env bash

# Author: https://github.com/runlikeforrestgump

while inotifywait -qq -e moved_to ~/.mutt/mail/INBOX/new/; do
    maildirs="$HOME/.mutt/mail/INBOX/new/"
    num_emails=`find $maildirs -type f | wc -l`

    if [ "$num_emails" -eq "0" ]; then
        continue
    fi

    summary="You have 1 new email."
    if [ "$num_emails" -gt "1" ]; then
        summary="You have $num_emails new emails."
    fi

    # The following characters cause notifications to be empty: & and <.
    # Make sure you fix the ampersand first; otherwise, the
    # second translation will be &amp;lt;
    messages=`grep -h -m 2 "^\(From:\|Subject:\)" ${maildirs}* \\
        | sed 's/&/&amp;/' | sed 's/</\&lt;/' | sed '/^Subject:/G'`

    notify-send "$summary" "$messages" -i ~/.mutt/mutt_the_dog.png
done
