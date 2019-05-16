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
        var kinematicsBodyConfiguration = KinematicsBodyComponent.sharedConfiguration
        // Allow character gain its custom jumping speed.
        kinematicsBodyConfiguration.maximumVerticalVelocity = 30.0
        let kinematicsBodyComponent = KinematicsBodyComponent(configuration: kinematicsBodyConfiguration)
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
        
        setupTextureAnimations()
        
        // Add a custom component for the character for managing texture animations.
        let characterComponent = CharacterComponent()
        addComponent(characterComponent)
        
        // Make the character jump.
        var jumpConfiguration = JumpComponent.sharedConfiguration
        // Set the character's jumping speed.
        jumpConfiguration.jumpingVelocity = 30.0
        let jumpComponent = JumpComponent(configuration: jumpConfiguration)
        addComponent(jumpComponent)
    }
    
    func setupTextureAnimations() {
        let timePerFrame: TimeInterval = 0.15
        let animationSize = CGSize(width: 120, height: 165)
        let animationOffset = CGPoint(x: 0, y: 15)
        
        // Idle animation
        let idleAction = TextureAnimation.Action(textureFormat: "character_walk_%d",
                                                 numberOfFrames: 1,
                                                 timePerFrame: timePerFrame)
        let idleAnimation = TextureAnimation(triggerName: "Idle",
                                             offset: animationOffset,
                                             size: animationSize,
                                             action: idleAction,
                                             loops: true)
        
        // Add an animator component to our character
        // with idle animation playing by default
        let animatorComponent = TextureAnimatorComponent(entryAnimation: idleAnimation)
        addComponent(animatorComponent)
        
        // Walk animation
        let walkAction = TextureAnimation.Action(textureFormat: "character_walk_%d",
                                                 numberOfFrames: 3,
                                                 timePerFrame: timePerFrame)
        let walkAnimation = TextureAnimation(triggerName: "Walk",
                                             offset: animationOffset,
                                             size: animationSize,
                                             action: walkAction,
                                             loops: true)
        animatorComponent.addAnimation(walkAnimation)
    }
}

// Custom component for the character entity.
// Used to control texture animator.
class CharacterComponent: GKComponent, GlideComponent {
    
    func didUpdate(deltaTime seconds: TimeInterval) {
        
        // Update texture animator every frame in respect to movement direction.
        let horizontalMovementComponent = entity?.component(ofType: HorizontalMovementComponent.self)
        let textureAnimatorComponent = entity?.component(ofType: TextureAnimatorComponent.self)
        
        if horizontalMovementComponent?.movementDirection != .stationary {
            textureAnimatorComponent?.enableAnimation(with: "Walk")
        } else {
            textureAnimatorComponent?.enableAnimation(with: "Idle")
        }
    }
}
