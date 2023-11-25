--By Rufus14
--ears: 391268255
--bamalam: 720451528
--columb: 1202637744
 
--[[music = Instance.new("Sound", game.Players.LocalPlayer.Character.Torso)
music.Volume = 10
music.SoundId = "rbxassetid://1202637744"
music.Looped = true
music:Play()]]
mouse = game.Players.LocalPlayer:GetMouse()
gun = Instance.new("Part", game.Players.LocalPlayer.Character)
gun:BreakJoints()
gun.CanCollide = false
gun.Name = "Ak-47"
gun.Orientation  = Vector3.new(0,0,0)
mesh = Instance.new("SpecialMesh", gun)
mesh.MeshId = "rbxassetid://477006495"
mesh.TextureId = "rbxassetid://477006525"
mesh.Scale = Vector3.new(0.04,0.04,0.04)
weld = Instance.new("Weld", gun)
weld.Part0 = game.Players.LocalPlayer.Character["Right Arm"]
weld.Part1 = gun
weld.C0 = weld.C0 * CFrame.Angles(-1.5,0,0) * CFrame.new(0,0,-2.5)
local rhandweld = Instance.new("Weld", game.Players.LocalPlayer.Character.Torso)
rhandweld.Part0 = game.Players.LocalPlayer.Character.Torso
rhandweld.Part1 = game.Players.LocalPlayer.Character["Right Arm"]
rhandweld.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
local lhandweld = Instance.new("Weld", game.Players.LocalPlayer.Character.Torso)
lhandweld.Part0 = game.Players.LocalPlayer.Character.Torso
lhandweld.Part1 = game.Players.LocalPlayer.Character["Left Arm"]
lhandweld.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
shot = Instance.new("Sound", gun)
shot.Volume = 10
shot.SoundId = "rbxassetid://285234709"
pump = Instance.new("Sound", gun)
pump.Volume = 10
pump.SoundId = "rbxassetid://255061173"
pump.PlaybackSpeed = 0.7
--[[function owtheedge()
    workspace.CurrentCamera.FieldOfView = 70 + music.PlaybackLoudness / 80
end
game:GetService("RunService").RenderStepped:connect(owtheedge)]]
for i = 0,0.7 , 0.01 do
    weld.C0 = weld.C0:lerp(CFrame.new(-0.342021942, -1.88848877, -0.088739872, 0.978147507, -0.0289359875, -0.205888897, 0.204753578, -0.0378959738, 0.978079677, -0.0361040607, -0.998862624, -0.0311431047),i)
    rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.917564392, 0.399175882, -0.578536987, 0.978147507, 0.204753578, -0.0361040607, -0.0289359875, -0.0378959738, -0.998862624, -0.205888897, 0.978079677, -0.0311431047),i)
    lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.472423553, 0.409558296, -1.4746933, 0.939692736, -0.342019886, -2.0985492e-06, 0.0238559935, 0.0655499771, -0.997564137, 0.341186911, 0.937403619, 0.0697560608),i)
    game:GetService("RunService").RenderStepped:wait()
end
using = false
rapid = true
debounce = false
ammo = 30
 
function plai(key)
    key = key:lower()
  --[[  if key == "e" then
        if moosic then
            runkids.SoundId = "rbxassetid://665751753"
            runkids.Volume = 8
            runkids:Play()
            runkids.Looped = true
            runkids.TimePosition = 13
        end
        if not moosic then
            runkids:Stop()
        end
    end]]
end
 
mouse.KeyDown:connect(plai)
function rapid()
    rapid = true
end
mouse.Button1Down:connect(rapid)
function notrapid()
    rapid = false
end
mouse.Button1Up:connect(notrapid)
 
function shoot()
    
    if not rapid then
        rapid = true
    end
    
        while rapid and debounce == false do
        shot:Play()
    rapid = true    
debounce = true
        for i = 1,1 do
            local missle = Instance.new("Part", workspace)
            missle:BreakJoints()
            missle.Name = "bullet"
            missle.BrickColor = BrickColor.Yellow()
            missle.CanCollide = false
            missle.Material = "Neon"
            missle.Size = Vector3.new(0.1,0.1,0.1)
            missle.CFrame = gun.CFrame * CFrame.new(0,0,2)
            missle.Transparency = 0
            local vel = Instance.new("BodyVelocity", missle)
            vel.Velocity = mouse.Hit.lookVector * math.random(500,500) + Vector3.new(math.random(-10,10),math.random(-10,10),0)
            vel.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            local function hit(part)
                local hitval = math.random(40,65)
                local humanoid = part.Parent:findFirstChildOfClass("Humanoid")
                if humanoid then
                    if humanoid.Health == math.huge or humanoid.Health >= 600 then
                        humanoid.Health = 100
                    end
                    if humanoid.MaxHealth == math.huge or humanoid.MaxHealth >= 600 then
                        humanoid.MaxHealth = 100
                    end
                    if humanoid.Parent.Name == game.Players.LocalPlayer.Name then
                        
                    else
                        if humanoid.Health < hitval then
                            humanoid.Health = 1
                            humanoid.JumpPower = 0
                            humanoid.PlatformStand = true
                            humanoid.WalkSpeed = 0
                            local findlefthip = humanoid.Parent.Torso:findFirstChild("Left Hip")
                            if findlefthip then
                                findlefthip:Remove()
                                local glue = Instance.new("Glue",  humanoid.Parent.Torso)
                                glue.Part0 = humanoid.Parent.Torso
                                glue.Part1 = humanoid.Parent["Left Leg"]
                                glue.Name = "Left leg"
                                local collider = Instance.new("Part",  humanoid.Parent["Left Leg"])
                                collider.Position = Vector3.new(0,999,0)
                                collider.Size = Vector3.new(1.5, 1, 1)
                                collider.Shape = "Cylinder"
                                local weld = Instance.new("Weld", collider)
                                weld.Part0 =  humanoid.Parent["Left Leg"]
                                weld.Part1 = collider
                                weld.C0 = CFrame.new(0,-0.2,0) * CFrame.fromEulerAnglesXYZ(0, 0, math.pi/2)
                                collider.TopSurface = "Smooth"
                                collider.BottomSurface = "Smooth"
                                collider.formFactor = "Symmetric"
                                glue.C0 = CFrame.new(-0.5, -1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
                                glue.C1 = CFrame.new(-0, 1, 0, -0, -0, -1, 0, 1, 0, 1, 0, 0)
                                collider.Transparency = 1
                            end
                            --
                            local findrighthip = humanoid.Parent.Torso:findFirstChild("Right Hip")
                            if findrighthip then
                                findrighthip:Remove()
                                local glue = Instance.new("Glue",  humanoid.Parent.Torso)
                                glue.Part0 = humanoid.Parent.Torso
                                glue.Part1 = humanoid.Parent["Right Leg"]
                                glue.Name = "Right leg"
                                local collider = Instance.new("Part",  humanoid.Parent["Right Leg"])
                                collider.Position = Vector3.new(0,999,0)
                                collider.Size = Vector3.new(1.5, 1, 1)
                                collider.Shape = "Cylinder"
                                local weld = Instance.new("Weld", collider)
                                weld.Part0 =  humanoid.Parent["Right Leg"]
                                weld.Part1 = collider
                                weld.C0 = CFrame.new(0,-0.2,0) * CFrame.fromEulerAnglesXYZ(0, 0, math.pi/2)
                                collider.TopSurface = "Smooth"
                                collider.BottomSurface = "Smooth"
                                collider.formFactor = "Symmetric"
                                glue.C0 = CFrame.new(0.5, -1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
                                glue.C1 = CFrame.new(0, 1, 0, 0, 0, 1, 0, 1, 0, -1, -0, -0)
                                collider.Transparency = 1
                            end
                            --
                            local findrightshoulder = humanoid.Parent.Torso:findFirstChild("Right Shoulder")
                            if findrightshoulder then
                                findrightshoulder:Remove()
                                local glue = Instance.new("Glue",  humanoid.Parent.Torso)
                                glue.Part0 = humanoid.Parent.Torso
                                glue.Part1 = humanoid.Parent["Right Arm"]
                                glue.Name = "Right arm"
                                local collider = Instance.new("Part",  humanoid.Parent["Right Arm"])
                                collider.Position = Vector3.new(0,999,0)
                                collider.Size = Vector3.new(1.5, 1, 1)
                                collider.Shape = "Cylinder"
                                local weld = Instance.new("Weld", collider)
                                weld.Part0 =  humanoid.Parent["Right Arm"]
                                weld.Part1 = collider
                                weld.C0 = CFrame.new(0,-0.2,0) * CFrame.fromEulerAnglesXYZ(0, 0, math.pi/2)
                                collider.TopSurface = "Smooth"
                                collider.BottomSurface = "Smooth"
                                collider.formFactor = "Symmetric"
                                glue.C0 = CFrame.new(1.5, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                                glue.C1 = CFrame.new(0, 0.5, 0, 0, 0, 1, 0, 1, 0, -1, 0, 0)
                                collider.Transparency = 1
                            end
                            --
                            local findleftshoulder = humanoid.Parent.Torso:findFirstChild("Left Shoulder")
                            if findleftshoulder then
                                findleftshoulder:Remove()
                                local glue = Instance.new("Glue",  humanoid.Parent.Torso)
                                glue.Part0 = humanoid.Parent.Torso
                                glue.Part1 = humanoid.Parent["Left Arm"]
                                glue.Name = "Left arm"
                                local collider = Instance.new("Part",  humanoid.Parent["Left Arm"])
                                collider.Position = Vector3.new(0,999,0)
                                collider.Size = Vector3.new(1.5, 1, 1)
                                collider.Shape = "Cylinder"
                                local weld = Instance.new("Weld", collider)
                                weld.Part0 =  humanoid.Parent["Left Arm"]
                                weld.Part1 = collider
                                weld.C0 = CFrame.new(0,-0.2,0) * CFrame.fromEulerAnglesXYZ(0, 0, math.pi/2)
                                collider.TopSurface = "Smooth"
                                collider.BottomSurface = "Smooth"
                                collider.formFactor = "Symmetric"
                                glue.C0 = CFrame.new(-1.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                                glue.C1 = CFrame.new(0, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0)
                                collider.Transparency = 1
                            end
                            local findhead = humanoid.Parent:findFirstChild("Head")
                            if findhead then
                                local attachment = Instance.new("Attachment", humanoid.Parent.Head)
                                attachment.Position = Vector3.new(0, -0.5, 0)
                                attachment.Name = "lol"
                                attachment.Visible = false
                                humanoid.Parent.Torso.NeckAttachment.Visible = false
                                humanoid.Parent.Torso.NeckAttachment.Position = humanoid.Parent.Torso.NeckAttachment.Position + Vector3.new(0,0,0)
                                local ball = Instance.new("BallSocketConstraint", humanoid.Parent)
                                ball.Attachment0 = humanoid.Parent.Torso.NeckAttachment
                                ball.Attachment1 = attachment
                                ball.LimitsEnabled = true
                                ball.TwistLimitsEnabled = true
                                ball.UpperAngle = 90
                                ball.Restitution = 0.5
                                ball.TwistUpperAngle = 90
                                ball.TwistLowerAngle = -90
                                local  collidepartofleftleg = Instance.new("Part", humanoid.Parent.Torso)
                                collidepartofleftleg.Name = "Bone"
                                collidepartofleftleg.Size = Vector3.new(0.7,0.7,0.7)
                                collidepartofleftleg.Transparency = 1
                                collidepartofleftleg:BreakJoints()
                                local weeld = Instance.new("Weld", collidepartofleftleg)
                                weeld.Part0 = collidepartofleftleg
                                weeld.Part1 = humanoid.Parent["Head"]
                                if humanoid.Parent.Torso:findFirstChild("Neck") then
                                    humanoid.Parent.Torso.Neck:destroy()
                                end
                            end
 
                            wait(10)
                            humanoid.Health = 0
                    else
                        humanoid.Health = humanoid.Health - hitval
                    end
                    end
                else
                    if part.Name == "Shotgun" or "bullet" then
                        
                    else
                        missle:destroy()
                    end
                end
            end
            missle.Touched:connect(hit)
        end
        for i = 0,1 , 0.5 do
            weld.C0 = weld.C0:lerp(CFrame.new(-0.342021942, -1.88848877, -0.088739872, 0.978147507, -0.0289359875, -0.205888897, 0.204753578, -0.0378959738, 0.978079677, -0.0361040607, -0.998862624, -0.0311431047),i)
            rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.917564392, 0.491810799, -0.168943405, 0.978147507, 0.204753578, -0.0361040607, 0.0289353225, -0.306021929, -0.951584637, -0.205889001, 0.929745436, -0.305259228),i)
            lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.472423553, 0.748803854, -1.02752113, 0.939693093, -0.342019022, -2.66768012e-07, -0.0711100101, -0.195373133, -0.978147566, 0.334545016, 0.919158578, -0.207911715),i)
            game:GetService("RunService").RenderStepped:wait()
        end
        --[[for i = 0,1 , 0.05 do
            weld.C0 = weld.C0:lerp(CFrame.new(-0.342021942, -1.88848877, -0.088739872, 0.978147507, -0.0289359875, -0.205888897, 0.204753578, -0.0378959738, 0.978079677, -0.0361040607, -0.998862624, -0.0311431047),i)
            rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.917564392, 0.491810799, -0.168943405, 0.978147507, 0.204753578, -0.0361040607, 0.0289353225, -0.306021929, -0.951584637, -0.205889001, 0.929745436, -0.305259228),i)
            lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.201648712, 0.903478384, -1.75520706, 0.939693093, -0.342019022, -2.66768012e-07, -0.0711100101, -0.195373133, -0.978147566, 0.334545016, 0.919158578, -0.207911715),i)
            game:GetService("RunService").RenderStepped:wait()
        end
        pump:Play()
        for i = 0,1 , 0.05 do
            weld.C0 = weld.C0:lerp(CFrame.new(-0.342021942, -1.88848877, -0.088739872, 0.978147507, -0.0289359875, -0.205888897, 0.204753578, -0.0378959738, 0.978079677, -0.0361040607, -0.998862624, -0.0311431047),i)
            rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.917564392, 0.491810799, -0.168943405, 0.978147507, 0.204753578, -0.0361040607, 0.0289353225, -0.306021929, -0.951584637, -0.205889001, 0.929745436, -0.305259228),i)
            lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.44393158, 0.765078783, -1.10408783, 0.939693093, -0.342019022, -2.66768012e-07, -0.0711100101, -0.195373133, -0.978147566, 0.334545016, 0.919158578, -0.207911715),i)
            game:GetService("RunService").RenderStepped:wait()
        end
        for i = 0,1 , 0.05 do
            weld.C0 = weld.C0:lerp(CFrame.new(-0.342021942, -1.88848877, -0.088739872, 0.978147507, -0.0289359875, -0.205888897, 0.204753578, -0.0378959738, 0.978079677, -0.0361040607, -0.998862624, -0.0311431047),i)
            rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.917564392, 0.491810799, -0.168943405, 0.978147507, 0.204753578, -0.0361040607, 0.0289353225, -0.306021929, -0.951584637, -0.205889001, 0.929745436, -0.305259228),i)
            lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.201648712, 0.903478384, -1.75520706, 0.939693093, -0.342019022, -2.66768012e-07, -0.0711100101, -0.195373133, -0.978147566, 0.334545016, 0.919158578, -0.207911715),i)
            game:GetService("RunService").RenderStepped:wait()
        end]]
        for i = 0,0.7 , 0.5 do
            weld.C0 = weld.C0:lerp(CFrame.new(-0.342021942, -1.88848877, -0.088739872, 0.978147507, -0.0289359875, -0.205888897, 0.204753578, -0.0378959738, 0.978079677, -0.0361040607, -0.998862624, -0.0311431047),i)
            rhandweld.C0 = rhandweld.C0:lerp(CFrame.new(0.917564392, 0.399175882, -0.578536987, 0.978147507, 0.204753578, -0.0361040607, -0.0289359875, -0.0378959738, -0.998862624, -0.205888897, 0.978079677, -0.0311431047),i)
            lhandweld.C0 = lhandweld.C0:lerp(CFrame.new(-0.472423553, 0.409558296, -1.4746933, 0.939692736, -0.342019886, -2.0985492e-06, 0.0238559935, 0.0655499771, -0.997564137, 0.341186911, 0.937403619, 0.0697560608),i)
            game:GetService("RunService").RenderStepped:wait()
        end
        using = false
                    wait(0.125)
        debounce = false
    end
end
mouse.Button1Down:connect(shoot)
--lotushomerun was here
--Do not leak
