//
// Gustavo Paulo <gustavo.paulo.segura@gmail.com>
// oni configuration
//
// https://github.com/onivim/oni/wiki/Configuration

const activate = oni => {
    console.log("config activated")
    console.log(
        document.getSelection("#host > div > div:nth-child(2) > div > div.container.full > div:nth-child(1) > div > div > div.dock.container.fixed.horizontal")
    )
}

const deactivate = () => {
    console.log("config deactivated")
}

module.exports = {
    activate,
    deactivate,
    "oni.loadInitVim": true,
    "autoClosingPairs.enabled": true,
    "editor.fontFamily": "Knack Nerd Font",
    "ui.colorscheme": "badwolf",
    "ui.animations.enabled": true,

    "oni.hideMenu": true,
    "oni.useDefaultConfig": false,
    "sidebar.enabled": false,
    "statusbar.enabled": false,
}

