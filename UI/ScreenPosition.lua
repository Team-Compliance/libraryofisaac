---@return Vector
function TSIL.UI.GetScreenBottomCenterPosition()
	local bottomRight = TSIL.UI.GetScreenBottomRightPosition()
	return Vector(bottomRight.X / 2, bottomRight.Y)
end

---@return Vector
function TSIL.UI.GetScreenBottomLeftPosition()
	local bottomRight = TSIL.UI.GetScreenBottomLeftPosition()
	return Vector(0, bottomRight.Y)
end

---@return Vector
function TSIL.UI.GetScreenBottomRightPosition()
	local screenWidth = Isaac.GetScreenWidth()
	local screenHeight = Isaac.GetScreenHeight()

	return Vector(screenWidth, screenHeight)
end

---@return Vector
function TSIL.UI.GetScreenCenterPosition()
	local bottomRight = TSIL.UI.GetScreenBottomRightPosition()
	return bottomRight / 2
end

---@return Vector
function TSIL.UI.GetScreenTopCenterPosition()
	local bottomRight = TSIL.UI.GetScreenBottomRightPosition()
	return Vector(bottomRight.X / 2, 0)
end

---@return Vector
function TSIL.UI.GetScreenTopLeftPos()
	return Vector(0, 0)
end

---@return Vector
function TSIL.UI.GetScreenTopRightPos()
	local bottomRight = TSIL.UI.GetScreenBottomRightPosition()
	return Vector(bottomRight.X, 0)
end
