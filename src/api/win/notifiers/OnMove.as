package api.win.notifiers
{
	import api.events.win.notifiers.OnMoveEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.notifiers.OnMoveEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.onMove.OnMoveEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onMove.html Northcode Help Documentation
	*/
	public class OnMove extends Win
	{
		// Result
		public var x:Number = -1;
		public var y:Number = -1;
		
		/**
		* Constructor for Win.OnMove()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onMove.html Northcode Help Documentation
		*/
		public function OnMove(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onMove"}
								 ,{callback:actionComplete, errorSTR:"onMoveError", code:"6039"} );
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
			var __a:Array = r.result.split( COMMA );
			x = Number( __a[ 0 ] );
			y = Number( __a[ 1 ] );
			
			var e : OnMoveEvent = new OnMoveEvent( OnMoveEvent.RESULT );
			e.y = y;
			e.x = x;
			dispatchEvent( e );
		}		
	}
}