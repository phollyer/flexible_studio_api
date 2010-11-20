package api.keyboard.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.keyboard.notifiers.OnKeyEvent;
	import api.keyboard.Keyboard;

	[Event(name="result", type="api.events.keyboard.onKey.OnKeyEvent")]
	[Bindable]
	public class OnKey extends Keyboard
	{
		// Results
		public var alt:Boolean = false;
		public var blocked:Boolean = false;
		public var ctrl:Boolean = false;
		public var keycode:String = null;
		public var shift:Boolean = false;
		public var state:Boolean = false;
		
		public function OnKey(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Keyboard.setNotify( {event:"onKey"}
									  ,{callback:actionComplete, errorSTR:"onKeyError", code:"25010"} );
		}
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			
			blocked = convertBinaryToBoolean( Number( __r[ 0 ] ) );
			state = convertBinaryToBoolean( Number( __r[ 1 ] ) );
			keycode = __r[ 2 ];
			alt = convertBinaryToBoolean( Number( __r[ 3 ] ) );
			shift = convertBinaryToBoolean( Number( __r[ 4 ] ) );
			ctrl = convertBinaryToBoolean( Number( __r[ 5 ] ) );
			
			var e : OnKeyEvent = new OnKeyEvent( OnKeyEvent.RESULT );
			e.alt = alt;
			e.blocked = blocked;
			e.ctrl = ctrl;
			e.keycode = keycode;
			e.shift = shift;
			e.state = state;
			dispatchEvent( e );
		}
	}
}