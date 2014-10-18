from ranger.gui.color import *
from ranger.gui.colorscheme import ColorScheme
import curses

class Robert(ColorScheme):
    # fg
    BRONZE = 136
    GRAY = 244
    GREEN = 83
    LIGHT_BLUE = 111
    LIGHT_GRAY = 252
    LIGHT_ORANGE = 179
    PURPLE = 183
    RED = 1
    YELLOW = 3

    # bg
    DARK_GRAY = 235

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        if context.in_titlebar:
            attr |= bold
            if context.hostname:
                if context.good:
                    fg = self.LIGHT_BLUE
                else:
                    fg = self.RED
                    bg = self.DARK_GRAY
            elif context.directory:
                fg = self.YELLOW
            elif context.tab:
                if context.good:
                    fg = self.GREEN
                else:
                    fg = self.RED
                bg = self.DARK_GRAY
            # Symlink dirs on the current path
            elif context.link:
                fg = self.PURPLE
        elif context.in_statusbar:
            # Loading bar
            if context.loaded:
                bg = self.LIGHT_BLUE
            elif context.permissions:
                if context.good:
                    fg = yellow
                else:
                    fg = self.RED
            # Small 'Mrk' block on bottom right
            elif context.marked:
                attr |= bold
                fg = self.GREEN
                return fg, bg, attr
            # TODO: Not sure what this is for
            elif context.message and context.bad:
                attr |= bold
                fg = self.RED
                bg = self.DARK_GRAY
        elif context.in_browser:
            if context.border:
                fg = self.GRAY
                return fg, bg, attr

            if context.tag_marker:
                attr |= normal
                if fg is self.RED:
                    fg = white
                else:
                    fg = self.RED
                return fg, bg, attr

            if context.empty or context.error or context.bad:
                fg = black
                bg = self.RED
                return fg, bg, attr

            if context.directory:
                attr |= bold
                fg = self.YELLOW
            elif context.media:
                if context.image:
                    fg = self.BRONZE
                else:
                    fg = self.LIGHT_ORANGE
            elif context.container:
                fg = self.LIGHT_BLUE
            elif context.socket or context.fifo or context.device:
                attr |= bold
                bg = self.LIGHT_GRAY
                if context.device:
                    fg = self.GRAY
                else:
                    fg = self.BRONZE
            elif context.executable:
                attr |= bold
                fg = self.GREEN
            elif context.link:
                fg = self.PURPLE
            else:
                fg = self.LIGHT_GRAY
                attr = normal

            if context.selected:
                attr |= bold | reverse
                bg = black
            elif context.cut or context.copied:
                attr |= bold | reverse
                fg = self.YELLOW
                if context.cut:
                    bg = self.RED
                else:
                    bg = self.GREEN

            if context.marked:
                attr |= underline

        return fg, bg, attr
