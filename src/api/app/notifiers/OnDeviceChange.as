package api.app.notifiers
{
	import flash.events.IEventDispatcher;
	
	import api.app.App;
	
	import api.events.app.notifiers.OnDeviceChangeEvent;
	
	[Event(name="result", type="api.events.app.onDeviceChange.OnDeviceChangeEvent")]
	[Bindable]
	public class OnDeviceChange extends App
	{
		// Results
		public var action:String = null;
		public var device:String = null;
		public var drive:String = null;
		
		public function OnDeviceChange(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.App.setNotify( {event:App.ON_DEVICE_CHANGE} , {callback:actionComplete, errorSTR:"onDeviceChangeError", code:"8027"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __a:Array = r.result.split( "," );
			action = __a[ 1 ];
			device = __a[ 0 ];
			drive = __a[ 2 ];
			
			var e : OnDeviceChangeEvent = new OnDeviceChangeEvent( OnDeviceChangeEvent.RESULT );
			e.action = action;
			e.device = device;
			e.drive = drive;
			dispatchEvent( e );
		}
		
	}
}