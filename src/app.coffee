PIXI = require('pixi')
raf = require('raf')
require('./css/index.styl')

renderer = new PIXI.WebGLRenderer(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.view)

stage = new PIXI.Stage()

bunnyTexture = PIXI.Texture.fromImage(require('./assets/bunny.png'))
bunny = new PIXI.Sprite(bunnyTexture)

bunny.position.x = 400
bunny.position.y = 300

bunny.scale.x = 2
bunny.scale.y = 2

stage.addChild(bunny)

raf(renderer.view).on 'data', ->
  bunny.rotation += 0.01
  renderer.render(stage)
