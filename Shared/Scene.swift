//
//  Scene.swift
//  glideTutorialCharacterPlatform
//
//  Created by glide on 2019-05-16.
//

import GlideEngine
import SpriteKit

class Scene: GlideScene {
    
    override func setupScene() {
        // Since we don't have pause/resume buttons in this tutorial
        // we don't want our scene to be paused automatically.
        shouldPauseWhenAppIsInBackground = false
        
        backgroundColor = .brown
        
        // Add a platform entity in our scene.
        // Position in roughly in the middle of macOS app window.
        // Keep in mind that x:0, y:0 is the bottom left corner of the scene in SpriteKit.
        addEntity(platformEntity(at: CGPoint(x: 512, y: 150)))
    }
    
    func platformEntity(at position: CGPoint) -> GlideEntity {
        // Create a generic glide entity.
        let entity = GlideEntity(initialNodePosition: position)
        
        // Create a sprite node for our entity to display a texture.
        let spriteNodeComponent = SpriteNodeComponent(nodeSize: CGSize(width: 640, height: 64))
        spriteNodeComponent.spriteNode.texture = SKTexture(imageNamed: "platform")
        entity.addComponent(spriteNodeComponent)
        
        return entity
    }
}
