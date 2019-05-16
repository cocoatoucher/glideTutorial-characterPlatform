//
//  CharacterEntity.swift
//  glideTutorialCharacterPlatform
//
//  Created by glide on 2019-05-16.
//

import GlideEngine
import GameplayKit

class CharacterEntity: GlideEntity {
    
    override func setup() {
        let spriteNodeComponent = SpriteNodeComponent(nodeSize: CGSize(width: 120, height: 165))
        spriteNodeComponent.spriteNode.texture = SKTexture(imageNamed: "character_walk_0")
        addComponent(spriteNodeComponent)
    }
}
