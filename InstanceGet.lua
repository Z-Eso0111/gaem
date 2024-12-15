local referencedump = [[
BillboardGui
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ LayerCollector ]
	bool Enabled
	ZIndexBehavior ZIndexBehavior
-	[ BillboardGui ]
	bool Active
	Object Adornee
	bool AlwaysOnTop
	Vector3 ExtentsOffset
	Vector3 ExtentsOffsetWorldSpace
	float LightInfluence
	float MaxDistance
	Object PlayerToHideFrom
	UDim2 Size
	Vector2 SizeOffset
	Vector3 StudsOffset
	Vector3 StudsOffsetWorldSpace
Frame
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ Frame ]
	FrameStyle Style
ImageButton
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ GuiButton ]
	bool AutoButtonColor
	bool Modal
	bool Selected
	ButtonStyle Style
-	[ ImageButton ]
	Content Image
	Color3 ImageColor3
	Vector2 ImageRectOffset
	Vector2 ImageRectSize
	float ImageTransparency
	ScaleType ScaleType
	Rect2D SliceCenter
	float SliceScale
	UDim2 TileSize
ImageLabel
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ ImageLabel ]
	Content Image
	Color3 ImageColor3
	Vector2 ImageRectOffset
	Vector2 ImageRectSize
	float ImageTransparency
	ScaleType ScaleType
	Rect2D SliceCenter
	float SliceScale
	UDim2 TileSize
ScreenGui
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ LayerCollector ]
	bool Enabled
	ZIndexBehavior ZIndexBehavior
-	[ ScreenGui ]
	int DisplayOrder
	bool ResetOnSpawn
ScrollingFrame
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ ScrollingFrame ]
	Content BottomImage
	Vector2 CanvasPosition
	UDim2 CanvasSize
	ScrollBarInset HorizontalScrollBarInset
	Content MidImage
	int ScrollBarThickness
	bool ScrollingEnabled
	Content TopImage
	ScrollBarInset VerticalScrollBarInset
	VerticalScrollBarPosition VerticalScrollBarPosition
SurfaceGui
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ LayerCollector ]
	bool Enabled
	ZIndexBehavior ZIndexBehavior
-	[ SurfaceGui ]
	bool Active
	Object Adornee
	bool AlwaysOnTop
	Vector2 CanvasSize
	NormalId Face
	float LightInfluence
	float ToolPunchThroughDistance
	float ZOffset
TextBox
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ TextBox ]
	bool ClearTextOnFocus
	Font Font
	float LineHeight
	bool MultiLine
	Color3 PlaceholderColor3
	string PlaceholderText
	bool ShowNativeInput
	string Text
	Color3 TextColor3
	bool TextScaled
	float TextSize
	Color3 TextStrokeColor3
	float TextStrokeTransparency
	float TextTransparency
	bool TextWrapped
	TextXAlignment TextXAlignment
	TextYAlignment TextYAlignment
TextButton
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ GuiButton ]
	bool AutoButtonColor
	bool Modal
	bool Selected
	ButtonStyle Style
-	[ TextButton ]
	Font Font
	float LineHeight
	string Text
	Color3 TextColor3
	bool TextScaled
	float TextSize
	Color3 TextStrokeColor3
	float TextStrokeTransparency
	float TextTransparency
	bool TextWrapped
	TextXAlignment TextXAlignment
	TextYAlignment TextYAlignment
TextLabel
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ GuiObject ]
	bool Active
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	float BackgroundTransparency
	Color3 BorderColor3
	int BorderSizePixel
	bool ClipsDescendants
	bool Draggable
	int LayoutOrder
	Object NextSelectionDown
	Object NextSelectionLeft
	Object NextSelectionRight
	Object NextSelectionUp
	UDim2 Position
	float Rotation
	bool Selectable
	Object SelectionImageObject
	UDim2 Size
	SizeConstraint SizeConstraint
	bool Visible
	int ZIndex
-	[ TextLabel ]
	Font Font
	float LineHeight
	string Text
	Color3 TextColor3
	bool TextScaled
	float TextSize
	Color3 TextStrokeColor3
	float TextStrokeTransparency
	float TextTransparency
	bool TextWrapped
	TextXAlignment TextXAlignment
	TextYAlignment TextYAlignment
UIAspectRatioConstraint
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIAspectRatioConstraint ]
	float AspectRatio
	AspectType AspectType
	DominantAxis DominantAxis
UIGridLayout
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIGridStyleLayout ]
	FillDirection FillDirection
	HorizontalAlignment HorizontalAlignment
	SortOrder SortOrder
	VerticalAlignment VerticalAlignment
-	[ UIGridLayout ]
	UDim2 CellPadding
	UDim2 CellSize
	int FillDirectionMaxCells
	StartCorner StartCorner
UIListLayout
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIGridStyleLayout ]
	FillDirection FillDirection
	HorizontalAlignment HorizontalAlignment
	SortOrder SortOrder
	VerticalAlignment VerticalAlignment
-	[ UIListLayout ]
	UDim Padding
UIPadding
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIPadding ]
	UDim PaddingBottom
	UDim PaddingLeft
	UDim PaddingRight
	UDim PaddingTop
UIPageLayout
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIGridStyleLayout ]
	FillDirection FillDirection
	HorizontalAlignment HorizontalAlignment
	SortOrder SortOrder
	VerticalAlignment VerticalAlignment
-	[ UIPageLayout ]
	bool Animated
	bool Circular
	EasingDirection EasingDirection
	EasingStyle EasingStyle
	bool GamepadInputEnabled
	UDim Padding
	bool ScrollWheelInputEnabled
	bool TouchInputEnabled
	float TweenTime
UIScale
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIScale ]
	float Scale
UISizeConstraint
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UISizeConstraint ]
	Vector2 MaxSize
	Vector2 MinSize
UITableLayout
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UIGridStyleLayout ]
	FillDirection FillDirection
	HorizontalAlignment HorizontalAlignment
	SortOrder SortOrder
	VerticalAlignment VerticalAlignment
-	[ UITableLayout ]
	bool FillEmptySpaceColumns
	bool FillEmptySpaceRows
	TableMajorAxis MajorAxis
	UDim2 Padding
UITextSizeConstraint
-	[ Instance ]
	bool Archivable
	string Name
	Object Parent
-	[ UITextSizeConstraint ]
	int MaxTextSize
	int MinTextSize
Folder
	bool Archivable
	string Name
	Object Parent
Configuration
	bool Archivable
	string Name
	Object Parent
ViewportFrame
	Color3 Ambient
	Color3 LightColor
	Vector3 LightDirection
	Object SelectionImageObject
	float BackgroundTransparency
	Vector2 AnchorPoint
	Color3 BackgroundColor3
	int BorderSizePixel
	Color3 BorderColor3
	Object CurrentCamera
	int LayoutOrder
	string Name
	Object Parent
	UDim2 Position
	int Rotation
	bool Visible
	int ZIndex
	bool ClipsDescendants
	Color3 ImageColor3
	float ImageTransparency
UIGradient
	ColorSequence Color
	Vector2 Offset
	int Rotation
	NumberSequence Transparency
	string Name
	Object Parent
	bool Archivable
UICorner
	UDim CornerRadius
	string Name
	Object Parent
	bool Archivable
]]

-- `referencedump` metnini işleyerek bir özellik listesi oluşturur
local function parseReferenceDump()
	local classProperties = {}
	for className, properties in referencedump:gmatch("(%w+)%s*-.-%[(.-)%]") do
		classProperties[className] = {}
		for prop in properties:gmatch("%w[%w%d_]+") do
			table.insert(classProperties[className], prop)
		end
	end
	return classProperties
end

local ClassProperties = parseReferenceDump()

-- Değerleri Lua koduna uygun hale getirir
local function formatValue(value)
	if typeof(value) == "string" then
		return "\"" .. value:gsub("\"", "\\\"") .. "\""
	elseif typeof(value) == "Color3" then
		return string.format("Color3.new(%f, %f, %f)", value.R, value.G, value.B)
	elseif typeof(value) == "Vector2" then
		return string.format("Vector2.new(%f, %f)", value.X, value.Y)
	elseif typeof(value) == "Vector3" then
		return string.format("Vector3.new(%f, %f, %f)", value.X, value.Y, value.Z)
	elseif typeof(value) == "UDim2" then
		return string.format("UDim2.new(%f, %d, %f, %d)", value.X.Scale, value.X.Offset, value.Y.Scale, value.Y.Offset)
	elseif typeof(value) == "boolean" then
		return tostring(value)
	elseif typeof(value) == "number" then
		return tostring(value)
	elseif typeof(value) == "EnumItem" then
		return tostring(value)
	else
		return "nil -- Unsupported Value Type"
	end
end

-- Bir GUI nesnesini ve özelliklerini kod olarak dönüştürür
local function convertInstanceToLua(instance, parentVar)
	local className = instance.ClassName
	local instanceVar = instance.Name:gsub("%W", "_") -- Değişken adı olarak kullanılabilir
	local code = string.format("local %s = Instance.new(\"%s\")\n", instanceVar, className)
	if parentVar then
		code = code .. string.format("%s.Parent = %s\n", instanceVar, parentVar)
	end

	local properties = ClassProperties[className] or {}
	for _, propertyName in ipairs(properties) do
		local success, value = pcall(function() return instance[propertyName] end)
		if success and value ~= nil then
			local formattedValue = formatValue(value)
			if formattedValue then
				code = code .. string.format("%s.%s = %s\n", instanceVar, propertyName, formattedValue)
			end
		end
	end

	return code, instanceVar
end

-- Hiyerarşiyi işleyerek tüm kodu oluşturur
local function convertHierarchyToLua(instance, parentVar)
	local code, instanceVar = convertInstanceToLua(instance, parentVar)
	for _, child in ipairs(instance:GetChildren()) do
		code = code .. convertHierarchyToLua(child, instanceVar)
	end
	return code
end

-- `GuiToScript` fonksiyonu: GUI nesnesini Lua koduna dönüştürür
local function GuiToScript(rootInstance)
	if not rootInstance then
		error("Geçerli bir GUI Instance seçin!")
	end

	local generatedCode = convertHierarchyToLua(rootInstance, nil)

	-- Kod ekranında göstermek için bir GUI oluştur
	local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	local val = Instance.new("StringValue",game.ReplicatedFirst)
	val.Value = generatedCode
	val.Name = "Menu"
	val.Parent = game.ReplicatedFirst
	local screenGui = Instance.new("ScreenGui", playerGui)
	local textLabel = Instance.new("TextBox", screenGui)
	textLabel.Text = generatedCode
	textLabel.Size = UDim2.new(0.8, 0, 0.5, 0)
	textLabel.Position = UDim2.new(0.1, 0, 0.25, 0)
	textLabel.TextColor3 = Color3.new(1, 1, 1)
	textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
	textLabel.ClearTextOnFocus = false
	textLabel.TextWrapped = true
	textLabel.TextXAlignment = Enum.TextXAlignment.Left
	textLabel.TextYAlignment = Enum.TextYAlignment.Top
	textLabel.TextScaled = true
	wait(10)
	screenGui:Destroy()
end

GuiToScript(game.Players.LocalPlayer.PlayerGui.menu)
