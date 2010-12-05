package api.flash.getBackColor
{
	import api.events.flash.getBackColor.GetBackColorEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.flash.getBackColor.GetBackColorEvent.RESULT
	*/
	[Event(name="result", type="api.events.flash.getBackColor.GetBackColorEvent")]
	[Bindable]
	/**
	* Retrieve the background color encoded in the header of an SWF file.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getBackColor.html Northcode Help Documentation
	*/
	public class GetBackColor extends Flash
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
		* @defaultValue <code>null</code>
		*/
		public var color:String = null;		
		
		/**
		* Constructor for Flash.GetBackColor()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getBackColor.html Northcode Help Documentation
		*/
		public function GetBackColor(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Retrieve the background color encoded in the header of an SWF file.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getBackColor.html Northcode Help Documentation
		*/
		public function getBackColor():void
		{
			switch( path )
			{
				case null:
					ssCore.Flash.getBackColor( {}
											  ,{callback:actionComplete, errorSTR:"getBackColorError", code:"21001"} );
					break;
				default:
					ssCore.Flash.getBackColor( {path:path}
											  ,{callback:actionComplete, errorSTR:"getBackColorError", code:"21001"} );
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
			color = r.result;
			
			var e : GetBackColorEvent = new GetBackColorEvent( GetBackColorEvent.RESULT );
			e.color = color;
			dispatchEvent( e );
		}
	}
}