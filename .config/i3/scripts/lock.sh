
#!/bin/sh

notify-send "DUNST_COMMAND_PAUSE"
B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#506070cc'  # default
T='#dcdcccee'  # text
W='#93e0e3bb'  # wrong
V='#94bff3bb'  # verifying

i3lock -n \
--insidevercolor=$C   \
--ringvercolor=$V     \
\
--insidewrongcolor=$C \
--ringwrongcolor=$W   \
\
--insidecolor=$B      \
--ringcolor=$D        \
--linecolor=$B        \
--separatorcolor=$D   \
\
--verifcolor=$T        \
--wrongcolor=$T        \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
\
--screen 1            \
--blur 6              \
--clock               \
--indicator           \
--timestr="%H:%M:%S"  \
--datestr="%A, %m %Y" \
--keylayout 2; notify-send "DUNST_COMMAND_RESUME"  \

# --wrongtext="Nope!"
# --textsize=20
 --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
