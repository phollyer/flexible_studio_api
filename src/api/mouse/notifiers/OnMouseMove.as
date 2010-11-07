package api.mouse.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.mouse.notifiers.OnMouseMoveEvent;
	import api.mouse.Mouse;
	
	[Event(name="result", type="api.events.mouse.onMouseMove.OnMouseMoveEvent")]
	[Bindable]
	public class OnMouseMove extends Mouse
	{
		// Results
		public var sx:Number = 0;
		public var sy:Number = 0;
		public var x:Number = 0;
		public var y:Number = 0;
		
		public function OnMouseMove(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Mouse.setNotify( {event:"onMouseMove"}
								   ,{callback:actionComplete, errorSTR:"onMouseMoveError", code:"29010"} );
		}
		}		
		override protected function sendResult( r:Object ):void
		{
			var __r:Array = r.result.split( COMMA );
			
			x = Number( __r[ 0 ] );
			y = Number( __r[ 1 ] );
			sx = Number( __r[ 2 ] );
			sy = Number( __r[ 3 ] );
			
			var e : OnMouseMoveEvent = new OnMouseMoveEvent( OnMouseMoveEvent.RESULT );
			e.sx = sx;
			e.sy = sy;
			e.x = x;
			e.y = y;
			dispatchEvent( e );
		}
	}
}