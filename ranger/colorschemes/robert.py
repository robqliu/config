from ranger.gui.color import *
from ranger.gui.colorscheme import ColorScheme

class Robert(ColorScheme):
    # fg
    BRONZE = 136
    GRAY = 244
    GREEN = 83
    LIGHT_BLUE = 111
    LIGHT_GRAY = 252
    LIGHT_ORANGE = 179
    RED = 1
    TEAL = 44

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
                fg = self.GREEN
            elif context.tab:
                if context.good:
                    fg = self.GREEN
                else:
                    fg = self.RED
                bg = self.DARK_GRAY
            # Symlink dirs on the current path
            elif context.link:
                fg = self.TEAL
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
            # TODO: Not sure what this does
            elif context.message and context.bad:
                attr |= bold
                fg = self.RED
                bg = self.DARK_GRAY
        elif context.in_browser:
            if context.border:
                fg = self.GRAY
                return fg, bg, attr

            if context.empty or context.error:
                fg = black
                bg = self.RED
                return fg, bg, attr

            if context.directory:
                fg = self.GREEN
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
            else:
                fg = self.LIGHT_GRAY
                attr = normal

            if context.link:
                attr |= bold
                if not context.directory:
                    if context.good:
                        fg = self.TEAL
                    else:
                        fg = self.RED

            if context.selected:
                attr |= bold | reverse
            else:
                # TODO: Do I need this?
                if context.tag_marker:
                    if fg in (self.RED, magenta):
                        fg = white
                    else:
                        fg = self.RED
                    attr |= bold
                if (context.cut or context.copied):
                    attr |= bold | reverse
                    fg = self.LIGHT_GRAY
                    bg = self.RED

            if context.marked:
                attr |= bold
                bg = self.DARK_GRAY

        return fg, bg, attr
