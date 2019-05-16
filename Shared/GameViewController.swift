//
//  GameViewController.swift
//  glideTutorialCharacterPlatform
//
//  Created by glide on 2019-05-16.
//

import GlideEngine
import SpriteKit

class GameViewController: ViewControllerType {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create the scene
        let scene = Scene(collisionTileMapNode: nil, zPositionContainers: [])
        // Resize fill is a good fit for glide's scenes
        // since zooming and scaling is handled by the scene's camera
        scene.scaleMode = .resizeFill
        // It's better for performance reasons to ignore sibling order
        // There is a way to manage sibling order with glide, which is called
        // zPositionContainers, be on the lookout for the upcoming tutorials for this.
        (view as? SKView)?.ignoresSiblingOrder = true
        // Present the scene
        (view as? SKView)?.presentScene(scene)
    }
}
