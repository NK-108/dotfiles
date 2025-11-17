import pywalQute.draw

config.load_autoconfig()

c.editor.command = ["foot", "nvim","-f", "{file}", "-c", "normal {line}G{column0}1"]

pywalQute.draw.color(c, {
    'spacing': {
        'vertical': 6,
        'horizontal': 8,
    }
})
