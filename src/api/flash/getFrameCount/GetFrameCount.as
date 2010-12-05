package api.flash.getFrameCount
{
	import api.events.flash.getFrameCount.GetFrameCountEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.flash.getFrameCount.GetFrameCountEvent.RESULT
	*/
	[Event(name="result", type="api.events.flash.getFrameCount.GetFrameCountEvent")]
	[Bindable]
	/**
	* Retrieve the frame count from the header of an SWF file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getFrameCount.html Northcode Help Documentation
	*/
	public class GetFrameCount extends Flash
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var path:String = null;
		
		// Result
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var totalFrames:Number = 0;		
		
		/**
		* Constructor for Flash.GetFrameCount()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getFrameCount.html Northcode Help Documentation
		*/
		public function GetFrameCount(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the frame count from the header of an SWF file.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getFrameCount.html Northcode Help Documentation
		*/
		public function getFrameCount():void
		{
			switch( path )
			{
				case null:
					ssCore.Flash.getFrameCount( {}
											   ,{callback:actionComplete, errorSTR:"getFrameCountError", code:"21002"} );
					break;
				default:
					ssCore.Flash.getFrameCount( {path:path}
											   ,{callback:actionComplete, errorSTR:"getFrameCountError", code:"21002"} );
			}
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
			totalFrames = Number( r.result );
			
			var e : GetFrameCountEvent = new GetFrameCountEvent( GetFrameCountEvent.RESULT );
			e.totalFrames = totalFrames
			dispatchEvent( e );
		}
	}
}