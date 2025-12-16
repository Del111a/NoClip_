                                                                                 local Players=game:   
                                                                        GetService("Players");local RunService=game:    
                                                                    GetService("RunService");local UIS=game:GetService(           
                                                                "UserInputService");local TweenService=game:GetService("TweenService"); 
                                                            local lp=Players.LocalPlayer;local char=nil;local parts={};local noclip=false 
                                                          ;local hbConn,addConn;local boundKeyCode=nil;local isBinding=false;local          
                                                        originalCollide={};local function isPart(obj) return obj and obj:IsA("BasePart") ;end 
                                                       local function cacheCharacter(c) char=c;table.clear(parts);table.clear(originalCollide); 
                                                    for _,d in ipairs(char:GetDescendants()) do if isPart(d) then parts[ #parts + 1 ]=d;end end   
                                                  if addConn then addConn:Disconnect();end addConn=char.DescendantAdded:Connect(function(d) if      
                                                  isPart(d) then parts[ #parts + 1 ]=d;if noclip then if (originalCollide[d]==nil) then               
                                                originalCollide[d]=d.CanCollide;end d.CanCollide=false;end end end);end local function applyNoclip()    
                                                for i=1, #parts do local p=parts[i];if (p and p.Parent) then if (originalCollide[p]==nil) then            
                                              originalCollide[p]=p.CanCollide;end if p.CanCollide then p.CanCollide=false;end end end end local function    
                                              restoreCollision() for p,was in pairs(originalCollide) do if (p and p.Parent) then p.CanCollide=was;end end   
                                            table.clear(originalCollide);end local function setNoclip(state) if (noclip and  not state) then if hbConn then   
                                            hbConn:Disconnect();hbConn=nil;end noclip=false;restoreCollision();return;end if ( not noclip and state) then       
                                          noclip=true;if hbConn then hbConn:Disconnect();hbConn=nil;end if (char and char.Parent) then applyNoclip();end local    
                                          acc=0;hbConn=RunService.Heartbeat:Connect(function(dt) acc+=dt if (acc>=(1/15)) then acc=0;if (char and char.Parent) then 
                                           applyNoclip();end end end);end end cacheCharacter(lp.Character or lp.CharacterAdded:Wait() );lp.CharacterAdded:Connect(    
                                          function(c) cacheCharacter(c);if noclip then applyNoclip();end end);local gui=Instance.new("ScreenGui");gui.Name=           
                                        "NoclipGui";gui.ResetOnSpawn=false;gui.IgnoreGuiInset=true;gui.Parent=lp:WaitForChild("PlayerGui");local main=Instance.new(     
                                        "Frame");main.Name="Main";main.AnchorPoint=Vector2.new(0.5,0.5);main. --[[==============================]]Position=UDim2.new(0.5, 
                                        0,0.5,0);main.Size=UDim2.fromOffset(340,190);main.          --[[============================================]]BackgroundColor3=   
                                        Color3.fromRGB(18,20,28);main.BorderSizePixel=0;main.   --[[======================================================]]Parent=gui;     
                                      local cr=Instance.new("UICorner");cr.CornerRadius=    --[[==========================================================]]UDim.new(0,14);cr 
                                      .Parent=main;local stroke=Instance.new("UIStroke"); --[[==============================================================]]stroke.         
                                      Thickness=1;stroke.Color=Color3.fromRGB(40,45,65);  --[[================================================================]]stroke.         
                                      Transparency=0.15;stroke.Parent=main;local shadow=  --[[==================================================================]]Instance.new( 
                                      "ImageLabel");shadow.Name="Shadow";shadow.          --[[==================================================================]]                  
                                    BackgroundTransparency=1;shadow.Image=                --[[====================================================================]]              
                    "rbxassetid://1316045217";shadow.ImageTransparency=0.85;shadow.       --[[====================================================================]]ScaleType=Enum. 
              ScaleType.Slice;shadow.SliceCenter=Rect.new(10,10,118,118);shadow.Size=     --[[======================================================================]]UDim2.new(1,  
            28,1,28);shadow.Position=UDim2.new(0, -14,0, -14);shadow.Parent=main;local    --[[======================================================================]]uiScale=      
          Instance.new("UIScale");uiScale.Scale=1;uiScale.Parent=main;local function      --[[======================================================================]]quantizeScale 
        (x,step) step=step or 0.05 ;return math.floor((x/step) + 0.5 ) * step ;end local  --[[======================================================================]]top=Instance. 
        new("Frame");top.Name="TopBar";top.BackgroundTransparency=1;top.Size=UDim2.new(1, --[[======================================================================]]0,0,52);top.  
      Parent=main;local title=Instance.new("TextLabel");title.BackgroundTransparency=1;   --[[======================================================================]]title.Text=   
      "NOCLIP";title.Font=Enum.Font.GothamBold;title.TextSize=18;title.TextColor3=Color3.   --[[==================================================================]]fromRGB(235,238 
      ,255);title.Position=UDim2.fromOffset(16,12);title.Size=UDim2.new(1, -32,0,22);title. --[[================================================================]]TextXAlignment=   
    Enum.TextXAlignment.Left;title.Parent=top;local sub=Instance.new("TextLabel");sub.      --[[==============================================================]]                  
    BackgroundTransparency=1;sub.Text="Toggle & bind your own key";sub.Font=Enum.Font.Gotham; --[[==========================================================]]sub.TextSize=13;sub 
    .TextColor3=Color3.fromRGB(160,170,200);sub.Position=UDim2.fromOffset(16,34);sub.Size=UDim2 --[[====================================================]].new(1, -32,0,18);sub.  
    TextXAlignment=Enum.TextXAlignment.Left;sub.Parent=top;local content=Instance.new("Frame");   --[[==============================================]]content.Name="Content";   
    content.BackgroundTransparency=1;content.Position=UDim2.new(0,16,0,58);content.Size=UDim2.new(1,  --[[====================================]]-32,1, -74);content.Parent=   
    main;local status=Instance.new("TextLabel");status.BackgroundTransparency=1;status.Font=Enum.Font.    --[[========================]]GothamSemibold;status.TextSize=14;    
    status.TextColor3=Color3.fromRGB(255,160,160);status.Text="Status: OFF";status.Size=UDim2.new(1,0,0,18);status.TextXAlignment=Enum.TextXAlignment.Left;status.Parent=   
  content;local bindLabel=Instance.new("TextLabel");bindLabel.BackgroundTransparency=1;bindLabel.Font=Enum.Font.Gotham;bindLabel.TextSize=13;bindLabel.TextColor3=Color3. 
  fromRGB(160,170,200);bindLabel.Text="Bind: NONE";bindLabel.Position=UDim2.new(0,0,0,22);bindLabel.Size=UDim2.new(1,0,0,18);bindLabel.TextXAlignment=Enum.             
  TextXAlignment.Left;bindLabel.Parent=content;local buttonsRow=Instance.new("Frame");buttonsRow.BackgroundTransparency=1;buttonsRow.Position=UDim2.new(0,0,1, -52);      
  buttonsRow.Size=UDim2.new(1,0,0,42);buttonsRow.Parent=content;local function mkButton(text) local btn=Instance.new("TextButton");btn.AutoButtonColor=false;btn.Text=    
  text;btn.Font=Enum.Font.GothamSemibold;btn.TextSize=14;btn.TextColor3=Color3.fromRGB(235,238,255);btn.BackgroundColor3=Color3.fromRGB(28,32,46);btn.BorderSizePixel=0;  
  local c=Instance.new("UICorner");c.CornerRadius=UDim.new(0,12);c.Parent=btn;local s=Instance.new("UIStroke");s.Thickness=1;s.Color=Color3.fromRGB(55,60,90);s.          
  Transparency=0.35;s.Parent=btn;btn.MouseEnter:Connect(function() TweenService:Create(btn,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{           
  BackgroundColor3=Color3.fromRGB(34,39,58)}):Play();end);btn.MouseLeave:Connect(function() TweenService:Create(btn,TweenInfo.new(0.12,Enum.EasingStyle.Quad,Enum.        
  EasingDirection.Out),{BackgroundColor3=Color3.fromRGB(28,32,46)}):Play();end);return btn;end local toggleBtn=mkButton("Enable");toggleBtn.Parent=buttonsRow;toggleBtn.  
  Size=UDim2.new(0.5, -6,1,0);toggleBtn.Position=UDim2.new(0,0,0,0);local bindBtn=mkButton("Set Bind");bindBtn.Parent=buttonsRow;bindBtn.Size=UDim2.new(0.5, -6,1,0);     
  bindBtn.Position=UDim2.new(0.5,6,0,0);local grip=Instance.new("Frame");grip.Name="ResizeGrip";grip.Size=UDim2.fromOffset(22,22);grip.Position=UDim2.new(1, -22,1, -22); 
  grip.BackgroundTransparency=1;grip.Parent=main;local gripIcon=Instance.new("ImageLabel");gripIcon.BackgroundTransparency=1;gripIcon.Image="rbxassetid://6031091002";      
  gripIcon.ImageTransparency=0.25;gripIcon.Size=UDim2.new(1,0,1,0);gripIcon.Parent=grip;local function updateUI() if noclip then status.Text="Status: ON";status.TextColor3 
  =Color3.fromRGB(160,255,185);toggleBtn.Text="Disable";else status.Text="Status: OFF";status.TextColor3=Color3.fromRGB(255,160,160);toggleBtn.Text="Enable";end if         
  isBinding then bindLabel.Text="Bind: press a key... (ESC clears)";elseif boundKeyCode then bindLabel.Text="Bind: "   .. tostring(boundKeyCode.Name) ;else bindLabel.Text= 
  "Bind: NONE";end end toggleBtn.MouseButton1Click:Connect(function() setNoclip( not noclip);updateUI();end);bindBtn.MouseButton1Click:Connect(function() isBinding=true;   
  updateUI();end);UIS.InputBegan:Connect(function(input,gp) if gp then return;end if isBinding then if (input.KeyCode~=Enum.KeyCode.Unknown) then if (input.KeyCode==Enum.  
  KeyCode.Escape) then boundKeyCode=nil;else boundKeyCode=input.KeyCode;end isBinding=false;updateUI();end return;end if (boundKeyCode and (input.KeyCode==boundKeyCode))   
  then setNoclip( not noclip);updateUI();end end);do local dragging=false;local dragStartPos,startMainPos;top.InputBegan:Connect(function(input) if ((input.UserInputType== 
  Enum.UserInputType.MouseButton1) or (input.UserInputType==Enum.UserInputType.Touch)) then dragging=true;dragStartPos=Vector2.new(input.Position.X,input.Position.Y);      
  startMainPos=main.Position;end end);top.InputEnded:Connect(function(input) if ((input.UserInputType==Enum.UserInputType.MouseButton1) or (input.UserInputType==Enum.      
  UserInputType.Touch)) then dragging=false;end end);UIS.InputChanged:Connect(function(input) if  not dragging then return;end if ((input.UserInputType~=Enum.UserInputType 
  .MouseMovement) and (input.UserInputType~=Enum.UserInputType.Touch)) then return;end local cur=Vector2.new(input.Position.X,input.Position.Y);local delta=cur-            
  dragStartPos ;main.Position=UDim2.new(startMainPos.X.Scale,startMainPos.X.Offset + delta.X ,startMainPos.Y.Scale,startMainPos.Y.Offset + delta.Y );end);end do local      
  resizing=false;local startMouse,startSize;local BASE_W,BASE_H=340,190;local MIN_W,MIN_H=240,140;local MAX_W,MAX_H=650,420;grip.InputBegan:Connect(function(input) if (( 
  input.UserInputType==Enum.UserInputType.MouseButton1) or (input.UserInputType==Enum.UserInputType.Touch)) then resizing=true;startMouse=Vector2.new(input.Position.X,   
  input.Position.Y);startSize=main.Size;end end);grip.InputEnded:Connect(function(input) if ((input.UserInputType==Enum.UserInputType.MouseButton1) or (input.            
    UserInputType==Enum.UserInputType.Touch)) then resizing=false;end end);UIS.InputChanged:Connect(function(input) if  not resizing then return;end if ((input.          
    UserInputType~=Enum.UserInputType.MouseMovement) and (input.UserInputType~=Enum.UserInputType.Touch)) then return;end local cur=Vector2.new(input.Position.X,input.   
    Position.Y);local delta=cur-startMouse ;local newW=math.clamp(startSize.X.Offset + delta.X ,MIN_W,MAX_W);local newH=math.clamp(startSize.Y.Offset + delta.Y ,MIN_H,   
    MAX_H);main.Size=UDim2.fromOffset(newW,newH);local sx=newW/BASE_W ;local sy=newH/BASE_H ;local raw=math.clamp(math.min(sx,sy),0.8,1.35);uiScale.Scale=quantizeScale(  
      raw,0.05);end);end updateUI();
