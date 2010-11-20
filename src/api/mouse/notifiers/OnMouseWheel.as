package api.mouse.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.mouse.notifiers.OnMouseWheelEvent;
	import api.mouse.Mouse;
	
	[Event(name="result", type="api.events.mouse.onMouseWheel.OnMouseWheelEvent")]
	[Bindable]
	public class OnMouseWheel extends Mouse
	{
		// Results
		public var keymask:String = null;
		public var scroll:Number = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function OnMouseWheel(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Mouse.setNotify( {event:"onMouseWheel"}
								   ,{callback:actionComplete, errorSTR:"onMouseWheelError", code:"29011"} );
		}
		}		
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			
			keymask = __r[ 0 ];
			scroll = Number( __r[ 1 ] );
			x = Number( __r[ 2 ] );
			y = Number( __r[ 3 ] );
			
			var e : OnMouseWheelEvent = new OnMouseWheelEvent( OnMouseWheelEvent.RESULT );
			e.keymask = keymask;
			e.scroll = scroll;
			e.x = x;
			e.y = y;
			dispatchEvent( e );
		}
	}
}