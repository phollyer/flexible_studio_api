package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.OnJoyPOVEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.onJoyPOV.OnJoyPOVEvent")]
	[Bindable]
	public class OnJoyPOV extends Joystick
	{
		// Results
		public var id:String = null;
		public var pov:Number = -1;
				
		public function OnJoyPOV(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyPOV"}
									  ,{callback:actionComplete, errorSTR:"onJoyPOVError", code:"24006"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			id = __r[ 0 ];
			pov = Number( __r[ 1 ] );
			
			var e : OnJoyPOVEvent = new OnJoyPOVEvent( OnJoyPOVEvent.RESULT );
			e.id = id;
			e.pov = pov;
			dispatchEvent( e );
		}
	}
}