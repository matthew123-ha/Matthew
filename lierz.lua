 
 
local PERKY = "Quick Hands" -- CHANGE THIS NIGGA TO ANY PERK
local ABIL = "Illuminati Knife" -- THIS TOO (TO ANY ABILITY)
 
--EQUIP/UNEQUIP KNIFE/GUN A FEW TIMES FOR IT TO WORK
--iF U GOT ANY PROBLEMS DM ME FAGGOT
 
local Player = game.Players.LocalPlayer
Player.Backpack:FindFirstChild("Client").Disabled = true
local IS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local KT = Instance.new("Tool", Player.Backpack)
KT.Name = "Knife"
KT.RequiresHandle = false
KT.CanBeDropped = false
local GT = Instance.new("Tool", Player.Backpack)
GT.Name = "Gun"
GT.RequiresHandle = false
GT.CanBeDropped = false
local Spec = 0
local WeaponType
local Spectatable = {}
local SpectatingPlayer
local FPS = false
local PlayerIgnore = workspace:WaitForChild("Ignore"):WaitForChild("Players")
local runService = game:GetService("RunService")
local RS = game:GetService("RunService").RenderStepped
local Char = Player.Character
local Rig = Instance.new("Model", Char)
local Humanoid = Char:WaitForChild("Humanoid")
local Primed = false
if 0 >= Humanoid.Health then
	return
end
local Mouse = Player:GetMouse()
Mouse.TargetFilter = workspace.CurrentCamera
local Disabled = false
if Camera:findFirstChild("FpsModel") then
	Camera:findFirstChild("FpsModel"):Destroy()
end
local LA, RA, Head, T = Char:WaitForChild("Left Arm"), Char:WaitForChild("Right Arm"), Char:WaitForChild("Head"), Char:WaitForChild("Torso")
local FpsModel = Instance.new("Model", Camera)
FpsModel.Name = "FpsModel"
local FpsWeapon = Instance.new("Part")
FpsWeapon.Parent = FpsModel
FpsWeapon.CanCollide = false
FpsWeapon.Transparency = 1
FpsWeapon.Size = Vector3.new(1, 1, 1)
FpsWeapon.Name = "WeaponFPS"
local FpsLArm = Char:WaitForChild("Left Arm"):clone()
FpsLArm.Parent = FpsModel
FpsLArm.CanCollide = false
FpsLArm.Transparency = 1
local m = Instance.new("BlockMesh", FpsLArm)
m.Scale = Vector3.new(1, 1, 1)
local FpsRArm = Char:WaitForChild("Right Arm"):clone()
FpsRArm.Parent = FpsModel
FpsRArm.CanCollide = false
FpsRArm.Transparency = 1
local m = Instance.new("BlockMesh", FpsRArm)
m.Scale = Vector3.new(1, 1.1, 1)
spawn(function()
	wait(0.5)
	if Char:FindFirstChild("Body Colors") then
		FpsLArm.BrickColor = Char:FindFirstChild("Body Colors").LeftArmColor
		FpsRArm.BrickColor = Char:FindFirstChild("Body Colors").RightArmColor
	end
end)
local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local M = require(Modules:WaitForChild("AnimationCore"))
local WC = require(Modules:WaitForChild("WeaponCore"))
local AniDB = false
local Selected = false
function AniEquipKnife()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(25)), 0.1, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(-180), math.rad(0), math.rad(0)), 0.25, true)
	wait(0.1)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-75), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-55), math.rad(25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.25, true)
end
function AniChargeKnife()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-180), math.rad(0), math.rad(0)), 1, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(25), math.rad(0)), 1, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 1, true)
end
function AniChargeKnife2()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-180), math.rad(0), math.rad(0)), 0.7, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(25), math.rad(0)), 0.7, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.7, true)
end
function AniThrowKnife()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-10), math.rad(-25), math.rad(0)), 0.1, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-35), math.rad(25), math.rad(0)), 0.1, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.1, true)
	wait(0.1)
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(25), math.rad(-25), math.rad(0)), 0.2, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-35), math.rad(25), math.rad(0)), 0.2, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.2, true)
end
function AniSlashKnife1()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-125), math.rad(-30), math.rad(0)), 0.15, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-65), math.rad(30), math.rad(0)), 0.15, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15, true)
	wait(0.15)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 1, -0.25) * CFrame.Angles(math.rad(-15), math.rad(-35), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-35), math.rad(35), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.05, true)
	wait(0.05)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-75), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-55), math.rad(25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.25, true)
end
function AniSlashKnife2()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-175), math.rad(-10), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-65), math.rad(10), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(110), math.rad(180), math.rad(0)), 0.25, true)
	wait(0.25)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 1, -0.25) * CFrame.Angles(math.rad(-35), math.rad(-35), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 1, -0.25) * CFrame.Angles(math.rad(-35), math.rad(15), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(110), math.rad(180), math.rad(0)), 0.05, true)
	wait(0.05)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 1, -0.25) * CFrame.Angles(math.rad(-55), math.rad(-35), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-55), math.rad(25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(110), math.rad(180), math.rad(0)), 0.25, true)
	wait(0.25)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-75), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.25, true)
end
function AniSlashKnife3()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.7) * CFrame.Angles(math.rad(45), math.rad(-30), math.rad(0)), 0.2, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-35), math.rad(10), math.rad(0)), 0.2, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.2, true)
	wait(0.2)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 1, -0.25) * CFrame.Angles(math.rad(-60), math.rad(-35), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-45), math.rad(35), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1.5, 1) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(0)), 0.05, true)
	wait(0.05)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 1, -0.25) * CFrame.Angles(math.rad(-65), math.rad(-35), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-55), math.rad(25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1.5, 1) * CFrame.Angles(math.rad(130), math.rad(0), math.rad(0)), 0.25, true)
	wait(0.25)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-75), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.25, true)
end
function AniSlashKnife4()
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-125), math.rad(0), math.rad(0)), 0.15, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-65), math.rad(0), math.rad(0)), 0.15, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.15, true)
	wait(0.15)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 1, -0.25) * CFrame.Angles(math.rad(-15), math.rad(-45), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-35), math.rad(45), math.rad(0)), 0.05, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.05, true)
	wait(0.05)
	if WeaponType == "Gun" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-75), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(-55), math.rad(25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0, -1, 1) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0)), 0.25, true)
end
function AniEquipGun()
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(25)), 0.1, true)
	wait(0.1)
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.9, 1, -0.25) * CFrame.Angles(math.rad(-90), math.rad(75), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-25)), 0.25, true)
end
function AniShootGun()
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-120), math.rad(-25), math.rad(-8)), 0.06, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.9, 1, -0.25) * CFrame.Angles(math.rad(-110), math.rad(78), math.rad(5)), 0.06, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-25)), 0.06, true)
	wait(0.06)
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(-25), math.rad(0)), 0.15, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.9, 1, -0.25) * CFrame.Angles(math.rad(-90), math.rad(75), math.rad(0)), 0.15, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-25)), 0.15, true)
	wait(0.15)
	if WeaponType == "Knife" or not Selected then
		return
	end
end
function AniReloadGun()
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.5, 0.5, -0.25) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-25)), 0.55, true)
	wait(0.55)
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(-25), math.rad(-15)), 0.4, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.7, 1.5, -0.5) * CFrame.Angles(math.rad(-100), math.rad(55), math.rad(-25)), 0.4, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-25)), 0.4, true)
	wait(0.4)
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-95), math.rad(-30), math.rad(20)), 0.35, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.7, 1.5, -0.5) * CFrame.Angles(math.rad(-100), math.rad(60), math.rad(-25)), 0.35, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(25), math.rad(-25)), 0.35, true)
	wait(0.35)
	if WeaponType == "Knife" or not Selected then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(-25), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.9, 1, -0.25) * CFrame.Angles(math.rad(-80), math.rad(75), math.rad(0)), 0.25, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-25)), 0.25, true)
	wait(0.25)
	if WeaponType == "Knife" then
		return
	end
	M.Animate(Char:findFirstChild("MotorRight Arm", true), CFrame.new(-0.45, 0.5, -0.25) * CFrame.Angles(math.rad(-90), math.rad(-25), math.rad(0)), 0.5, true)
	M.Animate(Char:findFirstChild("MotorLeft Arm", true), CFrame.new(0.9, 1, -0.25) * CFrame.Angles(math.rad(-90), math.rad(75), math.rad(0)), 0.5, true)
	M.Animate(Char:findFirstChild("MotorWeapon", true), CFrame.new(0.5, -1.75, -0.35) * CFrame.Angles(math.rad(180), math.rad(0), math.rad(-25)), 0.5, true)
end
local FpsPart = Instance.new("Part")
FpsPart.Transparency = 1
FpsPart.Anchored = true
FpsPart.Parent = FpsModel
FpsPart.CanCollide = false
FpsPart.FormFactor = "Custom"
FpsPart.Size = Vector3.new(0.2, 0.2, 0.2)
local FpsWeaponWeld = Instance.new("Motor")
FpsWeaponWeld.Parent = FpsPart
FpsWeaponWeld.Part1 = FpsWeapon
FpsWeaponWeld.Part0 = FpsRArm
FpsWeaponWeld.C1 = CFrame.new(0, 2, 1)
FpsWeaponWeld.C0 = CFrame.new()
local FpsLArmWeld = Instance.new("Motor")
FpsLArmWeld.Parent = FpsLArm
FpsLArmWeld.Part1 = FpsLArm
FpsLArmWeld.Part0 = FpsPart
FpsLArmWeld.C1 = CFrame.new(0.5, 0, 0)
FpsLArmWeld.C0 = CFrame.new(-1, 0.75, 0)
local FpsRArmWeld = Instance.new("Motor")
FpsRArmWeld.Parent = FpsRArm
FpsRArmWeld.Part1 = FpsRArm
FpsRArmWeld.Part0 = FpsPart
FpsRArmWeld.C1 = CFrame.new(-0.5, 0, 0)
FpsRArmWeld.C0 = CFrame.new(1, 0.75, 0)
local energy = 100
local maxEnergy = 100
local move_anim_speed = 5
local last_p = Vector3.new()
local move_amm = 0
local walking = false
local running = false
local walkingStop = true
local aniRun = false
local aniLegs = false
local idle = true
local WalkSpeed = Humanoid.WalkSpeed
Humanoid.WalkSpeed = WalkSpeed
local DB = false
local Charging = false
local Speed = 0.35
local shake_freq = 5
local CanMelee = true
local CanReload = true
local Shooting = false
local Aimed = false
local Zoomed = false
local RunSpeed = 20
Camera.CameraType = "Custom"
Camera.CameraSubject = Humanoid
coroutine.resume(coroutine.create(function()
	while FpsModel ~= nil do
		local delta = wait()
		local cur_p = T.Position
		if (cur_p - last_p).magnitude >= 0.1 then
			move_amm = math.min(1, move_amm + delta * move_anim_speed)
			walking = true
			if running then
				if energy <= 0 then
					aniRun = false
					running = false
					shake_freq = 5
					Humanoid.WalkSpeed = WalkSpeed
				end
			elseif energy < maxEnergy then
				energy = energy + 0.2
			end
		else
			move_amm = math.max(0, move_amm - delta * move_anim_speed)
			walking = false
			if energy < maxEnergy then
				energy = energy + 0.2
			end
		end
		last_p = cur_p
	end
end))
local RightArmWeld, LeftArmWeld, WeaponWeld
local Cloaked = false
local UserInputService = game:GetService("UserInputService")
local Mobile = UserInputService.TouchEnabled
if UserInputService.KeyboardEnabled then
	Mobile = false
end
runService.RenderStepped:connect(function()
	local last_time = tick()
	local delta = tick() - last_time
	last_time = tick()
	local breathe_amp = 1.5
	local breathe_freq = 1
	local breathe = math.sin(math.rad(tick() * 90 * breathe_freq)) * breathe_amp
	local shake_amp = {0.075, 0.075}
	local arm_shake = CFrame.new(math.cos(math.rad(tick() * 90 * shake_freq)) * move_amm * shake_amp[1], math.abs(math.cos(math.rad(tick() * 90 * shake_freq)) * move_amm * shake_amp[2]), 0)
	if (Head.Position - Camera.CoordinateFrame.p).magnitude < 2.5 and Selected then
		if Cloaked then
			FpsLArm.Transparency = 0.5
			FpsRArm.Transparency = 0.5
			FpsWeapon.Transparency = 0.5
		else
			FpsLArm.Transparency = 0
			FpsRArm.Transparency = 0
			FpsWeapon.Transparency = 0
		end
		FPS = true
	else
		FpsLArm.Transparency = 1
		FpsRArm.Transparency = 1
		FpsWeapon.Transparency = 1
		FPS = false
	end
	if FpsModel ~= nil and Char ~= nil and 0 < Humanoid.Health then
		if WeaponType == "Gun" then
			FpsPart.CFrame = Camera.CoordinateFrame * CFrame.new(0.7, -2, -0.4) * CFrame.Angles(math.rad(0 + breathe / 2), math.rad(0), math.rad(0)) * arm_shake
		elseif WeaponType == "Knife" then
			FpsPart.CFrame = Camera.CoordinateFrame * CFrame.new(0, -1.6, -0.4) * CFrame.Angles(math.rad(0 + breathe / 2), math.rad(0), math.rad(0)) * arm_shake
		end
		if RightArmWeld ~= nil and LeftArmWeld ~= nil and WeaponWeld ~= nil then
			if WeaponType == "Gun" then
				FpsLArmWeld.C1 = LeftArmWeld.C1 * CFrame.new(0.15, 0.09, -0.43) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(-5))
				FpsRArmWeld.C1 = RightArmWeld.C1
				FpsWeaponWeld.C1 = WeaponWeld.C1 * CFrame.new(0.1, -0.2, 0.25)
			elseif WeaponType == "Knife" then
				FpsLArmWeld.C1 = LeftArmWeld.C1 * CFrame.new(0.15, 0.09, -0.43)
				FpsRArmWeld.C1 = RightArmWeld.C1 * CFrame.Angles(math.rad(0), math.rad(25), math.rad(0))
				FpsWeaponWeld.C1 = WeaponWeld.C1 * CFrame.new(0, 0.15, 0.25)
			end
		end
	end
end)
local debouncetime = 1
local lastjump = time()
local WeaponMesh
local used = false
local Perk = PERKY
Humanoid.Changed:connect(function(prop)
	if Perk == "Kevlar" and (Humanoid.Health == 98 or Humanoid.Health == 1398) and not used then
		Player.PlayerGui.Sounds.KevlarHurt:Play()
		used = true
	end
end)
local GunSkin = "http://www.roblox.com/asset/?id=79401500"
local KnifeSkin = "http://www.roblox.com/asset/?id=130252453"
local Charged = false
local MouseDown = false
local DB2 = false
local Ability = ABIL
local Gamemode
local CanCloak = true
local Knife = false
local Gun = false
local ThrowGui = Player.PlayerGui.GUI.ThrowKnife
local CloakGui = Player.PlayerGui.GUI.CloakGui
local Crosshair = Player.PlayerGui.GUI.MobileCrosshair
local Gui = Player.PlayerGui.GUI
game.Players.LocalPlayer.Backpack.ChildAdded:connect(function(c)
	if c.Name == "Gun" and not Gun then
		spawn(function()
			Gamemode = game.ReplicatedStorage.RemoteFunction:InvokeServer("Gamemode")
			Perk = game.ReplicatedStorage.RemoteFunction:InvokeServer("Perk")
		end)
		local Skin = game.ReplicatedStorage.RemoteFunction:InvokeServer("Skin", "Gun")
		if Skin ~= nil then
			GunSkin = Skin
		end
		if game.Players.LocalPlayer.Backpack:findFirstChild("Gun") ~= nil then
			Gun = true
			if Mobile then
			else
				GT.Activated:connect(function()
					if Gamemode == "One In The Chamber" and Char.Bullet.Value == false then
						return
					end
					if not DB then
						DB = true
						WC.ShootGun(Char, Char, Mouse.Hit.p, FPS, FpsWeapon)
						AniShootGun()
						wait(0.21)
						AniReloadGun()
						if not Selected then
							wait(1.55)
						end
						wait(0.5)
						DB = false
					end
				end)
			end
			GT.Equipped:connect(function()
				Selected = true
				WeaponType = "Gun"
				Mouse.Icon = "http://www.roblox.com/asset/?id=117431027"
				WC.EquipGun(Char, Char, GunSkin)
				RightArmWeld = Char:WaitForChild("MotorRight Arm")
				LeftArmWeld = Char:WaitForChild("MotorLeft Arm")
				WeaponWeld = Char:WaitForChild("MotorWeapon")
				WeaponMesh = Char:WaitForChild("Weapon"):findFirstChild("Mesh"):clone()
				WeaponMesh.Parent = FpsWeapon
				AniEquipGun()
			end)
			GT.Unequipped:connect(function()
				Selected = false
				Mouse.Icon = "rbxasset://textures\\ArrowCursor.png"
				if WeaponMesh ~= nil then
					WeaponMesh:Destroy()
				end
				WeaponType = nil
				WC.Unequip(Char, Char)
			end)
		end
	elseif c.Name == "Knife" and not Knife then
		spawn(function()
			Ability = ABIL
			Perk = PERKY
			if Ability == nil then
				Ability = ABIL
			end
			Gamemode = game.ReplicatedStorage.RemoteFunction:InvokeServer("Gamemode")
		end)
		local Skin = game.ReplicatedStorage.RemoteFunction:InvokeServer("Skin", "Knife")
		if Skin ~= nil then
			KnifeSkin = Skin
		end
		if game.Players.LocalPlayer.Backpack:findFirstChild("Knife") ~= nil then
			Knife = true
			KT.Activated:connect(function()
				MouseDown = true
				spawn(function()
					if Cloaked then
						WC.UnCloak(Char, Char)
						Cloaked = false
					end
				end)
				if Gamemode == "Infected" or Gamemode == "One In The Chamber" then
					return
				end
				if not DB2 and not DB then
					DB2 = true
					spawn(function()
						wait(0.35)
						if MouseDown and not DB then
							DB2 = true
							if Perk ~= "Quick Hands" then
								AniChargeKnife()
								wait(1)
							else
								AniChargeKnife2()
								wait(0.7)
							end
							if MouseDown and not DB then
								Charged = true
							end
							wait(0.5)
							DB2 = false
						else
							DB2 = false
						end
					end)
				end
			end)
			KT.Deactivated:connect(function()
				MouseDown = false
				if Charged then
					DB = true
					DB2 = true
					Charged = false
					spawn(function()
						WC.ThrowKnife(Char, Char, Mouse.Hit.p, Ability)
					end)
					AniThrowKnife()
					wait(0.3)
					AniEquipKnife()
					DB = false
					DB2 = false
				elseif not DB then
					DB = true
					do
						local Ran = math.random(1, 3)
						spawn(function()
							WC.StabKnife(Char, Char, Ran, Ability)
						end)
						if Ran == 1 then
							AniSlashKnife1()
						elseif Ran == 2 then
							AniSlashKnife2()
						elseif Ran == 3 then
							AniSlashKnife3()
						elseif Ran == 4 then
							AniSlashKnife4()
						end
						wait(0.25)
						DB = false
					end
				end
			end)
			KT.Equipped:connect(function()
				Selected = true
				WeaponType = "Knife"
				Mouse.Icon = "http://www.roblox.com/asset/?id=117431027"
				WC.EquipKnife(Char, Char, KnifeSkin)
				RightArmWeld = Char:WaitForChild("MotorRight Arm")
				LeftArmWeld = Char:WaitForChild("MotorLeft Arm")
				WeaponWeld = Char:WaitForChild("MotorWeapon")
				WeaponMesh = Char:WaitForChild("Weapon"):findFirstChild("Mesh"):clone()
				WeaponMesh.Parent = FpsWeapon
				AniEquipKnife()
				if Char then
					if workspace.GameInProgress.Mode.Value ~= "Infected" then
						Char.Humanoid.WalkSpeed = 20
						if workspace.GameInProgress.Mode.Value == "Cold Killer" then
							Char.Humanoid.WalkSpeed = 20
						elseif Perk == "Speedy Gonzales" then
							Char.Humanoid.WalkSpeed = 25
						else
							Char.Humanoid.WalkSpeed = 20
						end
					else
						Char.Humanoid.WalkSpeed = 13
					end
				end
			end)
			KT.Unequipped:connect(function()
				if Mobile then
					ThrowGui.Visible = false
					if Perk == "Shadow Cloak" then
						CloakGui.Visible = false
					end
				end
				Charged = false
				MouseDown = false
				Selected = false
				Mouse.Icon = "rbxasset://textures\\ArrowCursor.png"
				if WeaponMesh ~= nil then
					WeaponMesh:Destroy()
				end
				WeaponType = nil
				WC.Unequip(Char, Char)
				if workspace.GameInProgress.Mode.Value ~= "Infected" then
					Char.Humanoid.WalkSpeed = 16
				else
					Char.Humanoid.WalkSpeed = 13
				end
				if Cloaked then
					WC.UnCloak(Char, Char)
					Cloaked = false
				end
			end)
		end
	end
end)
local DB3 = false
IS.InputBegan:connect(function(input, chatting)
	if input.UserInputType == Enum.UserInputType.Gamepad1 and input.UserInputState == Enum.UserInputState.Begin and not chatting and Selected and input.KeyCode == Enum.KeyCode.ButtonX and WeaponType == "Knife" and CanCloak and Perk == "Shadow Cloak" then
		if Gamemode == "Infected" or Gamemode == "One In The Chamber" then
			return
		end
		CanCloak = false
		WC.Cloak(Char, Char)
		Cloaked = true
		wait(10)
		if Cloaked then
			WC.UnCloak(Char, Char)
			Cloaked = false
		end
		wait(15)
		CanCloak = true
	end
	if input.UserInputType == Enum.UserInputType.Keyboard and input.UserInputState == Enum.UserInputState.Begin and not chatting and Selected then
		if input.KeyCode == Enum.KeyCode.E and WeaponType == "Knife" and not DB3 then
			if Gamemode == "Infected" or Gamemode == "One In The Chamber" then
				return
			end
			DB3 = true
			spawn(function()
				if Cloaked then
					WC.UnCloak(Char, Char)
					Cloaked = false
				end
			end)
			if not DB2 and not DB then
				DB2 = true
				if not DB then
					DB2 = true
					DB = true
					if Perk ~= "Quick Hands" then
						AniChargeKnife()
						wait(1)
					else
						AniChargeKnife2()
						wait(0.7)
					end
					if not Selected or WeaponType ~= "Knife" then
						DB2 = false
						DB = false
						return
					end
					spawn(function()
						WC.ThrowKnife(Char, Char, Mouse.Hit.p, Ability)
					end)
					AniThrowKnife()
					wait(0.3)
					AniEquipKnife()
					DB = false
					DB2 = false
				else
					DB2 = false
				end
			end
			wait(0.25)
			DB3 = false
		elseif input.KeyCode == Enum.KeyCode.Q and WeaponType == "Knife" and CanCloak and Perk == "Shadow Cloak" then
			if Gamemode == "Infected" or Gamemode == "One In The Chamber" then
				return
			end
			CanCloak = false
			WC.Cloak(Char, Char)
			Cloaked = true
			wait(10)
			if Cloaked then
				WC.UnCloak(Char, Char)
				Cloaked = false
			end
			wait(15)
			CanCloak = true
		end
	end
end)
game.Players.ChildAdded:connect(function(c)
	wait(3)
	repeat
		wait()
	until not DB and not DB2 and not MouseDown
	if WeaponType == "Gun" then
		WC.EquipGun(Char, Char, GunSkin)
		AniEquipGun()
	elseif WeaponType == "Knife" then
		WC.EquipKnife(Char, Char, KnifeSkin)
		AniEquipKnife()
	end
end)
