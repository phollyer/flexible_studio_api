package api.joystick.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.joystick.notifiers.OnJoyButtonMaskEvent;
	import api.joystick.Joystick;

	[Event(name="result", type="api.events.joystick.onJoyButtonMask.OnJoyButtonMaskEvent")]
	[Bindable]
	public class OnJoyButtonMask extends Joystick
	{
		// Results
		public var id:String = null;
		public var mask:String = null;
				
		public function OnJoyButtonMask(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Joystick.setNotify( {event:"onJoyButtonMask"}
									  ,{callback:actionComplete, errorSTR:"onJoyButtonMaskError", code:"24009"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			id = __r[ 0 ] 
			mask = __r[ 1];
			
			var e : OnJoyButtonMaskEvent = new OnJoyButtonMaskEvent( OnJoyButtonMaskEvent.RESULT );
			e.id = id;
			e.mask = mask;
			dispatchEvent( e );
		}
	}
}