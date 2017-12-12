//
//  ViewController.swift
//  ARKit初认识
//
//  Created by jinjun on 2017/12/12.
//  Copyright © 2017年 jinjun. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 存放所有 3D 几何体的容器
        let scene = SCNScene()
        //几何(想要绘制的 3D 立方体)
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        
        //渲染(可以渲染颜色或者图片)
        let material = SCNMaterial()
        //设置渲染的填充内容
        material.diffuse.contents = UIImage(named:"header")
        //渲染是一个数组,可以添加多种渲染
        box.materials = [material]
        //节点(将几何体包装为 node 以便添加到 scene)
        let boxNode = SCNNode(geometry: box)
        // 把 box 放在摄像头正前方
        boxNode.position = SCNVector3(0,0,-0.5)
        
        // rootNode 是一个特殊的 node，它是所有 node 的起始点
        scene.rootNode.addChildNode(boxNode)
        
        // 将 scene 赋给 view
        sceneView.scene = scene
        //设置默认光照
        //sceneView.autoenablesDefaultLighting = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 创建运行世界跟踪配置(世界跟踪配置跟踪设备的方向和位置。它还可以通过设备的相机检测现实世界的表面)
        let configuration = ARWorldTrackingConfiguration()
        
        // 开启运行世界跟踪
        sceneView.session.run(configuration)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 停止跟踪视图内容的运动和处理图像
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
