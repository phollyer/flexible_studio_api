package api.mouse.notifiers
{
	import api.events.mouse.notifiers.OnMouseMoveEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.mouse.notifiers.OnMouseMoveEvent.RESULT
	*/
	[Event(name="result", type="api.events.mouse.onMouseMove.OnMouseMoveEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_onMouseMove.html Northcode Help Documentation
	*/
	public class OnMouseMove extends Mouse
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var sx:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var sy:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var x:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var y:Number = 0;
		
		/**
		* Constructor for Mouse.OnMouseMove()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_onMouseMove.html Northcode Help Documentation
		*/
		public function OnMouseMove(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Mouse.setNotify( {event:"onMouseMove"}
								   ,{callback:actionComplete, errorSTR:"onMouseMoveError", code:"29010"} );
		}	
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
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