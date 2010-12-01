package api.flash.getStageSize
{
	import api.events.flash.getStageSize.GetStageSizeEvent;

	import api.flash.Flash;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched if the Property <code>path</code> has not been supplied.
	*
	* @eventType api.events.SWFStudioEvent.MISSING_PATH
	*/
	[Event(name="missingPath" , type="api.events.SWFStudioEvent")]
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.flash.getStageSize.GetStageSizeEvent.RESULT
	*/
	[Event(name="result", type="api.events.flash.getStageSize.GetStageSizeEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getStageSize.html Northcode Help Documentation
	*/
	public class GetStageSize extends Flash
	{
		// Required
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
		public var height:Number = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var width:Number = 0;	
		
		/**
		* Constructor for Flash.GetStageSize()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getStageSize.html Northcode Help Documentation
		*/
		public function GetStageSize(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @param swfPath
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Flash_getStageSize.html Northcode Help Documentation
		*/
		public function getStageSize( swfPath:String = null ):void
		{
			path = compareStrings( swfPath , path );
			
			switch( path )
			{
				case null:
					missingPath();
					break;
				default:
					ssCore.Flash.getStageSize( {path:path}
											  ,{callback:actionComplete, errorSTR:"getStageSizeError", code:"21004"} );
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
			height = Number( r.height );
			width = Number( r.width );
			
			var e : GetStageSizeEvent = new GetStageSizeEvent( GetStageSizeEvent.RESULT );
			e.height = height;
			e.width = width;
			dispatchEvent( e );
		}
	}
}