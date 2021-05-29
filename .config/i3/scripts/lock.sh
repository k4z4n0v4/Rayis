
#!/bin/sh

notify-send "DUNST_COMMAND_PAUSE"
B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#506070cc'  # default
T='#dcdcccee'  # text
W='#93e0e3bb'  # wrong
V='#94bff3bb'  # verifying

i3lock -n \
--insidever-color=$C   \
--ringver-color=$V     \
\
--insidewrong-color=$C \
--ringwrong-color=$W   \
\
--inside-color=$B      \
--ring-color=$D        \
--line-color=$B        \
--separator-color=$D   \
\
--verif-color=$T        \
--wrong-color=$T        \
--time-color=$T        \
--date-color=$T        \
--layout-color=$T      \
--keyhl-color=$W       \
--bshl-color=$W        \
\
--screen 1            \
--blur 6              \
--clock               \
--indicator           \
#--timestr="%H:%M:%S"  \
#--datestr="%A, %m %Y" \
--keylayout 2;

notify-send "DUNST_COMMAND_RESUME"

# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
