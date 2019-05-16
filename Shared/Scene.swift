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
    }
}
