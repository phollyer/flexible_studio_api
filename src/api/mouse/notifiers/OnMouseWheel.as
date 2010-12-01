package api.mouse.notifiers
{
	import api.events.mouse.notifiers.OnMouseWheelEvent;

	import api.mouse.Mouse;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.mouse.notifiers.OnMouseWheelEvent.RESULT
	*/
	[Event(name="result", type="api.events.mouse.onMouseWheel.OnMouseWheelEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_onMouseWheel.html Northcode Help Documentation
	*/
	public class OnMouseWheel extends Mouse
	{
		// Results
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var keymask:String = null;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var scroll:Number = 0;
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
		* Constructor for Mouse.OnMouseWheel()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Mouse_onMouseWheel.html Northcode Help Documentation
		*/
		public function OnMouseWheel(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Mouse.setNotify( {event:"onMouseWheel"}
								   ,{callback:actionComplete, errorSTR:"onMouseWheelError", code:"29011"} );
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