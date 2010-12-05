package api.win.getClientSize
{
	import api.events.win.getClientSize.GetClientSizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.getClientSize.GetClientSizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.getClientSize.GetClientSizeEvent")]
	[Bindable]
	/**
	* Get the current size of the application window, excluding the size of the title bar and borders (this is the 'client' area).
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getClientSize.html Northcode Help Documentation
	*/
	public class GetClientSize extends Win
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var height:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var width:Number = 0;
		
		/**
		* Constructor for Win.GetClientSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getClientSize.html Northcode Help Documentation
		*/
		public function GetClientSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Get the current size of the application window, excluding the size of the title bar and borders (this is the 'client' area).
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getClientSize.html Northcode Help Documentation
		*/
		public function getClientSize():void
		{
			ssCore.Win.getClientSize( {}
									 ,{callback:actionComplete, errorSTR:"getClientSizeError", code:"6003"} );
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
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetClientSizeEvent = new GetClientSizeEvent( GetClientSizeEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}