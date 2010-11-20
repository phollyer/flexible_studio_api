package api.joystick.getInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.getInfo.GetInfoEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.getInfo.GetInfoEvent")]
	[Bindable]
	public class GetInfo extends Joystick
	{
		// Result
		public var xml:XML = null;
		
		public function GetInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getInfo():void
		{
			ssCore.Joystick.getInfo( {}
									,{callback:actionComplete, errorSTR:"getInfoError", code:"24000"} );
		}
		override protected function sendResult( r:Object ):void
		{
			xml = XML( r.result );
			
			var e : GetInfoEvent = new GetInfoEvent( GetInfoEvent.RESULT );
			e.info = xml;
			dispatchEvent( e );
		}
	}
}