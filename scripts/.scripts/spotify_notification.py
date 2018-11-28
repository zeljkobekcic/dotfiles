#!/usr/bin/env python3

from gi.repository import Playerctl, GLib
from subprocess import Popen

player = Playerctl.Player(player_name='spotify')

def on_play(player):
    track_info = '{artist} - {title}'.format(artist=player.get_artist(), title=player.get_title())
    Popen(['notify-send','Now Playing:',track_info])

def on_pause(player):
    track_info = '{artist} - {title}'.format(artist=player.get_artist(), title=player.get_title())
    Popen(['notify-send', 'Paused:',track_info])

player.on('play',on_play)
player.on('pause',on_pause)

GLib.MainLoop().run()
