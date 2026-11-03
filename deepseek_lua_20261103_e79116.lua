local P=game:GetService("Players")local R=game:GetService("RunService")local U=game:GetService("UserInputService")local T=game:GetService("TweenService")local L=P.LocalPlayer local G=L:WaitForChild("PlayerGui")
local C={Fly=false,FlySpeed=80,Speed=false,SpeedValue=50,Jump=false,JumpValue=100,Noclip=false,InfJump=false,BHop=false,AntiVoid=false,Gravity=196,ESP=false,BoxESP=false,Tracer=false,Hitbox=false,HitboxMult=2,HitboxView=false,Aim=false,Silent=false,AimPart="Head",AimFOV=200,AimSmooth=4,AntiFling=false,Fullbright=false,FOV=70,Crosshair=false,Rainbow=false,Aura=false,Invis=false,Trail=false,TrailRainbow=false,TrailGlow=false,Particles=false,Orbit=false,SelfHigh=false,Ring=false,Halo=false,Wings=false,AuraS=false,Lightning=false,Fire=false,AntiAFK=false}
local FLM="ALL"local V50000=80000 local V500000=500000
local K={}local ED={}local HV={}local BX={}local TR={}local AL=nil local OL=nil local OGrav=workspace.Gravity local trailCol=Color3.fromRGB(255,45,65)local trailHue=0
local function D(n)if K[n]then if type(K[n])=="table"then for _,c in ipairs(K[n])do pcall(function()c:Disconnect()end)end else pcall(function()K[n]:Disconnect()end)end K[n]=nil end end
local function GC()local c=L.Character return c,c and c:FindFirstChild("Humanoid"),c and c:FindFirstChild("HumanoidRootPart")end
local function sD(i)if i and i.Parent then i:Destroy()end end
local function SF()D("Fly")local _,h,r=GC()if r then local b=r:FindFirstChild("RFV")if b then b:Destroy()end local g=r:FindFirstChild("RFG")if g then g:Destroy()end end if h then h.PlatformStand=false end end
local function STF()SF()K.Fly=R.RenderStepped:Connect(function()if not C.Fly then return end local _,h,r=GC()if not h or not r then return end h.PlatformStand=true local b=r:FindFirstChild("RFV")if not b then b=Instance.new("BodyVelocity")b.Name="RFV"b.MaxForce=Vector3.new(1e6,1e6,1e6)b.Parent=r end local g=r:FindFirstChild("RFG")if not g then g=Instance.new("BodyGyro")g.Name="RFG"g.MaxTorque=Vector3.new(1e6,1e6,1e6)g.D=50 g.P=3000 g.Parent=r end local cm=workspace.CurrentCamera if not cm then return end local f,s,v=0,0,0 if U:IsKeyDown(Enum.KeyCode.W)then f=f+1 end if U:IsKeyDown(Enum.KeyCode.S)then f=f-1 end if U:IsKeyDown(Enum.KeyCode.D)then s=s+1 end if U:IsKeyDown(Enum.KeyCode.A)then s=s-1 end if U:IsKeyDown(Enum.KeyCode.Space)then v=v+1 end if U:IsKeyDown(Enum.KeyCode.LeftControl)then v=v-1 end if f==0 and s==0 then local m=h.MoveDirection if m.Magnitude>0.1 then local ll=Vector3.new(cm.CFrame.LookVector.X,0,cm.CFrame.LookVector.Z)if ll.Magnitude>0.1 then ll=ll.Unit else ll=Vector3.new(0,0,-1)end local rr=Vector3.new(cm.CFrame.RightVector.X,0,cm.CFrame.RightVector.Z)if rr.Magnitude>0.1 then rr=rr.Unit else rr=Vector3.new(1,0,0)end f=m:Dot(ll)s=m:Dot(rr)end end local dr=cm.CFrame.LookVector*f+cm.CFrame.RightVector*s+Vector3.new(0,v,0)if dr.Magnitude>0 then dr=dr.Unit*C.FlySpeed end b.Velocity=dr g.CFrame=cm.CFrame end)end
local function AS()D("Speed")if not C.Speed then local _,h=GC()if h then h.WalkSpeed=16 end return end K.Speed=R.Heartbeat:Connect(function()if not C.Speed then return end local _,h=GC()if h then h.WalkSpeed=C.SpeedValue end end)end
local function AJ()D("Jump")if not C.Jump then local _,h=GC()if h then h.UseJumpPower=true h.JumpPower=50 end return end K.Jump=R.Heartbeat:Connect(function()if not C.Jump then return end local _,h=GC()if h then h.UseJumpPower=true h.JumpPower=C.JumpValue end end)end
local function AIJ()D("InfJump")if not C.InfJump then return end K.InfJump=U.JumpRequest:Connect(function()if not C.InfJump then return end local _,h=GC()if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end end)end
local function ABH()D("BHop")if not C.BHop then return end K.BHop=R.Heartbeat:Connect(function()if not C.BHop then return end local _,h=GC()if h then local st=h:GetState()if st==Enum.HumanoidStateType.Landed or st==Enum.HumanoidStateType.Running then h:ChangeState(Enum.HumanoidStateType.Jumping)end end end)end
local function AAV()D("AntiVoid")if not C.AntiVoid then return end K.AntiVoid=R.Heartbeat:Connect(function()if not C.AntiVoid then return end local _,_,r=GC()if r and r.Position.Y<-50 then r.CFrame=CFrame.new(r.Position.X,50,r.Position.Z)end end)end
local function AGr()workspace.Gravity=C.Gravity end
local function AN()D("Noclip")local c=L.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=true end end end if not C.Noclip then return end local cn={}local function cc()if not C.Noclip then return end local ch=L.Character if not ch then return end for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then if p.CanCollide then p.CanCollide=false end end end end table.insert(cn,R.Stepped:Connect(cc))K.Noclip=cn end
local function CE(p)if p==L then return nil end local ch=p.Character if not ch then return nil end local hr=ch:FindFirstChild("HumanoidRootPart")if not hr then return nil end local hl=Instance.new("Highlight")hl.Adornee=ch hl.FillColor=Color3.fromRGB(255,40,60)hl.OutlineColor=Color3.fromRGB(255,120,140)hl.FillTransparency=0.5 hl.OutlineTransparency=0 hl.Parent=ch local bb=Instance.new("BillboardGui")bb.Name="RE"bb.Adornee=hr bb.Size=UDim2.new(0,200,0,50)bb.StudsOffset=Vector3.new(0,3.5,0)bb.AlwaysOnTop=true bb.Parent=ch local nl=Instance.new("TextLabel")nl.Size=UDim2.new(1,0,0,15)nl.BackgroundTransparency=1 nl.Text=p.Name nl.TextColor3=Color3.fromRGB(255,90,110)nl.TextStrokeTransparency=0 nl.Font=Enum.Font.GothamBold nl.TextSize=12 nl.Parent=bb local hb=Instance.new("Frame")hb.Size=UDim2.new(0.75,0,0,6)hb.Position=UDim2.new(0.125,0,0,17)hb.BackgroundColor3=Color3.fromRGB(20,20,25)hb.BorderSizePixel=0 hb.Parent=bb local hc=Instance.new("UICorner")hc.CornerRadius=UDim.new(0,3)hc.Parent=hb local hf=Instance.new("Frame")hf.Size=UDim2.new(1,0,1,0)hf.BackgroundColor3=Color3.fromRGB(50,220,80)hf.BorderSizePixel=0 hf.Parent=hb local hfc=Instance.new("UICorner")hfc.CornerRadius=UDim.new(0,3)hfc.Parent=hf local il=Instance.new("TextLabel")il.Size=UDim2.new(1,0,0,13)il.Position=UDim2.new(0,0,0,25)il.BackgroundTransparency=1 il.Text="100/100 | 0m"il.TextColor3=Color3.fromRGB(255,255,255)il.TextStrokeTransparency=0 il.Font=Enum.Font.GothamBold il.TextSize=10 il.Parent=bb return{Highlight=hl,Billboard=bb,HpFill=hf,Info=il}end
local function UE(p,d)if not d or not d.Billboard or not d.Billboard.Parent then return end local ch=p.Character if not ch then return end local hr=ch:FindFirstChild("HumanoidRootPart")local h=ch:FindFirstChildOfClass("Humanoid")if not hr or not h then return end local hp=math.max(h.Health,0)local mx=math.max(h.MaxHealth,1)local rt=math.clamp(hp/mx,0,1)d.HpFill.Size=UDim2.new(rt,0,1,0)d.HpFill.BackgroundColor3=rt>0.6 and Color3.fromRGB(50,220,80)or rt>0.3 and Color3.fromRGB(255,200,50)or Color3.fromRGB(255,60,60)local mh=L.Character and L.Character:FindFirstChild("HumanoidRootPart")local ds=mh and math.floor((hr.Position-mh.Position).Magnitude)or 0 d.Info.Text=string.format("%d/%d | %dm",math.floor(hp),math.floor(mx),ds)end
local function AE()D("ESP")for _,d in pairs(ED)do if d.Highlight then d.Highlight:Destroy()end if d.Billboard then d.Billboard:Destroy()end end ED={}if not C.ESP then return end for _,p in ipairs(P:GetPlayers())do if p~=L then ED[p]=CE(p)end end local tk=0 K.ESP=R.Heartbeat:Connect(function()if not C.ESP then return end tk=tk+1 for _,p in ipairs(P:GetPlayers())do if p~=L then local d=ED[p]if not d then d=CE(p)if d then ED[p]=d end end if d then UE(p,d)end end end if tk%30==0 then for p,d in pairs(ED)do if not p.Parent or not d.Billboard or not d.Billboard.Parent then if d.Highlight then d.Highlight:Destroy()end if d.Billboard then d.Billboard:Destroy()end ED[p]=nil end end end end)end
local function ABE()D("BoxESP")for _,d in pairs(BX)do if d then d:Destroy()end end BX={}if not C.BoxESP then return end K.BoxESP=R.Heartbeat:Connect(function()if not C.BoxESP then return end for _,p in ipairs(P:GetPlayers())do if p~=L then local ch=p.Character local hr=ch and ch:FindFirstChild("HumanoidRootPart")if hr then if not BX[p]or not BX[p].Parent then local bx=Instance.new("BoxHandleAdornment")bx.Name="RBXBox"bx.Adornee=hr bx.Size=Vector3.new(4,5,2)bx.Color3=Color3.fromRGB(255,50,50)bx.Transparency=0.65 bx.AlwaysOnTop=true bx.ZIndex=5 bx.Parent=hr BX[p]=bx end end end end end)end
local function ATR()D("Tracer")if TR.Gui then TR.Gui:Destroy()end TR={}if not C.Tracer then return end TR.Gui=Instance.new("ScreenGui")TR.Gui.Name="RazeTracer"TR.Gui.ResetOnSpawn=false TR.Gui.IgnoreGuiInset=true TR.Gui.Parent=G TR.Lines={}K.Tracer=R.Heartbeat:Connect(function()if not C.Tracer then return end local cm=workspace.CurrentCamera if not cm then return end local vps=cm.ViewportSize local startPos=Vector2.new(vps.X/2,vps.Y)for _,p in ipairs(P:GetPlayers())do if p~=L and p.Character then local hr=p.Character:FindFirstChild("HumanoidRootPart")if hr then local endPos,on=cm:WorldToViewportPoint(hr.Position)if on and endPos.Z>0 then local line=TR.Lines[p]if not line or not line.Parent then line=Instance.new("Frame")line.BackgroundColor3=Color3.fromRGB(255,50,50)line.BorderSizePixel=0 line.AnchorPoint=Vector2.new(0.5,0.5)line.Parent=TR.Gui TR.Lines[p]=line end local delta=Vector2.new(endPos.X,endPos.Y)-startPos local mid=(startPos+Vector2.new(endPos.X,endPos.Y))/2 local dist=delta.Magnitude line.Size=UDim2.new(0,dist,0,1)line.Position=UDim2.new(0,mid.X,0,mid.Y)line.Rotation=math.deg(math.atan2(delta.Y,delta.X))end end end end end)end
local function AH2()D("Hitbox")for _,p in ipairs(P:GetPlayers())do local c=p.Character if c then local hr=c:FindFirstChild("HumanoidRootPart")if hr then local hb=hr:FindFirstChild("RazeHB")if hb then hb:Destroy()end end end end if not C.Hitbox then return end K.Hitbox=R.Heartbeat:Connect(function()if not C.Hitbox then return end for _,p in ipairs(P:GetPlayers())do if p~=L then local c=p.Character local hr=c and c:FindFirstChild("HumanoidRootPart")if hr then local hb=hr:FindFirstChild("RazeHB")if not hb then hb=Instance.new("Part")hb.Name="RazeHB"hb.Transparency=1 hb.CanCollide=false hb.CanQuery=true hb.CanTouch=true hb.Massless=true hb.Size=hr.Size*C.HitboxMult hb.CFrame=hr.CFrame hb.Parent=hr local w=Instance.new("WeldConstraint")w.Part0=hr w.Part1=hb w.Parent=hb else hb.Size=hr.Size*C.HitboxMult end end end end end)end
local function CHV()for _,d in pairs(HV)do if d.Box then d.Box:Destroy()end if d.Label then d.Label:Destroy()end end HV={}end
local function AHV()D("HitboxView")CHV()if not C.HitboxView then return end K.HitboxView=R.Heartbeat:Connect(function()if not C.HitboxView then return end for _,p in ipairs(P:GetPlayers())do if p~=L then local c=p.Character local hr=c and c:FindFirstChild("HumanoidRootPart")if hr then local hb=hr:FindFirstChild("RazeHB")or hr local d=HV[p]if not d or not d.Box or not d.Box.Parent then if d then if d.Box then d.Box:Destroy()end if d.Label then d.Label:Destroy()end end local bx=Instance.new("BoxHandleAdornment")bx.Name="RHB"bx.Adornee=hb bx.AlwaysOnTop=true bx.ZIndex=6 bx.Size=hb.Size bx.Color3=Color3.fromRGB(255,50,50)bx.Transparency=0.55 bx.Parent=hb local lg=Instance.new("BillboardGui")lg.Name="RHL"lg.Adornee=hb lg.Size=UDim2.new(0,180,0,20)lg.StudsOffset=Vector3.new(0,(hb.Size.Y/2)+1.2,0)lg.AlwaysOnTop=true lg.Parent=hb local lb=Instance.new("TextLabel")lb.Size=UDim2.new(1,0,1,0)lb.BackgroundTransparency=1 lb.TextColor3=Color3.fromRGB(255,150,150)lb.TextStrokeTransparency=0 lb.Font=Enum.Font.GothamBold lb.TextSize=11 lb.Parent=lg HV[p]={Box=bx,Label=lg}else if d.Box.Adornee~=hb then d.Box.Adornee=hb end d.Box.Size=hb.Size if d.Label.Adornee~=hb then d.Label.Adornee=hb end d.Label.StudsOffset=Vector3.new(0,(hb.Size.Y/2)+1.2,0)local tx2=d.Label:FindFirstChildOfClass("TextLabel")if tx2 then local s=hb.Size tx2.Text=string.format("%.1f × %.1f × %.1f",s.X,s.Y,s.Z)end end else local d=HV[p]if d then if d.Box then d.Box:Destroy()end if d.Label then d.Label:Destroy()end HV[p]=nil end end end end end)end
local fN=nil
local function eN()if fN then return end fN=R.Stepped:Connect(function()local c=L.Character if not c then return end for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end)end
local function dN()if fN then fN:Disconnect()fN=nil end end
local function tP(t)local r1=L.Character and L.Character:FindFirstChild("HumanoidRootPart")local r2=t.Character and t.Character:FindFirstChild("HumanoidRootPart")if r1 and r2 then r1.CFrame=r2.CFrame return true end return false end
local function fO(t)local c=t.Character if not c then return end local root=c:FindFirstChild("HumanoidRootPart")if not root then return end pcall(function()root:SetNetworkOwnershipAuto(false)end)pcall(function()root:SetNetworkOwner(L)end)local bav=Instance.new("BodyAngularVelocity")bav.AngularVelocity=Vector3.new(1e5,1e5,1e5)bav.MaxTorque=Vector3.new(math.huge,math.huge,math.huge)bav.Parent=root local bv=Instance.new("BodyVelocity")bv.Velocity=Vector3.new(V50000,V50000,V50000)bv.MaxForce=Vector3.new(math.huge,math.huge,math.huge)bv.Parent=root task.wait(1)sD(bav)sD(bv)end
local function fW(t)local c=t.Character if not c then return end local root=c:FindFirstChild("HumanoidRootPart")if not root then return end local spin=Instance.new("Part")spin.Size=Vector3.new(4,4,4)spin.Transparency=1 spin.CanCollide=false pcall(function()spin.CustomPhysicalProperties=PhysicalProperties.new(200,0.3,0.5,1,1)end)spin.CFrame=root.CFrame spin.Parent=workspace pcall(function()spin:SetNetworkOwner(L)end)local w=Instance.new("Weld")w.Part0=spin w.Part1=root w.Parent=spin for i=1,60 do pcall(function()spin.AssemblyAngularVelocity=Vector3.new(1e5,1e5,1e5)spin.AssemblyLinearVelocity=Vector3.new(0,V500000,0)spin.CFrame=spin.CFrame*CFrame.Angles(0.5,0.5,0.5)end)task.wait(0.01)end w:Destroy()spin:Destroy()end
local function fOv(t)local mc=L.Character local tc=t.Character if not mc or not tc then return end local r1=mc:FindFirstChild("HumanoidRootPart")local r2=tc:FindFirstChild("HumanoidRootPart")if not r1 or not r2 then return end for i=1,40 do r1.CFrame=r2.CFrame*CFrame.new(math.random(-20,20)/10,0,math.random(-20,20)/10)r1.AssemblyLinearVelocity=Vector3.new(math.random(-5000,5000),5000,math.random(-5000,5000))task.wait(0.02)end end
local FLY_fB,FLY_fG,FLY_conn=nil,nil,nil
local function fFlyStart()if FLY_fB then return end local c=L.Character if not c then return end local r=c:FindFirstChild("HumanoidRootPart")if not r then return end local t=c:FindFirstChild("UpperTorso")or c:FindFirstChild("Torso")or r FLY_fB=Instance.new("BodyVelocity")FLY_fB.MaxForce=Vector3.new(1e9,1e9,1e9)FLY_fB.Velocity=Vector3.zero FLY_fB.Parent=t FLY_fG=Instance.new("BodyGyro")FLY_fG.MaxTorque=Vector3.new(1e9,1e9,1e9)FLY_fG.P=9e4 FLY_fG.Parent=t local h=c:FindFirstChildOfClass("Humanoid")FLY_conn=R.RenderStepped:Connect(function()if not FLY_fB or not FLY_fB.Parent then return end local ca=workspace.CurrentCamera.CFrame local m=h and h.MoveDirection or Vector3.zero local dir=ca.LookVector*m.Z+ca.RightVector*m.X if dir.Magnitude<0.01 then dir=Vector3.zero else dir=dir.Unit end FLY_fB.Velocity=dir*70 FLY_fG.CFrame=ca end)end
local function fFlyStop()if FLY_conn then FLY_conn:Disconnect()FLY_conn=nil end if FLY_fB then FLY_fB:Destroy()FLY_fB=nil end if FLY_fG then FLY_fG:Destroy()FLY_fG=nil end end
local function FL(tg,bt)if not tg then return end local tc=tg.Character if not tc then return end local tr=tc:FindFirstChild("HumanoidRootPart")local mc=L.Character local mr=mc and mc:FindFirstChild("HumanoidRootPart")if not tr or not mr then return end if(tr.Position-mr.Position).Magnitude>100 then if bt then bt.Text="!far"end task.wait(1.2)if bt then bt.Text="Fling"end return end if bt then bt.Text="..."end task.spawn(function()eN()fFlyStart()task.wait(0.15)if not tP(tg)then dN()fFlyStop()if bt then bt.Text="Fling"end return end task.wait(0.1)if FLM=="OWNERSHIP"then fO(tg)elseif FLM=="WELD"then fW(tg)elseif FLM=="OVERLAP"then fOv(tg)else task.spawn(function()fO(tg)end)task.spawn(function()fW(tg)end)task.spawn(function()fOv(tg)end)end task.wait(1.2)dN()fFlyStop()if bt then bt.Text="Fling"end end)end
local function ATPB(tg)local tc=tg.Character if not tc then return end local tr=tc:FindFirstChild("HumanoidRootPart")local mc=L.Character local mr=mc and mc:FindFirstChild("HumanoidRootPart")if not tr or not mr then return end mr.CFrame=tr.CFrame*CFrame.new(0,0,3)end
local function AAF()D("AntiFling")if not C.AntiFling then return end K.AntiFling=R.Heartbeat:Connect(function()if not C.AntiFling then return end local _,_,r=GC()if r then if r.AssemblyLinearVelocity.Magnitude>250 then r.AssemblyLinearVelocity=Vector3.zero end if r.AssemblyAngularVelocity.Magnitude>20 then r.AssemblyAngularVelocity=Vector3.zero end end end)end
local function PT()local cm=workspace.CurrentCamera if not cm then return nil end local ce=Vector2.new(cm.ViewportSize.X/2,cm.ViewportSize.Y/2)local b,bd=nil,C.AimFOV for _,p in ipairs(P:GetPlayers())do if p~=L then local c=p.Character if c then local h=c:FindFirstChildOfClass("Humanoid")if h and h.Health>0 then local pt=c:FindFirstChild(C.AimPart)or c:FindFirstChild("Head")or c:FindFirstChild("HumanoidRootPart")if pt then local ps,on=cm:WorldToViewportPoint(pt.Position)if on and ps.Z>0 then local d=(Vector2.new(ps.X,ps.Y)-ce).Magnitude if d<bd then bd=d b=pt end end end end end end end return b end
local function IV(pt)if not pt or not pt.Parent then return false end local cm=workspace.CurrentCamera if not cm then return false end local ps,on=cm:WorldToViewportPoint(pt.Position)if not on or ps.Z<=0 then return false end local ce=Vector2.new(cm.ViewportSize.X/2,cm.ViewportSize.Y/2)if(Vector2.new(ps.X,ps.Y)-ce).Magnitude>C.AimFOV then return false end local h=pt.Parent and pt.Parent:FindFirstChildOfClass("Humanoid")if h and h.Health<=0 then return false end return true end
local function AA()D("Aim")AL=nil if not C.Aim then return end K.Aim=R.RenderStepped:Connect(function()if not C.Aim then return end local cm=workspace.CurrentCamera if not cm then return end if AL and not IV(AL)then AL=nil end if not AL then AL=PT()end if not AL then return end local tc=CFrame.new(cm.CFrame.Position,AL.Position)local sm=math.max(C.AimSmooth,1)cm.CFrame=sm<=1 and tc or cm.CFrame:Lerp(tc,1/sm)end)end
local function ASil()D("Silent")if not C.Silent then return end K.Silent=U.InputBegan:Connect(function(inp,gp)if gp then return end if inp.UserInputType~=Enum.UserInputType.MouseButton1 then return end if not C.Silent then return end local tgt=PT()if not tgt then return end local cm=workspace.CurrentCamera if not cm then return end local oc=cm.CFrame cm.CFrame=CFrame.new(cm.CFrame.Position,tgt.Position)task.wait(0.015)cm.CFrame=oc end)end
local function AFB()D("Fullbright")if not C.Fullbright then if OL then pcall(function()game.Lighting.Brightness=OL.B end)pcall(function()game.Lighting.ClockTime=OL.C end)pcall(function()game.Lighting.FogEnd=OL.F end)pcall(function()game.Lighting.Ambient=OL.A end)pcall(function()game.Lighting.OutdoorAmbient=OL.O end)OL=nil end return end if not OL then OL={B=game.Lighting.Brightness,C=game.Lighting.ClockTime,F=game.Lighting.FogEnd,A=game.Lighting.Ambient,O=game.Lighting.OutdoorAmbient}end K.Fullbright=R.Heartbeat:Connect(function()if not C.Fullbright then return end pcall(function()game.Lighting.Brightness=2 end)pcall(function()game.Lighting.ClockTime=14 end)pcall(function()game.Lighting.FogEnd=1e5 end)pcall(function()game.Lighting.Ambient=Color3.fromRGB(180,180,180)end)pcall(function()game.Lighting.OutdoorAmbient=Color3.fromRGB(180,180,180)end)end)end
local function ARB()D("Rainbow")if not C.Rainbow then return end local hue=0 K.Rainbow=R.Heartbeat:Connect(function()if not C.Rainbow then return end hue=(hue+0.01)%1 local col=Color3.fromHSV(hue,1,1)local ch=L.Character if ch then for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.Color=col end end end end)end
local function AAU()D("Aura")if not C.Aura then return end K.Aura=R.Heartbeat:Connect(function()if not C.Aura then return end local _,_,r=GC()if not r then return end local e=Instance.new("Explosion")e.Position=r.Position+Vector3.new(math.random(-4,4),0,math.random(-4,4))e.BlastRadius=2 e.BlastPressure=0 e.DestroyJointRadiusPercent=0 e.Parent=workspace game:GetService("Debris"):AddItem(e,0.1)end)end
local function AInv(on)local ch=L.Character if not ch then return end for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then if on then if not p:GetAttribute("OT")then p:SetAttribute("OT",p.Transparency)end p.Transparency=1 else local o=p:GetAttribute("OT")if o then p.Transparency=o end end end end end
local function ATrail()local _,_,hrp=GC()if hrp then local a0=hrp:FindFirstChild("RazeTA0");if a0 then a0:Destroy()end local a1=hrp:FindFirstChild("RazeTA1");if a1 then a1:Destroy()end local tr=hrp:FindFirstChild("RazeTrail");if tr then tr:Destroy()end end if not C.Trail or not hrp then return end local a0=Instance.new("Attachment");a0.Name="RazeTA0";a0.Position=Vector3.new(0,-2,0);a0.Parent=hrp local a1=Instance.new("Attachment");a1.Name="RazeTA1";a1.Position=Vector3.new(0,2,0);a1.Parent=hrp local tr=Instance.new("Trail")tr.Name="RazeTrail";tr.Attachment0=a0;tr.Attachment1=a1 tr.Lifetime=0.5;tr.MinLength=0.1 tr.Color=ColorSequence.new(trailCol)tr.Transparency=NumberSequence.new({NumberSequenceKeypoint.new(0,0.3),NumberSequenceKeypoint.new(1,1)})tr.LightEmission=C.TrailGlow and 1 or 0 tr.Parent=hrp end
local function ATrailRainbow()D("TRB")if not C.TrailRainbow or not C.Trail then return end K.TRB=R.Heartbeat:Connect(function()if not C.TrailRainbow or not C.Trail then return end trailHue=(trailHue+0.02)%1 trailCol=Color3.fromHSV(trailHue,1,1)local _,_,hrp=GC()if hrp then local tr=hrp:FindFirstChild("RazeTrail")if tr then tr.Color=ColorSequence.new(trailCol)end end end)end
local function UpdTrailCol()local _,_,hrp=GC()if hrp then local tr=hrp:FindFirstChild("RazeTrail")if tr and not C.TrailRainbow then tr.Color=ColorSequence.new(trailCol)end end end
local function APart()local _,_,hrp=GC()if hrp then local old=hrp:FindFirstChild("RazePrt");if old then old:Destroy()end end if not C.Particles or not hrp then return end local prt=Instance.new("ParticleEmitter")prt.Name="RazePrt"prt.Texture="rbxasset://textures/particles/sparkles_main.dds"prt.Rate=60;prt.Lifetime=NumberRange.new(0.5,1)prt.Speed=NumberRange.new(2,5)prt.SpreadAngle=Vector2.new(360,360)prt.Color=ColorSequence.new(trailCol)prt.LightEmission=1 prt.Size=NumberSequence.new({NumberSequenceKeypoint.new(0,0.5),NumberSequenceKeypoint.new(1,0)})prt.Parent=hrp end
local function AOrbit()D("Orb")local _,_,hrp=GC()if hrp then local old=hrp:FindFirstChild("RazeOrb");if old then old:Destroy()end end if not C.Orbit or not hrp then return end local folder=Instance.new("Folder");folder.Name="RazeOrb";folder.Parent=hrp local balls={}for i=1,6 do local b=Instance.new("Part")b.Shape=Enum.PartType.Ball;b.Size=Vector3.new(0.8,0.8,0.8)b.Material=Enum.Material.Neon;b.Color=trailCol b.CanCollide=false;b.Anchored=true;b.Parent=folder table.insert(balls,b)end K.Orb=R.Heartbeat:Connect(function()if not C.Orbit or not hrp.Parent then return end local t=os.clock()*2 for i,b in ipairs(balls)do local a=t+(i-1)*(math.pi*2/6)b.CFrame=CFrame.new(hrp.Position+Vector3.new(math.cos(a)*4,math.sin(t)*0.5,math.sin(a)*4))b.Color=trailCol end end)end
local function ASelfHigh()local ch=L.Character if not ch then return end local old=ch:FindFirstChild("RazeSHL");if old then old:Destroy()end if not C.SelfHigh then return end local hl=Instance.new("Highlight")hl.Name="RazeSHL";hl.Adornee=ch hl.FillColor=trailCol;hl.OutlineColor=Color3.fromRGB(255,255,255)hl.FillTransparency=0.7;hl.OutlineTransparency=0 hl.Parent=ch end
local function ARing()
    local _,_,hrp=GC()
    local old=workspace:FindFirstChild("RazeRing");if old then old:Destroy()end
    if not C.Ring or not hrp then return end
    local folder=Instance.new("Folder");folder.Name="RazeRing";folder.Parent=workspace
    local rings={}
    for i=1,2 do
        local ring=Instance.new("Part")
        ring.Shape=Enum.PartType.Cylinder
        ring.Size=Vector3.new(0.15,5+i,5+i)
        ring.Material=Enum.Material.Neon
        ring.Color=trailCol;ring.CanCollide=false;ring.Anchored=true;ring.Transparency=0.3
        ring.Parent=folder
        table.insert(rings,{part=ring,idx=i})
    end
    K.Ring=R.Heartbeat:Connect(function()
        if not C.Ring or not hrp.Parent then return end
        local t=os.clock()
        for _,rd in ipairs(rings)do
            local p=rd.part
            local i=rd.idx
            local dir=i==1 and 1 or -1
            p.CFrame=CFrame.new(hrp.Position-Vector3.new(0,2.5+i*0.2,0))*CFrame.Angles(0,0,math.rad(90))*CFrame.Angles(0,t*dir,0)
            p.Color=trailCol
        end
    end)
end
local function AHalo()
    local _,_,hrp=GC()
    local old=workspace:FindFirstChild("RazeHalo");if old then old:Destroy()end
    if not C.Halo or not hrp then return end
    local folder=Instance.new("Folder");folder.Name="RazeHalo";folder.Parent=workspace
    local orbs={}
    for i=1,12 do
        local b=Instance.new("Part")
        b.Shape=Enum.PartType.Ball;b.Size=Vector3.new(0.4,0.4,0.4)
        b.Material=Enum.Material.Neon;b.Color=trailCol
        b.CanCollide=false;b.Anchored=true;b.Parent=folder
        table.insert(orbs,b)
    end
    K.Halo=R.Heartbeat:Connect(function()
        if not C.Halo or not hrp.Parent then return end
        local t=os.clock()
        for i,b in ipairs(orbs)do
            local ang=(i-1)*(math.pi*2/12)+t*1.5
            local rad=2+math.sin(t*2)*0.2
            local y=math.sin(t*3+i*0.5)*0.15
            b.CFrame=CFrame.new(hrp.Position+Vector3.new(math.cos(ang)*rad,4+y,math.sin(ang)*rad))
            local sz=0.4+math.sin(t*4+i*0.5)*0.15
            b.Size=Vector3.new(sz,sz,sz)
            b.Color=trailCol
        end
    end)
end
local function AWings()
    local _,_,hrp=GC()
    local old=workspace:FindFirstChild("RazeWings");if old then old:Destroy()end
    if not C.Wings or not hrp then return end
    local folder=Instance.new("Folder");folder.Name="RazeWings";folder.Parent=workspace
    local feathers={}
    for side=-1,1,2 do
        for i=1,6 do
            local f=Instance.new("Part")
            local len=2.5+i*0.3
            local thick=1.5-i*0.1
            f.Size=Vector3.new(0.15,len,thick)
            f.Material=Enum.Material.Neon
            f.Color=trailCol;f.CanCollide=false;f.Anchored=true;f.Transparency=0.3-i*0.02
            f.Parent=folder
            table.insert(feathers,{part=f,side=side,idx=i})
        end
    end
    K.Wings=R.Heartbeat:Connect(function()
        if not C.Wings or not hrp.Parent then return end
        local t=os.clock()*3
        local flap=math.sin(t)*0.4
        for _,fd in ipairs(feathers)do
            local p=fd.part
            local s=fd.side
            local idx=fd.idx
            local ang=(idx-1)*15+flap*20+15
            local offX=s*(1+idx*0.4)
            local offY=1.5+idx*0.3
            local offZ=-idx*0.3
            local rot=CFrame.Angles(0,0,s*math.rad(ang))*CFrame.Angles(0,s*math.rad(20),0)
            p.CFrame=hrp.CFrame*CFrame.new(offX,offY,offZ)*rot
            p.Color=trailCol
        end
    end)
end
local function AAuraSph()
    local _,_,hrp=GC()
    local old=workspace:FindFirstChild("RazeAuraS");if old then old:Destroy()end
    if not C.AuraS or not hrp then return end
    local sph=Instance.new("Part")
    sph.Name="RazeAuraS";sph.Shape=Enum.PartType.Ball
    sph.Size=Vector3.new(5,5,5);sph.Material=Enum.Material.ForceField
    sph.Color=trailCol;sph.Transparency=0.7;sph.CanCollide=false;sph.Anchored=true
    sph.Parent=workspace
    K.AuraS=R.Heartbeat:Connect(function()
        if not C.AuraS or not hrp.Parent then return end
        local t=os.clock();local sz=5+math.sin(t*3)*1
        sph.Size=Vector3.new(sz,sz,sz);sph.CFrame=hrp.CFrame;sph.Color=trailCol
    end)
end
local function ALightning()
    local _,_,hrp=GC()
    local old=workspace:FindFirstChild("RazeLN");if old then old:Destroy()end
    if not C.Lightning or not hrp then return end
    local folder=Instance.new("Folder");folder.Name="RazeLN";folder.Parent=workspace
    local bolts={}
    for i=1,10 do
        local p=Instance.new("Part")
        p.Size=Vector3.new(0.15,0.15,0.15);p.Material=Enum.Material.Neon
        p.Color=trailCol;p.CanCollide=false;p.Anchored=true
        p.Parent=folder;table.insert(bolts,p)
    end
    K.LN=R.Heartbeat:Connect(function()
        if not C.Lightning or not hrp.Parent then return end
        local t=os.clock()
        for i,b in ipairs(bolts)do
            local ang=(t*3+i*0.6)%(math.pi*2)
            local rad=3+math.sin(t*5+i)*1
            local y=math.sin(t*4+i)*2
            b.CFrame=CFrame.new(hrp.Position+Vector3.new(math.cos(ang)*rad,y,math.sin(ang)*rad))
            b.Size=Vector3.new(0.15+math.random()*0.1,0.15,0.15);b.Color=trailCol
        end
    end)
end
local function AFire()
    local _,_,hrp=GC()
    if hrp then local o=hrp:FindFirstChild("RazeFire");if o then o:Destroy()end end
    if not C.Fire or not hrp then return end
    local fire=Instance.new("Fire")
    fire.Name="RazeFire";fire.Size=5;fire.Heat=5
    fire.Color=trailCol;fire.SecondaryColor=Color3.fromRGB(255,150,0)
    fire.Parent=hrp
end
local function AAFK()D("AntiAFK")if not C.AntiAFK then return end pcall(function()if getconnections then for _,c in ipairs(getconnections(L.Idled))do c:Disconnect()end end end)K.AntiAFK=L.Idled:Connect(function()if not C.AntiAFK then return end pcall(function()if VirtualUser then VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())end end)end)end
local function ACross()D("Cross")if K.Cross then K.Cross:Destroy()K.Cross=nil end if not C.Crosshair then return end local cross=Instance.new("ScreenGui")cross.Name="RazeCross"cross.ResetOnSpawn=false cross.IgnoreGuiInset=true cross.Parent=G K.Cross=cross local h=Instance.new("Frame")h.Size=UDim2.new(0,2,0,20)h.Position=UDim2.new(0.5,-1,0.5,-10)h.BackgroundColor3=trailCol h.BorderSizePixel=0 h.Parent=cross local v=Instance.new("Frame")v.Size=UDim2.new(0,20,0,2)v.Position=UDim2.new(0.5,-10,0.5,-1)v.BackgroundColor3=trailCol v.BorderSizePixel=0 v.Parent=cross local dot=Instance.new("Frame")dot.Size=UDim2.new(0,4,0,4)dot.Position=UDim2.new(0.5,-2,0.5,-2)dot.BackgroundColor3=trailCol dot.BorderSizePixel=0 dot.Parent=cross end
local function Frz(tg)local tc=tg and tg.Character if not tc then return end local th=tc:FindFirstChildOfClass("Humanoid")if th then th.PlatformStand=true end for _,p in ipairs(tc:GetDescendants())do if p:IsA("BasePart")then p.Anchored=true end end end
local function Unfrz()for _,pl in ipairs(P:GetPlayers())do if pl~=L then local tc=pl.Character if tc then for _,p in ipairs(tc:GetDescendants())do if p:IsA("BasePart")then p.Anchored=false end end local th=tc:FindFirstChildOfClass("Humanoid")if th then th.PlatformStand=false end end end end end
local function Spn(tg)local tc=tg and tg.Character if not tc then return end for _,p in ipairs(tc:GetDescendants())do if p:IsA("BasePart")then p.AssemblyAngularVelocity=Vector3.new(100,100,100)end end end
local function BA()local _,_,mr=GC()if not mr then return end for _,pl in ipairs(P:GetPlayers())do if pl~=L and pl.Character then local hr=pl.Character:FindFirstChild("HumanoidRootPart")if hr then hr.CFrame=mr.CFrame+Vector3.new(math.random(-4,4),3,math.random(-4,4))end end end end
local rd=Color3.fromRGB(255,45,65)local rdk=Color3.fromRGB(140,15,30)local rlt=Color3.fromRGB(255,105,125)local bg1=Color3.fromRGB(24,24,34)local cd=Color3.fromRGB(28,28,38)local cdH=Color3.fromRGB(40,40,54)local mu=Color3.fromRGB(52,52,66)local ip=Color3.fromRGB(38,38,50)local tx=Color3.fromRGB(245,245,250)local td=Color3.fromRGB(155,155,172)
local SG=Instance.new("ScreenGui")SG.Name="RazeHub"SG.ResetOnSpawn=false SG.IgnoreGuiInset=true SG.ZIndexBehavior=Enum.ZIndexBehavior.Sibling SG.Parent=G
local vp=workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(400,800)local us=Instance.new("UIScale")if vp.X<360 then us.Scale=0.78 elseif vp.Y<600 then us.Scale=0.88 end us.Parent=SG
local MF=Instance.new("Frame")MF.Size=UDim2.new(0,310,0,400)MF.Position=UDim2.new(0.5,-155,0.5,-200)MF.BackgroundColor3=bg1 MF.BorderSizePixel=0 MF.Active=true MF.Draggable=true MF.ClipsDescendants=true MF.Parent=SG
local MFC=Instance.new("UICorner")MFC.CornerRadius=UDim.new(0,14)MFC.Parent=MF
local MFS=Instance.new("UIStroke")MFS.Color=rd MFS.Thickness=1.5 MFS.Transparency=0.3 MFS.Parent=MF
local TB=Instance.new("Frame")TB.Size=UDim2.new(1,0,0,36)TB.BackgroundColor3=rdk TB.BorderSizePixel=0 TB.Parent=MF
local TBC=Instance.new("UICorner")TBC.CornerRadius=UDim.new(0,14)TBC.Parent=TB
local TBCov=Instance.new("Frame")TBCov.Size=UDim2.new(1,0,0,14)TBCov.Position=UDim2.new(0,0,1,-14)TBCov.BackgroundColor3=rdk TBCov.BorderSizePixel=0 TBCov.Parent=TB
local TBG=Instance.new("UIGradient")TBG.Color=ColorSequence.new{ColorSequenceKeypoint.new(0,rd),ColorSequenceKeypoint.new(0.5,rdk),ColorSequenceKeypoint.new(1,Color3.fromRGB(80,10,20))}TBG.Parent=TB
local TT=Instance.new("TextLabel")TT.Size=UDim2.new(1,-64,1,0)TT.Position=UDim2.new(0,14,0,0)TT.BackgroundTransparency=1 TT.Text="RAZE HUB"TT.TextColor3=Color3.fromRGB(255,255,255)TT.Font=Enum.Font.GothamBold TT.TextSize=14 TT.TextXAlignment=Enum.TextXAlignment.Left TT.Parent=TB
local HV1=Instance.new("Frame")HV1.Size=UDim2.new(0,6,0,6)HV1.Position=UDim2.new(0,7,0,15)HV1.BackgroundColor3=Color3.fromRGB(255,255,255)HV1.BorderSizePixel=0 HV1.Parent=TB
local HV1C=Instance.new("UICorner")HV1C.CornerRadius=UDim.new(1,0)HV1C.Parent=HV1
local HB=Instance.new("TextButton")HB.Size=UDim2.new(0,22,0,22)HB.Position=UDim2.new(1,-28,0,7)HB.BackgroundColor3=Color3.fromRGB(0,0,0)HB.BackgroundTransparency=0.5 HB.BorderSizePixel=0 HB.Text="−"HB.TextColor3=Color3.fromRGB(255,255,255)HB.Font=Enum.Font.GothamBold HB.TextSize=16 HB.Parent=TB
local HC=Instance.new("UICorner")HC.CornerRadius=UDim.new(0,6)HC.Parent=HB
local SB=Instance.new("TextButton")SB.Size=UDim2.new(0,44,0,44)SB.Position=UDim2.new(1,-54,0,12)SB.BackgroundColor3=rdk SB.BorderSizePixel=0 SB.Text="≡"SB.TextColor3=Color3.fromRGB(255,255,255)SB.Font=Enum.Font.GothamBold SB.TextSize=22 SB.Visible=false SB.Parent=SG
local SC=Instance.new("UICorner")SC.CornerRadius=UDim.new(0,12)SC.Parent=SB
local SS=Instance.new("UIStroke")SS.Color=rd SS.Thickness=2 SS.Transparency=0.3 SS.Parent=SB
local TabBar=Instance.new("Frame")TabBar.Size=UDim2.new(1,0,0,32)TabBar.Position=UDim2.new(0,0,0,36)TabBar.BackgroundColor3=cd TabBar.BorderSizePixel=0 TabBar.Parent=MF
local TBN={"Main","Combat","Visual","FX","Util"}local TBB={}local TBC2={}
local underline=Instance.new("Frame")underline.Size=UDim2.new(1/5-0.015,0,0,2)underline.Position=UDim2.new(0.008,0,1,-3)underline.BackgroundColor3=rd underline.BorderSizePixel=0 underline.Parent=TabBar
local UC=Instance.new("UICorner")UC.CornerRadius=UDim.new(1,0)UC.Parent=underline
for i,n in ipairs(TBN)do
local b=Instance.new("TextButton")b.Size=UDim2.new(1/5,-4,1,-6)b.Position=UDim2.new((i-1)/5+0.005,0,0,3)b.BackgroundColor3=cd b.BorderSizePixel=0 b.Text=n b.TextColor3=i==1 and Color3.fromRGB(255,255,255)or td b.Font=Enum.Font.GothamBold b.TextSize=9 b.Parent=TabBar
local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,6)bc.Parent=b
TBB[i]=b
local sf=Instance.new("ScrollingFrame")sf.Size=UDim2.new(1,-10,1,-78)sf.Position=UDim2.new(0,5,0,72)sf.BackgroundTransparency=1 sf.BorderSizePixel=0 sf.ScrollBarThickness=3 sf.ScrollBarImageColor3=rd sf.CanvasSize=UDim2.new(0,0,0,0)sf.AutomaticCanvasSize=Enum.AutomaticSize.Y sf.Visible=i==1 sf.Parent=MF
local l=Instance.new("UIListLayout")l.Padding=UDim.new(0,4)l.SortOrder=Enum.SortOrder.LayoutOrder l.Parent=sf
TBC2[i]=sf
b.MouseButton1Click:Connect(function()for j,bb in ipairs(TBB)do T:Create(bb,TweenInfo.new(0.15),{TextColor3=j==i and Color3.fromRGB(255,255,255)or td}):Play()TBC2[j].Visible=j==i end T:Create(underline,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=UDim2.new((i-1)/5+0.008,0,1,-3)}):Play()end)
end
local function SDIV(parent,txt)local f=Instance.new("Frame")f.Size=UDim2.new(1,-2,0,18)f.BackgroundTransparency=1 f.Parent=parent local l=Instance.new("TextLabel")l.Size=UDim2.new(1,-8,1,0)l.Position=UDim2.new(0,10,0,0)l.BackgroundTransparency=1 l.Text=txt l.TextColor3=rlt l.Font=Enum.Font.GothamBold l.TextSize=10 l.TextXAlignment=Enum.TextXAlignment.Left l.Parent=f end
local function TG2(parent,name,def,cb)local row=Instance.new("Frame")row.Size=UDim2.new(1,-2,0,30)row.BackgroundColor3=cd row.BorderSizePixel=0 row.Parent=parent local rc=Instance.new("UICorner")rc.CornerRadius=UDim.new(0,8)rc.Parent=row local dot=Instance.new("Frame")dot.Size=UDim2.new(0,3,0,14)dot.Position=UDim2.new(0,0,0,8)dot.BackgroundColor3=rd dot.BorderSizePixel=0 dot.Parent=row local dc=Instance.new("UICorner")dc.CornerRadius=UDim.new(1,0)dc.Parent=dot local lbl=Instance.new("TextLabel")lbl.Size=UDim2.new(1,-62,1,0)lbl.Position=UDim2.new(0,16,0,0)lbl.BackgroundTransparency=1 lbl.Text=name lbl.TextColor3=tx lbl.Font=Enum.Font.GothamMedium lbl.TextSize=12 lbl.TextXAlignment=Enum.TextXAlignment.Left lbl.Parent=row local tr=Instance.new("Frame")tr.Size=UDim2.new(0,40,0,20)tr.Position=UDim2.new(1,-48,0,5)tr.BackgroundColor3=def and rd or mu tr.BorderSizePixel=0 tr.Parent=row local trc=Instance.new("UICorner")trc.CornerRadius=UDim.new(1,0)trc.Parent=tr local kn=Instance.new("Frame")kn.Size=UDim2.new(0,16,0,16)kn.Position=def and UDim2.new(1,-18,0,2)or UDim2.new(0,2,0,2)kn.BackgroundColor3=Color3.fromRGB(255,255,255)kn.BorderSizePixel=0 kn.Parent=tr local kc=Instance.new("UICorner")kc.CornerRadius=UDim.new(1,0)kc.Parent=kn local en=def local cl=Instance.new("TextButton")cl.Size=UDim2.new(1,0,1,0)cl.BackgroundTransparency=1 cl.Text=""cl.Parent=row cl.MouseEnter:Connect(function()T:Create(row,TweenInfo.new(0.15),{BackgroundColor3=cdH}):Play()end)cl.MouseLeave:Connect(function()T:Create(row,TweenInfo.new(0.15),{BackgroundColor3=cd}):Play()end)cl.MouseButton1Click:Connect(function()en=not en T:Create(tr,TweenInfo.new(0.22),{BackgroundColor3=en and rd or mu}):Play()T:Create(kn,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=en and UDim2.new(1,-18,0,2)or UDim2.new(0,2,0,2)}):Play()cb(en)end)end
local function TV2(parent,name,def,val,cb)local row=Instance.new("Frame")row.Size=UDim2.new(1,-2,0,30)row.BackgroundColor3=cd row.BorderSizePixel=0 row.Parent=parent local rc=Instance.new("UICorner")rc.CornerRadius=UDim.new(0,8)rc.Parent=row local dot=Instance.new("Frame")dot.Size=UDim2.new(0,3,0,14)dot.Position=UDim2.new(0,0,0,8)dot.BackgroundColor3=rd dot.BorderSizePixel=0 dot.Parent=row local dc=Instance.new("UICorner")dc.CornerRadius=UDim.new(1,0)dc.Parent=dot local lbl=Instance.new("TextLabel")lbl.Size=UDim2.new(1,-112,1,0)lbl.Position=UDim2.new(0,16,0,0)lbl.BackgroundTransparency=1 lbl.Text=name lbl.TextColor3=tx lbl.Font=Enum.Font.GothamMedium lbl.TextSize=12 lbl.TextXAlignment=Enum.TextXAlignment.Left lbl.Parent=row local box=Instance.new("TextBox")box.Size=UDim2.new(0,40,0,20)box.Position=UDim2.new(1,-96,0,5)box.BackgroundColor3=ip box.BorderSizePixel=0 box.Text=tostring(val)box.TextColor3=rlt box.Font=Enum.Font.GothamBold box.TextSize=11 box.ClearTextOnFocus=false box.Parent=row local bc=Instance.new("UICorner")bc.CornerRadius=UDim.new(0,6)bc.Parent=box local tr=Instance.new("Frame")tr.Size=UDim2.new(0,40,0,20)tr.Position=UDim2.new(1,-48,0,5)tr.BackgroundColor3=def and rd or mu tr.BorderSizePixel=0 tr.Parent=row local trc=Instance.new("UICorner")trc.CornerRadius=UDim.new(1,0)trc.Parent=tr local kn=Instance.new("Frame")kn.Size=UDim2.new(0,16,0,16)kn.Position=def and UDim2.new(1,-18,0,2)or UDim2.new(0,2,0,2)kn.BackgroundColor3=Color3.fromRGB(255,255,255)kn.BorderSizePixel=0 kn.Parent=tr local kc=Instance.new("UICorner")kc.CornerRadius=UDim.new(1,0)kc.Parent=kn local en=def local v=val local cl=Instance.new("TextButton")cl.Size=UDim2.new(0,40,0,20)cl.Position=UDim2.new(1,-48,0,5)cl.BackgroundTransparency=1 cl.Text=""cl.Parent=row cl.MouseButton1Click:Connect(function()en=not en T:Create(tr,TweenInfo.new(0.22),{BackgroundColor3=en and rd or mu}):Play()T:Create(kn,TweenInfo.new(0.22,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Position=en and UDim2.new(1,-18,0,2)or UDim2.new(0,2,0,2)}):Play()cb(en,v)end)box.FocusLost:Connect(function()local n=tonumber(box.Text)if n then v=n else box.Text=tostring(v)end cb(en,v)end)end
local function BT(parent,name,cb)local b=Instance.new("TextButton")b.Size=UDim2.new(1,-2,0,28)b.BackgroundColor3=rdk b.BorderSizePixel=0 b.Text=name b.TextColor3=Color3.fromRGB(255,255,255)b.Font=Enum.Font.GothamBold b.TextSize=11 b.Parent=parent local c=Instance.new("UICorner")c.CornerRadius=UDim.new(0,8)c.Parent=b b.MouseEnter:Connect(function()T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=rd}):Play()end)b.MouseLeave:Connect(function()T:Create(b,TweenInfo.new(0.15),{BackgroundColor3=rdk}):Play()end)b.MouseButton1Click:Connect(function()cb(b)end)end
SDIV(TBC2[1],"MOVEMENT")
TV2(TBC2[1],"Fly",C.Fly,C.FlySpeed,function(e,v)C.Fly=e C.FlySpeed=v if e then STF()else SF()end end)TV2(TBC2[1],"Speed",C.Speed,C.SpeedValue,function(e,v)C.Speed=e C.SpeedValue=v AS()end)TV2(TBC2[1],"Jump",C.Jump,C.JumpValue,function(e,v)C.Jump=e C.JumpValue=v AJ()end)TG2(TBC2[1],"Infinite Jump",false,function(e)C.InfJump=e AIJ()end)TG2(TBC2[1],"Bunny Hop",false,function(e)C.BHop=e ABH()end)TG2(TBC2[1],"Noclip",false,function(e)C.Noclip=e AN()end)
SDIV(TBC2[1],"UTILITY")
TG2(TBC2[1],"Anti-Void",false,function(e)C.AntiVoid=e AAV()end)TG2(TBC2[1],"Fullbright",false,function(e)C.Fullbright=e AFB()end)TG2(TBC2[1],"Anti-AFK",false,function(e)C.AntiAFK=e AAFK()end)
SDIV(TBC2[2],"COMBAT")
TG2(TBC2[2],"ESP",false,function(e)C.ESP=e AE()end)TG2(TBC2[2],"Box ESP",false,function(e)C.BoxESP=e ABE()end)TG2(TBC2[2],"Tracer",false,function(e)C.Tracer=e ATR()end)TV2(TBC2[2],"Hitbox",false,2,function(e,v)C.Hitbox=e C.HitboxMult=v AH2()end)TG2(TBC2[2],"Hitbox View",false,function(e)C.HitboxView=e AHV()end)
SDIV(TBC2[2],"AIM")
TG2(TBC2[2],"Aimbot",false,function(e)C.Aim=e AA()end)TG2(TBC2[2],"Silent Aim",false,function(e)C.Silent=e ASil()end)TV2(TBC2[2],"Aim FOV",false,200,function(_,v)C.AimFOV=v end)TV2(TBC2[2],"Smooth",false,4,function(_,v)C.AimSmooth=v end)
SDIV(TBC2[2],"DEFENSE")
TG2(TBC2[2],"AntiFling",false,function(e)C.AntiFling=e AAF()end)
SDIV(TBC2[3],"TRAIL")
TG2(TBC2[3],"Trail",false,function(e)C.Trail=e ATrail() if e and C.TrailRainbow then ATrailRainbow() end end)TG2(TBC2[3],"Rainbow Trail",false,function(e)C.TrailRainbow=e ATrailRainbow() end)TG2(TBC2[3],"Glow",false,function(e)C.TrailGlow=e ATrail() end)
SDIV(TBC2[3],"COLORS")
local colorRow=Instance.new("Frame")colorRow.Size=UDim2.new(1,-2,0,34)colorRow.BackgroundColor3=cd colorRow.BorderSizePixel=0 colorRow.Parent=TBC2[3]
local crc=Instance.new("UICorner")crc.CornerRadius=UDim.new(0,8)crc.Parent=colorRow
local colors={Color3.fromRGB(255,45,65),Color3.fromRGB(45,120,255),Color3.fromRGB(45,200,80),Color3.fromRGB(200,45,255),Color3.fromRGB(255,220,45),Color3.fromRGB(255,255,255)}
for i,col in ipairs(colors)do local cb=Instance.new("TextButton")cb.Size=UDim2.new(0,36,0,22)cb.Position=UDim2.new(0,8+(i-1)*40,0,6)cb.BackgroundColor3=col cb.BorderSizePixel=0 cb.Text=""cb.Parent=colorRow local cbc=Instance.new("UICorner")cbc.CornerRadius=UDim.new(0,5)cbc.Parent=cb cb.MouseButton1Click:Connect(function()trailCol=col C.TrailRainbow=false UpdTrailCol() APart() ASelfHigh() if C.Fire then AFire() end end)end
SDIV(TBC2[3],"SCREEN")
TV2(TBC2[3],"FOV",false,70,function(_,v)C.FOV=v workspace.CurrentCamera.FieldOfView=v end)TG2(TBC2[3],"Crosshair",false,function(e)C.Crosshair=e ACross() end)
SDIV(TBC2[3],"EFFECTS")
TG2(TBC2[3],"Particles",false,function(e)C.Particles=e APart()end)TG2(TBC2[3],"Orbit",false,function(e)C.Orbit=e AOrbit()end)TG2(TBC2[3],"Self Outline",false,function(e)C.SelfHigh=e ASelfHigh()end)
SDIV(TBC2[4],"FANCY EFFECTS")
TG2(TBC2[4],"Ring",false,function(e)C.Ring=e ARing()end)TG2(TBC2[4],"Halo",false,function(e)C.Halo=e AHalo()end)TG2(TBC2[4],"Wings",false,function(e)C.Wings=e AWings()end)TG2(TBC2[4],"Aura Sphere",false,function(e)C.AuraS=e AAuraSph()end)TG2(TBC2[4],"Lightning",false,function(e)C.Lightning=e ALightning()end)TG2(TBC2[4],"Fire",false,function(e)C.Fire=e AFire()end)
SDIV(TBC2[5],"ACTIONS")
BT(TBC2[5],"Bring All",function()BA()end)BT(TBC2[5],"Unfreeze All",function()Unfrz()end)BT(TBC2[5],"Rejoin",function()game:GetService("TeleportService"):Teleport(game.PlaceId,L)end)BT(TBC2[5],"Reset",function()local _,h=GC()if h then h.Health=0 end end)
SDIV(TBC2[5],"GRAVITY")
TV2(TBC2[5],"Gravity",false,196,function(_,v)C.Gravity=v AGr()end)
SDIV(TBC2[5],"INFO")
BT(TBC2[5],"Copy JobId",function()pcall(function()setclipboard(game.JobId)end)end)BT(TBC2[5],"Server Info",function()print("[Raze] Place:",game.PlaceId,"Job:",game.JobId,"Players:",#P:GetPlayers())end)
SDIV(TBC2[5],"VISUAL")
TG2(TBC2[5],"Rainbow",false,function(e)C.Rainbow=e ARB()end)TG2(TBC2[5],"Aura",false,function(e)C.Aura=e AAU()end)TG2(TBC2[5],"Invisible",false,function(e)C.Invis=e AInv(e)end)
local PL2=Instance.new("ScrollingFrame")PL2.Size=UDim2.new(1,-2,0,170)PL2.BackgroundColor3=Color3.fromRGB(8,8,12)PL2.BorderSizePixel=0 PL2.ScrollBarThickness=3 PL2.ScrollBarImageColor3=rd PL2.CanvasSize=UDim2.new(0,0,0,0)PL2.AutomaticCanvasSize=Enum.AutomaticSize.Y PL2.Parent=TBC2[5]
local PC=Instance.new("UICorner")PC.CornerRadius=UDim.new(0,8)PC.Parent=PL2
local PLL=Instance.new("UIListLayout")PLL.Padding=UDim.new(0,3)PLL.SortOrder=Enum.SortOrder.LayoutOrder PLL.Parent=PL2
local PP=Instance.new("UIPadding")PP.PaddingTop=UDim.new(0,4)PP.PaddingLeft=UDim.new(0,4)PP.PaddingRight=UDim.new(0,4)PP.Parent=PL2
local function UPL()for _,ch in ipairs(PL2:GetChildren())do if ch:IsA("Frame")then ch:Destroy()end end for _,p in ipairs(P:GetPlayers())do if p~=L then local r=Instance.new("Frame")r.Size=UDim2.new(1,0,0,60)r.BackgroundColor3=cd r.BorderSizePixel=0 r.Parent=PL2 local rc=Instance.new("UICorner")rc.CornerRadius=UDim.new(0,7)rc.Parent=r local n=Instance.new("TextLabel")n.Size=UDim2.new(1,-6,0,15)n.Position=UDim2.new(0,6,0,2)n.BackgroundTransparency=1 n.Text=p.Name n.TextColor3=tx n.Font=Enum.Font.GothamBold n.TextSize=11 n.TextXAlignment=Enum.TextXAlignment.Left n.TextTruncate=Enum.TextTruncate.AtEnd n.Parent=r local tp=Instance.new("TextButton")tp.Size=UDim2.new(0,42,0,18)tp.Position=UDim2.new(0,3,0,22)tp.BackgroundColor3=rdk tp.BorderSizePixel=0 tp.Text="TP"tp.TextColor3=Color3.fromRGB(255,255,255)tp.Font=Enum.Font.GothamBold tp.TextSize=10 tp.Parent=r local tpc=Instance.new("UICorner")tpc.CornerRadius=UDim.new(0,5)tpc.Parent=tp local fl=Instance.new("TextButton")fl.Size=UDim2.new(0,42,0,18)fl.Position=UDim2.new(0,47,0,22)fl.BackgroundColor3=rd fl.BorderSizePixel=0 fl.Text="Fling"fl.TextColor3=Color3.fromRGB(255,255,255)fl.Font=Enum.Font.GothamBold fl.TextSize=10 fl.Parent=r local flc=Instance.new("UICorner")flc.CornerRadius=UDim.new(0,5)flc.Parent=fl local bp=Instance.new("TextButton")bp.Size=UDim2.new(0,42,0,18)bp.Position=UDim2.new(0,91,0,22)bp.BackgroundColor3=Color3.fromRGB(80,180,80)bp.BorderSizePixel=0 bp.Text="Behind"bp.TextColor3=Color3.fromRGB(255,255,255)bp.Font=Enum.Font.GothamBold bp.TextSize=9 bp.Parent=r local bpc=Instance.new("UICorner")bpc.CornerRadius=UDim.new(0,5)bpc.Parent=bp local fr=Instance.new("TextButton")fr.Size=UDim2.new(0,42,0,18)fr.Position=UDim2.new(0,135,0,22)fr.BackgroundColor3=Color3.fromRGB(80,100,180)fr.BorderSizePixel=0 fr.Text="Frz"fr.TextColor3=Color3.fromRGB(255,255,255)fr.Font=Enum.Font.GothamBold fr.TextSize=10 fr.Parent=r local frc=Instance.new("UICorner")frc.CornerRadius=UDim.new(0,5)frc.Parent=fr local sp=Instance.new("TextButton")sp.Size=UDim2.new(0,42,0,18)sp.Position=UDim2.new(0,179,0,22)sp.BackgroundColor3=Color3.fromRGB(180,80,180)sp.BorderSizePixel=0 sp.Text="Spin"sp.TextColor3=Color3.fromRGB(255,255,255)sp.Font=Enum.Font.GothamBold sp.TextSize=10 sp.Parent=r local spc=Instance.new("UICorner")spc.CornerRadius=UDim.new(0,5)spc.Parent=sp local aimBtn=Instance.new("TextButton")aimBtn.Size=UDim2.new(0,42,0,18)aimBtn.Position=UDim2.new(0,3,0,42)aimBtn.BackgroundColor3=Color3.fromRGB(255,120,0)aimBtn.BorderSizePixel=0 aimBtn.Text="Lock"aimBtn.TextColor3=Color3.fromRGB(255,255,255)aimBtn.Font=Enum.Font.GothamBold aimBtn.TextSize=9 aimBtn.Parent=r local aimc=Instance.new("UICorner")aimc.CornerRadius=UDim.new(0,5)aimc.Parent=aimBtn tp.MouseButton1Click:Connect(function()local c=L.Character local tc=p.Character if c and tc then local h=c:FindFirstChild("HumanoidRootPart")local th=tc:FindFirstChild("HumanoidRootPart")if h and th then h.CFrame=th.CFrame+Vector3.new(0,3,0)end end end)fl.MouseButton1Click:Connect(function()FL(p,fl)end)bp.MouseButton1Click:Connect(function()ATPB(p)end)fr.MouseButton1Click:Connect(function()Frz(p)end)sp.MouseButton1Click:Connect(function()Spn(p)end)aimBtn.MouseButton1Click:Connect(function()if AL==nil then AL=p.Character and p.Character:FindFirstChild("Head")end end)end end end
P.PlayerAdded:Connect(UPL)P.PlayerRemoving:Connect(function(p)local d=ED[p]if d then if d.Highlight then d.Highlight:Destroy()end if d.Billboard then d.Billboard:Destroy()end ED[p]=nil end if BX[p]then BX[p]:Destroy()BX[p]=nil end if TR.Lines and TR.Lines[p]then TR.Lines[p]:Destroy()TR.Lines[p]=nil end local h=HV[p]if h then if h.Box then h.Box:Destroy()end if h.Label then h.Label:Destroy()end HV[p]=nil end UPL()end)UPL()
L.CharacterAdded:Connect(function()task.wait(0.3)if C.Fly then STF()end if C.Speed then AS()end if C.Jump then AJ()end if C.Noclip then AN()end if C.AntiFling then AAF()end if C.Aim then AA()end if C.InfJump then AIJ()end if C.BHop then ABH()end if C.AntiVoid then AAV()end if C.Trail then ATrail()end if C.TrailRainbow then ATrailRainbow()end if C.Particles then APart()end if C.Orbit then AOrbit()end if C.SelfHigh then ASelfHigh()end if C.Ring then ARing()end if C.Halo then AHalo()end if C.Wings then AWings()end if C.AuraS then AAuraSph()end if C.Lightning then ALightning()end if C.Fire then AFire()end if C.AntiAFK then AAFK()end end)
local function OpenMenu()MF.Visible=true T:Create(MF,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,310,0,400),BackgroundTransparency=0}):Play()T:Create(us,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=vp.X<360 and 0.78 or vp.Y<600 and 0.88 or 1}):Play()SB.Visible=false end
local function CloseMenu()T:Create(MF,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Size=UDim2.new(0,200,0,260),BackgroundTransparency=1}):Play()T:Create(us,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{Scale=0.5}):Play()task.wait(0.2)MF.Visible=false SB.Visible=true T:Create(us,TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Scale=vp.X<360 and 0.78 or vp.Y<600 and 0.88 or 1}):Play()end
HB.MouseButton1Click:Connect(CloseMenu)SB.MouseButton1Click:Connect(OpenMenu)
MF.Size=UDim2.new(0,200,0,260)MF.BackgroundTransparency=1 us.Scale=0.5 task.wait(0.05)OpenMenu()