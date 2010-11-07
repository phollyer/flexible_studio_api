package api.splash.sendData
{
	import flash.events.IEventDispatcher;
	import api.splash.Splash;

	[Event(name="missingData" , type="api.events.SWFStudioEvent")]
	[Bindable]
	public class SendData extends Splash
	{
		public var data:String = null;
		
		public function SendData(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function sendData( dataString:String ):void
		{
			data = compareStrings( dataString , data );
			switch( data )
			{
				case null:
					missingData();
					break;
				default:
					ssCore.Splash.sendData( {data:data} , {callback:actionComplete, errorSTR:"sendDataError", code:"5002"} );
			}
		}
	}
}