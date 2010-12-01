package api.win.notifiers
{
	import api.events.win.notifiers.OnResizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.notifiers.OnResizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.onResize.OnResizeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onResize.html Northcode Help Documentation
	*/
	public class OnResize extends Win
	{
		// Result
		public var clientHeight:Number = -1;
		public var clientWidth:Number = -1;
		public var height:Number = -1;
		public var width:Number = -1;
		
		/**
		* Constructor for Win.OnResize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_onResize.html Northcode Help Documentation
		*/
		public function OnResize(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Win.setNotify( {event:"onResize"}
								 ,{callback:actionComplete, errorSTR:"onResizeError", code:"6040"} );
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
			width = Number( __a[ 0 ] );
			height = Number( __a[ 1 ] );
			clientWidth = Number( __a[ 2 ] );
			clientHeight = Number( __a[ 3 ] );
			
			var e : OnResizeEvent = new OnResizeEvent( OnResizeEvent.RESULT );
			e.clientHeight = clientHeight;
			e.clientWidth = clientWidth;
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}		
	}
}