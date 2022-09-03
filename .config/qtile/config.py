# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# /usr/share/doc/qtile/default_config.py

import os
import getpass

from typing import List  # noqa: F401

from xcffib.xproto import StackMode

from libqtile import bar, layout, widget, hook, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.log_utils import logger

meta_mod = "mod4"
alt_mod = "mod1"
terminal = guess_terminal()

def focus_last(qtile):
    # logger.warning(dir(qtile.current_layout.focus_first()))
    qtile.current_layout.next()

def window_below(qtile):
      qtile.current_window.window.configure(stackmode=StackMode.Below)

def window_above(qtile):
      qtile.current_window.window.configure(stackmode=StackMode.Above)

def window_to_next_group(qtile):
    """Switch to & move focused window to next group"""
    if qtile.current_group.name == '12':
      qtile.current_window.togroup('1')
    else:
      qtile.current_window.togroup(str(int(qtile.current_group.name) + 1))

def window_to_prev_group(qtile):
    """Switch to & move focused window to prev group"""
    if qtile.current_group.name == '1':
      qtile.current_window.togroup('12')
    else:
      qtile.current_window.togroup(str(int(qtile.current_group.name) - 1))

# TODO home-pc global variable
def xdotool_mouse_to_screen_0(qtile):
    os.system('xdotool mousemove 1280 2624')

def xdotool_mouse_to_screen_1(qtile):
    os.system('xdotool mousemove 3160 944')

float_step = 50

keys = [
    # Switch between windows
    Key([meta_mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([meta_mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([meta_mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([meta_mod], "k", lazy.layout.up(), desc="Move focus up"),
    # Key([alt_mod], "Tab", lazy.function(focus_last)),
    # Key([alt_mod], "Tab", lazy.layout.next()),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([meta_mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([meta_mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([meta_mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([meta_mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([meta_mod, "control", "shift"], "j", lazy.layout.flip_down()),
    Key([meta_mod, "control", "shift"], "k", lazy.layout.flip_up()),
    Key([meta_mod, "control", "shift"], "h", lazy.layout.flip_left()),
    Key([meta_mod, "control", "shift"], "l", lazy.layout.flip_right()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([meta_mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([meta_mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([meta_mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([meta_mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([meta_mod, "control"], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([meta_mod, "shift"], "f", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    # Key([meta_mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    Key([meta_mod, "control"], "minus", lazy.window.down_opacity()),
    Key([meta_mod, "control"], "equal", lazy.window.up_opacity()),
    Key([meta_mod], "minus", lazy.function(window_below)),
    Key([meta_mod], "equal", lazy.function(window_above)),

    # Toggle between different layouts as defined below
    Key([meta_mod], "d", lazy.next_layout(), desc="Toggle between layouts"), # TODO
    Key([alt_mod], "F4", lazy.window.kill(), desc="Kill focused window"),

    Key([meta_mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([meta_mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    Key([], "ISO_Next_Group", lazy.widget["keyboardlayout"].next_keyboard(),
        desc="Next keyboard layout"),

    # Key([meta_mod], "p", lazy.screen.prev_group()),
    # Key([meta_mod], "n", lazy.screen.next_group()),
    # Key([meta_mod, "shift"], "p", lazy.function(window_to_prev_group)),
    # Key([meta_mod, "shift"], "n", lazy.function(window_to_next_group)),
    Key([meta_mod], "Down", lazy.window.toggle_minimize()),
    Key([alt_mod], "F11", lazy.window.toggle_fullscreen()),
    Key([meta_mod], "f", lazy.window.toggle_maximize()),
    # TODO [meta_mod, alt_mod] - conflict with goldendict
    Key([meta_mod, alt_mod], "f", lazy.window.toggle_floating()),

    Key([meta_mod, alt_mod, "control"], "Left", lazy.window.resize_floating(-1, 0)),
    Key([meta_mod, alt_mod, "control"], "Down", lazy.window.resize_floating(0, 1)),
    Key([meta_mod, alt_mod, "control"], "Up", lazy.window.resize_floating(0, -1)),
    Key([meta_mod, alt_mod, "control"], "Right", lazy.window.resize_floating(1, 0)),
    Key([meta_mod, alt_mod, "control"], "h", lazy.window.resize_floating(-float_step, 0)),
    Key([meta_mod, alt_mod, "control"], "j", lazy.window.resize_floating(0, float_step)),
    Key([meta_mod, alt_mod, "control"], "k", lazy.window.resize_floating(0, -float_step)),
    Key([meta_mod, alt_mod, "control"], "l", lazy.window.resize_floating(float_step, 0)),

    Key([meta_mod, alt_mod, "shift"], "Left", lazy.window.move_floating(-1, 0)),
    Key([meta_mod, alt_mod, "shift"], "Down", lazy.window.move_floating(0, 1)),
    Key([meta_mod, alt_mod, "shift"], "Up", lazy.window.move_floating(0, -1)),
    Key([meta_mod, alt_mod, "shift"], "Right", lazy.window.move_floating(1, 0)),
    Key([meta_mod, alt_mod, "shift"], "h", lazy.window.move_floating(-float_step, 0)),
    Key([meta_mod, alt_mod, "shift"], "j", lazy.window.move_floating(0, float_step)),
    Key([meta_mod, alt_mod, "shift"], "k", lazy.window.move_floating(0, -float_step)),
    Key([meta_mod, alt_mod, "shift"], "l", lazy.window.move_floating(float_step, 0)),

    # TODO rofi
    # walk though groups:                 alt+space,    alt+shift+space
    # walk though screens:                win+space,    win+shift+space
    # walk though all windows cur group:  alt+tab,      alt+shift+tab
    # walk though all windows all groups: alt+ctrl+tab, alt+ctrl+shift+tab
    # walk though app windows cur group:  win+tab,      win+shift+tab
    # walk though app windows all groups: win+ctrl+tab, win+ctrl+shift+tab
]

groups = [Group(i) for i in [
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
]]

for group in groups:
    groupname = group.name
    keys.extend([
      Key([meta_mod, "shift"], groupname, lazy.window.togroup(groupname, switch_group=False)),
    ])
    if groupname in ['1', '0']:
      keys.extend([
          Key([meta_mod], groupname, lazy.function(xdotool_mouse_to_screen_0), lazy.to_screen(0), lazy.group[groupname].toscreen(toggle=False)),
      ])
    else:
      keys.extend([
          Key([meta_mod], groupname, lazy.function(xdotool_mouse_to_screen_1), lazy.to_screen(1), lazy.group[groupname].toscreen(toggle=False)),
      ])

layouts = [
    layout.Bsp(
        margin = [0, 4, 8, 4],
        border_width = 2,
        fair = False,
        border_focus = '215578',
        border_normal = '2b2b2b',
    ),
]

widget_defaults = dict(
    font='Iosevka Fixed',
    fontsize=16,
    padding=3,
)
extension_defaults = widget_defaults.copy()

spacer = widget.Spacer(length = 10)
clock = widget.Clock(format='%H:%M', font='Digital Numbers Bold', fontsize=14)
keyboard_layout = widget.KeyboardLayout(configured_keyboards=['us', 'ru'], display_map={'us': 'EN', 'ru': 'RU'})

# TODO home-pc global variable
# TODO red color urgent? current monitor border, float windows, this_current_screen_border?
simple_bar = bar.Bar(
    [
        widget.TaskList(
          txt_floating = "🗗",
          txt_maximized = "🗖",
          txt_minimized = "🗕",
          borderwidth = 2,
        ),
        keyboard_layout,
        clock,
    ],
    32,
    opacity = 0.85,
)
complex_bar = bar.Bar(
    [
        widget.TaskList(
          txt_floating = "🗗",
          txt_maximized = "🗖",
          txt_minimized = "🗕",
          borderwidth = 2,
        ),
        # widget.Spacer(length = bar.STRETCH),
        widget.GroupBox(
          disable_drag = True,
          hide_unused = True,
          use_mouse_wheel = False,
          borderwidth = 2,
          this_current_screen_border = '00ff00',
        ),
        keyboard_layout,
        widget.Systray(icon_size = 24), # errors with lazy.restart
        # widget.Battery(),
        spacer,
        widget.TextBox(getpass.getuser()),
        spacer,
        widget.Clock(format='%Y-%m-%d %b %a'),
        clock,
    ],
    32,
    opacity = 0.85,
)
screens = [
    Screen(
        bottom=simple_bar,
    ),
    Screen(
        bottom=complex_bar,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([meta_mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([meta_mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([meta_mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    border_width = 2,
    # border_focus = '215578',
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class='confirmreset'),  # gitk
        Match(wm_class='makebranch'),  # gitk
        Match(wm_class='maketag'),  # gitk
        Match(wm_class='ssh-askpass'),  # ssh-askpass
        Match(title='branchdialog'),  # gitk
        Match(title='pinentry'),  # GPG key password entry
        Match(title='Welcome to Brave'),
        Match(wm_class='Variety'),
        Match(wm_class='Gpick'),
    ]
)
auto_fullscreen = False
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# @hook.subscribe.client_killed
# def client_killed (window):
#   logger.warning(window)
#
# @hook.subscribe.group_window_add
# def group_window_add(group, window):
#   logger.warning(group)
#   logger.warning(window)

@hook.subscribe.client_focus
def client_focus(window):
  # logger.warning(vars(window))
  # it is possible to put tile windows above fullscreen windows
  # TODO alttab below fullscreen alacritty windows, fullscreen vlc menus is dissappering, rofi below cur window
  # if window.minimized:
  #   logger.warning(dir(window))
  #   window.minimized = False
    # window.window.configure(stackmode=StackMode.Above)
  # elif: # window.maximized:
  #   logger.warning('---')
  #   logger.warning(dir(window))
  if window.floating:
    window.cmd_bring_to_front()

# @hook.subscribe.client_managed
# def client_managed(window):
#   logger.warning(window)
#
# @hook.subscribe.client_mouse_enter
# def client_mouse_enter(window):
#   logger.warning(window)
#
# @hook.subscribe.float_change
# def float_change():
#   logger.warning('123')

# @hook.subscribe.setgroup
# def setgroup():
#     logger.warning('123')

# @hook.subscribe.restart
# def restart():
#     os.system('killall variety') # HACK
#     os.system('dex ~/.config/autostart/variety.desktop') # HACK

# for brave and other apps which remember own position
# TODO after lazy.restart all windows moves to one desktop
# @hook.subscribe.client_new
# def client_new(window):
#     if qtile.current_group.name:
#         window.togroup(qtile.current_group.name)

@hook.subscribe.startup_once
def startup_once():
    os.system('/etc/scripts/autostart_qtile.sh')
