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
        
        // Make character be affected by physics forces, in this case gravity.
        let kinematicsBodyComponent = KinematicsBodyComponent()
        addComponent(kinematicsBodyComponent)
        
        // Add a collider to the character.
        let colliderComponent = ColliderComponent(categoryMask: GlideCategoryMask.none,
                                                  size: CGSize(width: 100, height: 135),
                                                  offset: .zero,
                                                  leftHitPointsOffsets: (10, 10),
                                                  rightHitPointsOffsets: (10, 10),
                                                  topHitPointsOffsets: (10, 10),
                                                  bottomHitPointsOffsets: (10, 10))
        addComponent(colliderComponent)
        
        // Make character snapper.
        let snapperComponent = SnapperComponent()
        addComponent(snapperComponent)
        
        // Make character be able to move horizontally.
        var config = HorizontalMovementComponent.sharedConfiguration
        // Set character's fixed velocity to 30.0.
        config.fixedVelocity = 30.0
        let horizontalMovementComponent = HorizontalMovementComponent(movementStyle: .fixedVelocity, configuration: config)
        addComponent(horizontalMovementComponent)
        
        // Make character controllable via input handling.
        // `playerIndex` parameter is actually the mapping to input handling.
        let playableCharacterComponent = PlayableCharacterComponent(playerIndex: 0)
        addComponent(playableCharacterComponent)
    }
}
