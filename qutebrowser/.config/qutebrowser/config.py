# import pywalQute.draw

# Enable PyWal16 Colors for QuteBrowser
# pywalQute.draw.color(c, {
#     'spacing': {
#         'vertical': 6,
#         'horizontal': 8,
#     }
# })

c.editor.command = ["foot", "nvim","-f", "{file}", "-c", "normal {line}G{column0}1"]
c.auto_save.session = True
c.session.lazy_restore = True
c.completion.shrink = True
c.completion.use_best_match = True

# Adblock
c.content.blocking.enabled = True
c.content.blocking.hosts.block_subdomains = True
c.content.blocking.method = "both"

config.source("gruvbox.py")
config.load_autoconfig()
