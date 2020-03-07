mkdir -p .cache/scrot
scrot -sf -p '.cache/scrot/%Y-%m-%d-%H-%M-%S.png' -e 'xclip -selection clipboard -target image/png -i $f'
