#!/bin/sh

# Program to output a system information page

TITLE="System information report for $HOSTNAME"
echo "<HTML>
    <HEAD>
          <TITLE>$TITLE</TITLE>
    </HEAD>
    <BODY>
            $TITLE
    </BODY>
</HTML>
"
