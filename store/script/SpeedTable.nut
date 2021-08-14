#嘤嘤怪 速度表 Client#

local g_LocalVehicle = null;
local g_SpeedTableLerpTime = 0.2;
local g_ZeroVector = VectorScreen(0, 0), g_FullColour = Colour(255, 255, 255, 255);

function Script::ScriptProcess() {
	//每帧同步检查并刷新本地载具
	CheckAndUpdateVehicleTableProc();
}

function GUI::GameResize( width, height ){
	//根据分辨率进行UI自适应
	CheckAndUpdateVehicleTableUI();
}

function Server::ServerData(stream)
{
	//主要用于CS交互，检测玩家载具驾驶状态
    local StreamReadString = stream.ReadString();

	switch( StreamReadString )
	{
		case "onPlayerEnterVehicle":
			g_LocalVehicle = World.FindVehicle( stream.ReadInt() );
			CreateSpeedTableElements();
		break;
		case "onPlayerExitVehicle":
			g_LocalVehicle = null;
			RemoveSpeedTableElements();
		break;
	}
}

SpeedTableElement <-
{
	//定义UI元素集
	Ring = null
	Needle = null
}

function CreateSpeedTableElements( posX = 25, posY = 25 )
{
	//初始化UI元素数据
	SpeedTableElement.Ring = GUISprite("Ring.png", g_ZeroVector, g_FullColour);
	SpeedTableElement.Needle = GUISprite("Needle.png", VectorScreen( posX, posY ), g_FullColour);
	
	SpeedTableElement.Ring.AddChild(SpeedTableElement.Needle);
	SpeedTableElement.Needle.Pos = g_ZeroVector;
	local tempScale = SpeedTableElement.Ring.Size;
	SpeedTableElement.Needle.RotationCentre = VectorScreen(tempScale.X / 2, tempScale.Y / 2);
	
	//创建后检查一下自适应
	CheckAndUpdateVehicleTableUI();
}

function RemoveSpeedTableElements()
{
	//删除UI元素数据
	SpeedTableElement.Ring = null;
	SpeedTableElement.Needle = null;
}

function CheckAndUpdateVehicleTableProc()
{
	//检测是否正在驾驶，如是则更新车速度
	if( g_LocalVehicle )
	{
		local speedMagnitude = sqrt( g_LocalVehicle.Speed.X * g_LocalVehicle.Speed.X + g_LocalVehicle.Speed.Y * g_LocalVehicle.Speed.Y + g_LocalVehicle.Speed.Z * g_LocalVehicle.Speed.Z );
		
		if( SpeedTableElement.Ring )
		{
			SpeedTableElement.Needle.Rotation = Lerp(SpeedTableElement.Needle.Rotation, speedMagnitude * 200, g_SpeedTableLerpTime); //默认200代表偏移值
		}
	}
}

function CheckAndUpdateVehicleTableUI()
{
	//检查UI元素集是否存在，并进行自适应（默认右下角25偏移）
	if( !SpeedTableElement.Ring ) return;
	
	local tempScale = SpeedTableElement.Ring.Size, width = GUI.GetScreenSize().X, height = GUI.GetScreenSize().Y;
	SpeedTableElement.Ring.Pos = VectorScreen( (width - tempScale.X) - 25, (height - tempScale.Y) - 25);
}

function Lerp( a, b, t )
{
	//插值函数
	return a+(b-a)*t;
}