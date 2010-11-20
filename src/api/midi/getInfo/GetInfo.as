package api.midi.getInfo
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.midi.getInfo.GetInfoEvent;
	import api.midi.Midi;
	
	[Event(name="result", type="api.events.midi.getInfo.GetInfoEvent")]
	[Bindable]
	public class GetInfo extends Midi
	{
		// Result
		public var deviceData:XML = null;
		
		public function GetInfo(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getInfo():void
		{
			ssCore.Midi.getInfo( {}
								,{callback:actionComplete, errorSTR:"getInfoError", code:"28000"} );
		}
		override protected function sendResult( r:Object ):void
		{
			deviceData = XML( r.result );
			
			var e : GetInfoEvent = new GetInfoEvent( GetInfoEvent.RESULT );
			e.deviceData = deviceData;
			dispatchEvent( e );
		}
	}
}