package api.flash.getFrameRate
{
	import api.events.flash.getFrameRate.GetFrameRateEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.flash.getFrameRate.GetFrameRateEvent.RESULT
	*/
	[Event(name="result", type="api.events.flash.getFrameRate.GetFrameRateEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getFrameRate.html Northcode Help Documentation
	*/
	public class GetFrameRate extends Flash
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
		public var frameRate:Number = 0;	
		
		/**
		* Constructor for Flash.GetFrameRate()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getFrameRate.html Northcode Help Documentation
		*/
		public function GetFrameRate(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getFrameRate.html Northcode Help Documentation
		*/
		public function getFrameRate():void
		{
			switch( path )
			{
				case null:
					ssCore.Flash.getFrameRate( {}
											  ,{callback:actionComplete, errorSTR:"getFrameRateError", code:"21003"} );
					break;
				default:
					ssCore.Flash.getFrameRate( {path:path}
											  ,{callback:actionComplete, errorSTR:"getFrameRateError", code:"21003"} );
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
			frameRate = Number( r.result );
			
			var e : GetFrameRateEvent = new GetFrameRateEvent( GetFrameRateEvent.RESULT );
			e.frameRate = frameRate;
			dispatchEvent( e );
		}
	}
}