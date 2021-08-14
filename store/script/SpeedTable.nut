#���ӹ� �ٶȱ� Client#

local g_LocalVehicle = null;
local g_SpeedTableLerpTime = 0.2;
local g_ZeroVector = VectorScreen(0, 0), g_FullColour = Colour(255, 255, 255, 255);

function Script::ScriptProcess() {
	//ÿ֡ͬ����鲢ˢ�±����ؾ�
	CheckAndUpdateVehicleTableProc();
}

function GUI::GameResize( width, height ){
	//���ݷֱ��ʽ���UI����Ӧ
	CheckAndUpdateVehicleTableUI();
}

function Server::ServerData(stream)
{
	//��Ҫ����CS�������������ؾ߼�ʻ״̬
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
	//����UIԪ�ؼ�
	Ring = null
	Needle = null
}

function CreateSpeedTableElements( posX = 25, posY = 25 )
{
	//��ʼ��UIԪ������
	SpeedTableElement.Ring = GUISprite("Ring.png", g_ZeroVector, g_FullColour);
	SpeedTableElement.Needle = GUISprite("Needle.png", VectorScreen( posX, posY ), g_FullColour);
	
	SpeedTableElement.Ring.AddChild(SpeedTableElement.Needle);
	SpeedTableElement.Needle.Pos = g_ZeroVector;
	local tempScale = SpeedTableElement.Ring.Size;
	SpeedTableElement.Needle.RotationCentre = VectorScreen(tempScale.X / 2, tempScale.Y / 2);
	
	//��������һ������Ӧ
	CheckAndUpdateVehicleTableUI();
}

function RemoveSpeedTableElements()
{
	//ɾ��UIԪ������
	SpeedTableElement.Ring = null;
	SpeedTableElement.Needle = null;
}

function CheckAndUpdateVehicleTableProc()
{
	//����Ƿ����ڼ�ʻ����������³��ٶ�
	if( g_LocalVehicle )
	{
		local speedMagnitude = sqrt( g_LocalVehicle.Speed.X * g_LocalVehicle.Speed.X + g_LocalVehicle.Speed.Y * g_LocalVehicle.Speed.Y + g_LocalVehicle.Speed.Z * g_LocalVehicle.Speed.Z );
		
		if( SpeedTableElement.Ring )
		{
			SpeedTableElement.Needle.Rotation = Lerp(SpeedTableElement.Needle.Rotation, speedMagnitude * 200, g_SpeedTableLerpTime); //Ĭ��200����ƫ��ֵ
		}
	}
}

function CheckAndUpdateVehicleTableUI()
{
	//���UIԪ�ؼ��Ƿ���ڣ�����������Ӧ��Ĭ�����½�25ƫ�ƣ�
	if( !SpeedTableElement.Ring ) return;
	
	local tempScale = SpeedTableElement.Ring.Size, width = GUI.GetScreenSize().X, height = GUI.GetScreenSize().Y;
	SpeedTableElement.Ring.Pos = VectorScreen( (width - tempScale.X) - 25, (height - tempScale.Y) - 25);
}

function Lerp( a, b, t )
{
	//��ֵ����
	return a+(b-a)*t;
}