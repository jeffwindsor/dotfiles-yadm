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

# =================================================================================================
# DOCS at https://docs.qtile.org/en/latest/manual/config/lazy.html
# =================================================================================================
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import colors

# =================================================================================================
colors      = colors.DoomOne
terminal    = "alacritty"
browser     = "firefox"
editor      = f'{terminal} -c nvim'

# =================================================================================================
super_key   = "mod4"
alt_key     = "mod1"
control_key = "control"
mods1      = [super_key]
mods2      = mods1 + [control_key]
mods3      = mods2 + [alt_key]

theme     = { "border_width": 2, "margin": 8, "border_focus": colors[8], "border_normal": colors[0] }
theme_max = { "border_width": 0, "margin": 0 }
# =================================================================================================
keys = [

    # Applications
    Key(mods1, "b",      lazy.spawn(browser),    desc='Launch web browser'),
    Key(mods1, "e",      lazy.spawn(editor),     desc='Launch Editor'),
    Key(mods1, "t",      lazy.spawn(terminal),   desc="Launch terminal"),
    KeyChord(mods1, "space", [
        Key([], "space", lazy.spawn("dm-run"), desc='Run Launcher'),
        Key([], "h", lazy.spawn("dm-hub"), desc='List all dmscripts'),
        Key([], "a", lazy.spawn("dm-sounds"), desc='Choose ambient sound'),
        Key([], "b", lazy.spawn("dm-setbg"), desc='Set background'),
        Key([], "c", lazy.spawn("dtos-colorscheme"), desc='Choose color scheme'),
        Key([], "e", lazy.spawn("dm-confedit"), desc='Choose a config file to edit'),
        Key([], "i", lazy.spawn("dm-maim"), desc='Take a screenshot'),
        Key([], "k", lazy.spawn("dm-kill"), desc='Kill processes '),
        Key([], "m", lazy.spawn("dm-man"), desc='View manpages'),
        Key([], "n", lazy.spawn("dm-note"), desc='Store and copy notes'),
        Key([], "o", lazy.spawn("dm-bookman"), desc='Browser bookmarks'),
        Key([], "p", lazy.spawn("passmenu -p \"Pass: \""), desc='Logout menu'),
        Key([], "q", lazy.spawn("dm-logout"), desc='Logout menu'),
        Key([], "r", lazy.spawn("dm-radio"), desc='Listen to online radio'),
        Key([], "s", lazy.spawn("dm-websearch"), desc='Search various engines'),
        Key([], "t", lazy.spawn("dm-translate"), desc='Translate text')
    ])

    # Layouts
    Key(mods1, "Tab",  lazy.next_layout(),         desc="Toggle between layouts"),
    Key(mods2, "Tab",  lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # System
    Key(mods1, "q", lazy.window.kill(),        desc="Kill focused window"),
    Key(mods2, "r", lazy.reload_config(),      desc="Reload the config"),
    Key(mods2, "q", lazy.shutdown(),           desc="Shutdown Qtile"),

    # Monitors: Switch
    Key(mods1, "period", lazy.next_screen(), desc='Move focus to next monitor'),
    Key(mods1, "comma", lazy.prev_screen(), desc='Move focus to prev monitor'),

    # Windows: Switch
    Key(mods1, "h", lazy.layout.left(),        desc="Move focus to left"),
    Key(mods1, "l", lazy.layout.right(),       desc="Move focus to right"),
    Key(mods1, "j", lazy.layout.down(),        desc="Move focus down"),
    Key(mods1, "k", lazy.layout.up(),          desc="Move focus up"),

    # Windows: Move
    Key(mods2, "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key(mods2, "l", lazy.layout.shuffle_right(),desc="Move window to the right"),
    Key(mods2, "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key(mods2, "k", lazy.layout.shuffle_up(),   desc="Move window up"),

    # Windows: Size
    Key(mods2, "equal",
        lazy.layout.grow().when(layout=["monadtall", "monadwide"]),
        lazy.layout.grow_left(),
        desc="Grow window to the left"
    ),
    Key(mods2, "minus",
        lazy.layout.shrink().when(layout=["monadtall", "monadwide"]),
        lazy.layout.grow_right(),
        desc="Grow window to the left"
    ),
    Key(mods2, "n", lazy.layout.normalize(),   desc="Reset all window sizes"),
    Key(mods2, "m", lazy.layout.maximize(), desc='Toggle between min and max sizes'),
    Key(mods2, "t", lazy.window.toggle_floating(), desc='toggle floating'),
    Key(mods2, "f", lazy.window.toggle_fullscreen(), desc='toggle fullscreen'),

]

# =================================================================================================
groups = [Group(label=f'{i}', layout="monadtall", name=f'{i}') for i in range(1,10)]
for g in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key(mods1, g.name, lazy.group[g.name].toscreen(), desc="Switch to group {}".format(g.name)),
        # mod1 + shift + letter of group = switch to & move focused window to group
        Key(mods2, g.name, lazy.window.togroup(g.name, switch_group=True), desc="Move focused window to group {}".format(g.name)),
    ])

# =================================================================================================
layouts = [
    layout.MonadTall(**theme),
    # layout.Columns(**theme),
    layout.Max(*theme_max),
    layout.Bsp(**theme),
    layout.Zoomy(**theme),
]

# =================================================================================================
widget_defaults = dict(
    font     = "JetBrains Mono",
    fontsize = 12,
    padding  = 0,
)
extension_defaults = widget_defaults.copy()

def init_widgets_list():
    widgets_list = [
        widget.Image(
                 filename = "~/.config/qtile/icons/logo.png",
                 scale = "False",
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm)},
                 ),
        widget.Prompt(
                 font = "Ubuntu Mono",
                 fontsize=14,
                 foreground = colors[1]
        ),
        widget.GroupBox(
                 fontsize = 11,
                 margin_y = 3,
                 margin_x = 4,
                 padding_y = 2,
                 padding_x = 3,
                 borderwidth = 3,
                 active = colors[8],
                 inactive = colors[1],
                 rounded = False,
                 highlight_color = colors[2],
                 highlight_method = "line",
                 this_current_screen_border = colors[7],
                 this_screen_border = colors [4],
                 other_current_screen_border = colors[7],
                 other_screen_border = colors[4],
                 ),
        widget.TextBox(
                 text = '|',
                 font = "Ubuntu Mono",
                 foreground = colors[1],
                 padding = 2,
                 fontsize = 14
                 ),
        widget.CurrentLayoutIcon(
                 # custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                 foreground = colors[1],
                 padding = 0,
                 scale = 0.7
                 ),
        widget.CurrentLayout(
                 foreground = colors[1],
                 padding = 5
                 ),
        widget.TextBox(
                 text = '|',
                 font = "Ubuntu Mono",
                 foreground = colors[1],
                 padding = 2,
                 fontsize = 14
                 ),
        widget.WindowName(
                 foreground = colors[6],
                 max_chars = 40
                 ),
        widget.GenPollText(
                 update_interval = 300,
                 func = lambda: subprocess.check_output("printf $(uname -r)", shell=True, text=True),
                 foreground = colors[3],
                 fmt = '❤  {}',
                 decorations=[
                     BorderDecoration(
                         colour = colors[3],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.CPU(
                 format = '▓  Cpu: {load_percent}%',
                 foreground = colors[4],
                 decorations=[
                     BorderDecoration(
                         colour = colors[4],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.Memory(
                 foreground = colors[8],
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e htop')},
                 format = '{MemUsed: .0f}{mm}',
                 fmt = '🖥  Mem: {} used',
                 decorations=[
                     BorderDecoration(
                         colour = colors[8],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.DF(
                 update_interval = 60,
                 foreground = colors[5],
                 mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn(myTerm + ' -e df')},
                 partition = '/',
                 #format = '[{p}] {uf}{m} ({r:.0f}%)',
                 format = '{uf}{m} free',
                 fmt = '🖴  Disk: {}',
                 visible_on_warn = False,
                 decorations=[
                     BorderDecoration(
                         colour = colors[5],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.Volume(
                 foreground = colors[7],
                 fmt = '🕫  Vol: {}',
                 decorations=[
                     BorderDecoration(
                         colour = colors[7],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.KeyboardLayout(
                 foreground = colors[8],
                 fmt = '⌨  Kbd: {}',
                 decorations=[
                     BorderDecoration(
                         colour = colors[8],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.Clock(
                 foreground = colors[6],
                 format = "⏱  %a, %b %d - %H:%M",
                 decorations=[
                     BorderDecoration(
                         colour = colors[6],
                         border_width = [0, 0, 2, 0],
                     )
                 ],
                 ),
        widget.Spacer(length = 8),
        widget.Systray(padding = 3),
        widget.Spacer(length = 8),

        ]
    return widgets_list

# =================================================================================================
screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                # NB Systray is incompatible with Wayland, consider using StatusNotifier instead
                # widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag(mods1, "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag(mods1, "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click(mods1, "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

# =================================================================================================
# if __name__ in ["config", "__main__"]:
#     screens = init_screens()
#     widgets_list = init_widgets_list()
#     widgets_screen1 = init_widgets_screen1()
#     widgets_screen2 = init_widgets_screen2()

