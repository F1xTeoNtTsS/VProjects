//
//  GameScene.swift
//  testGame
//
//  Created by F1xTeoNtTsS on 22.05.2022.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var spaceShip: SKSpriteNode = {
        let spaceShip = SKSpriteNode(imageNamed: "ship")
        spaceShip.position = CGPoint(x: 0, y: -300)
        spaceShip.physicsBody = SKPhysicsBody(texture: spaceShip.texture!, size: spaceShip.size)
        spaceShip.physicsBody?.isDynamic = false
        return spaceShip
    }()
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        let background = SKSpriteNode(imageNamed: "space")
        background.size = UIScreen.main.bounds.size
        addChild(background)
        addChild(spaceShip)
        
        let asteroidRunAction = createAsteroidAction()
        run(asteroidRunAction)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let positiom = touch.location(in: self)
            
            let distance = setDistance(a: spaceShip.position, b: positiom)
            let speed: CGFloat = 600
            let time = findTimeForTransition(distance: distance, speed: speed)
            let move = SKAction.move(to: positiom, duration: time)
            spaceShip.run(move)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {

    }
    
    func createAsteroid() -> SKSpriteNode? {
        let asteroid = SKSpriteNode(imageNamed: "asteroid")
        
        let randomScale = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: 3))
        asteroid.xScale = randomScale
        asteroid.yScale = randomScale
        
        asteroid.position.x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound: 40))
        asteroid.position.y = self.frame.size.height + asteroid.size.height

        guard let asteroidTexture = asteroid.texture else { return nil}
        asteroid.physicsBody = SKPhysicsBody(texture: asteroidTexture, size: asteroid.size)
        return asteroid
    }
    
    func createAsteroidAction() -> SKAction {
        let asteroidCreation = SKAction.run {
            guard let asteroid = self.createAsteroid() else { return }
            self.addChild(asteroid)
        }
        let asteroidPerSeond: Double = 2
        let asteroidCreationDelay = SKAction.wait(forDuration: 1/asteroidPerSeond, withRange: 0.5)
        let asteroidCreationSequance = SKAction.sequence([asteroidCreation, asteroidCreationDelay])
        let asteroidRunAction = SKAction.repeatForever(asteroidCreationSequance)
        
        return asteroidRunAction
    }
    
    func setDistance(a: CGPoint, b: CGPoint) -> CGFloat {
        sqrt((b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y))
    }
    
    func findTimeForTransition(distance: CGFloat, speed: CGFloat) -> TimeInterval {
        let time = distance/speed
        return TimeInterval(time)
    }
}
