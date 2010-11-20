package api.win.getSize
{
	import api.events.win.getSize.GetSizeEvent;

	import api.win.Win;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.win.getSize.GetSizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.win.getSize.GetSizeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getSize.html Northcode Help Documentation
	*/
	public class GetSize extends Win
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
		* Constructor for Win.GetSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getSize.html Northcode Help Documentation
		*/
		public function GetSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Win_getSize.html Northcode Help Documentation
		*/
		public function getSize():void
		{
			ssCore.Win.getSize( {}
							   ,{callback:actionComplete, errorSTR:"getSizeError", code:"6005"} );
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
			
			var e : GetSizeEvent = new GetSizeEvent( GetSizeEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}